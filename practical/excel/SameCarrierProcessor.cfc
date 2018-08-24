import ecgateway.utils.gateway.QueryRunner;

/**
 * This component expects a very specific format of Excel file. It expects to
 * have the data in the first sheet. It expects the first row to be the header.
 * First column is expected to be blank and skipped.
 */
component SameCarrierCommentProcessor {

    COL_START_IDX = 2;
    ROW_START_IDX = 2;
    COL_LAST_IDX = 6;
    MSN_IDX = 5;

    SameCarrierProcessor function init(
            QueryRunner queryRunner = new QueryRunner)
    {
        variables.queryRunner = arguments.queryRunner;
        return this;
    }

    /**
     * @filePath complete file path of the Excel file.
     * @return array of struct.  Struct has the keys:
     */
    Array function parse(required String filePath)
    {
        var spreadsheet = spreadsheetRead(arguments.filePath);

        var columns = calculateColumns(spreadsheet);
        return readRecords(spreadsheet, columns);
    }

    Void function processAll(required Array records)
    {
        attachClientAndPhoneIds(arguments.records);
    }

    /**
     * Retrieves the client ID and Phone ID from compass DB and updates our
     * array of records in memory for later use.
     */
    private Void function attachClientAndPhoneIds(required Array records)
    {
        var msnList = "";
        for (var record in arguments.records) {
            msnList = listAppend(msnList, record["PortingMSN"]);
        }

        var queryResult = variables.queryRunner.execute(
            name = "updatePhone",
            datasource = request.ds3,
            sql = "
                SELECT phoneid as phone_id
                     , fkclientid as client_id
                     , phonenumber as msn
                  FROM phones
                 WHERE phonenumber IN (:msns)
                  ",
            params = [
                {
                    name  = "msns",
                    value = msnList,
                    list  = true
                }
            ]
        );

        var msnClientAndPhone = {};
        for (var record in queryResult.getRecords()) {
            msnClientAndPhone[record.msn] = {
                clientId: record.client_id,
                phoneId: record.phone_id
            };
        }

        for (var record in arguments.records) {
            var msnRelatives = msnClientAndPhone[record["PortingMSN"]];
            record["Client Id"] = msnRelatives.clientId;
            record["Phone Id"] = msnRelatives.phoneId;
        }

        writeDump(arguments.records);
    }

    /**
     *
     */
    private Void function updatePhones(
            required numeric phoneId,
            required numeric status)
    {
        // var lastStatusValue = calcLastStatus(
        //     arguments.status,
        //     arguments.reason_choice_code
        // );

        var logisticsClause = "";
        if (updateLogisticsStatus(arguments.status)) {
            logisticsClause = ", logistics_status = :status"
        }

        variables.queryRunner.execute(
            name = "updatePhone",
            datasource = request.ds3,
            sql = "
                    UPDATE phones
                       SET last_comment_statusid = :last_status_id
                           #logisticsClause#
                           , last_comment_date = NOW()
                           , DateTimeUpdated = NOW()
                     WHERE phoneid = :phone_id
                  ",
            params = [
                {
                    name  = "phone_id",
                    value = arguments.phoneId
                },
                {
                    name  = "status",
                    value = arguments.status
                }
            ]
        );
    }

    /**
     * Update the logistics status if the status is one.
     * @status comment status field.
     */
    private boolean function updateLogisticsStatus(required Numeric status)
    {
        if (arguments.status > 0) {
            var queryResult = variables.queryRunner.execute(
                name = "selectStatus",
                datasource = request.ds3,
                sql = "
                    SELECT logistics
                      FROM statuses
                     WHERE statusid = :status
                      ",
                params = [
                    {
                        name  = "status",
                        value = arguments.status
                    }
                ]
            );
            return queryResult.recordCount > 0 && queryResult.logistics == 1;
        }
        return false;
    }

    /**
     * @clientId target client id.
     * @status comment status field.
     */
    Void function updateClient(
            required numeric clientId,
            required numeric status,
            required numeric reason_choice_code
            )
    {
        // var lastStatusValue = calcLastStatus(
        //     arguments.status,
        //     arguments.reason_choice_code
        // );

        variables.queryRunner.execute(
            name = "updateClient",
            datasource = request.ds3,
            sql = "
                UPDATE clients
                   SET
                       lastfkstatusid = :last_status_id
                       , laststatusdate = {d '#DateFormat(Now(),"YYYY-MM-DD")#'}
                       , DateTimeUpdated = NOW()
                 WHERE clientid = :client_id
                  ",
            params = [
                {
                    name  = "client_id",
                    value = arguments.clientId
                },
                {
                    name  = "last_status_id",
                    value = arguments.statusValue
                }
            ]
        );
    }

    /**
     * @status comment status.
     * @reason_choice_code a.k.a. outcome.
     */
    private Numeric function calcLastStatus(
            required Numeric status,
            required numeric reason_choice_code)
    {
        var statusIdVal = -1;
        if (arguments.status) > 0 {
            return arguments.status;
        } else {
            return arguments.reason_choice_code;
        }
    }

    private Void function insertComment(
            required Numeric clientId,
            required Numeric phoneId,
            required Numeric status,
            required Numeric reason_choice_code,
            required String comment)
    {
        var statusCol = arguments.status > 0 ? ", fkstatusid";
        var statusVal = arguments.status > 0 ? ", :status_id";

        variables.queryRunner.execute(
            name = "insertComment",
            datasource = request.ds3,
            sql = "
                INSERT INTO comments (
                    fkclientid
                  , fkphoneid
                  , dateadded
                  #statusCol#
                  , fktypecodesid
                  , comment
                  , addedby
                  , addedby_fkuserid
                ) VALUES (
                    :client_id
                    , :phone_id
                    , NOW()
                    #statusVal#
                   , :reason_choice_code
                   , :comment
                   , :name
                   , :userid
                 );
                  ",
            params = [
                {
                    name  = "client_id",
                    value = arguments.clientId
                }, {
                    name  = "phone_id",
                    value = arguments.phoneId
                }, {
                    name  = "reason_choice_code",
                    value = arguments.reason_choice_code
                }, {
                    name  = "comment",
                    value = arguments.comment
                }, {
                    name  = "name",
                    value = client.ecgateway_name
                }, {
                    name  = "userid",
                    value = client.ecgateway_userid
                }]
        );
    }

    /**
     * @spreadsheet excel object.
     * @columns list of column names.
     */
    private Array function readRecords(
            required any spreadsheet,
            required String columns)
    {
        var records = [];
        for (var rowIdx = ROW_START_IDX;;rowIdx += 1) {
            var msn = spreadsheetGetCellValue(spreadsheet, rowIdx, MSN_IDX);
            if (msn == "") {
                break;
            }
            var data = readRow(
                arguments.spreadsheet,
                arguments.columns,
                rowIdx,
                msn
            );
            arrayAppend(records, data);
        }
        return records;
    }

    private Struct function readRow(
            required any spreadsheet,
            required String columns,
            required Numeric rowIdx,
            required String msn)
    {
       var data = {};
        for (var colIdx = COL_START_IDX; colIdx <= COL_LAST_IDX; colIdx += 1) {
            var value = "";
            if (colIdx == MSN_IDX) {
                value = arguments.msn;
            } else {
                value = spreadsheetGetCellValue(
                    arguments.spreadsheet, rowIdx, colIdx
                );
            }
            data[listGetAt(arguments.columns, colIdx -1)] = value;
        }
        return data;
    }

    /**
     * Retrieves the column names from the first row of the sheet.
     * @spreadsheet excel object.
     */
    private String function calculateColumns(required any spreadsheet)
    {
        var columns = "";

        for (var colIdx = COL_START_IDX; colIdx <= COL_LAST_IDX; colIdx += 1) {
            columns = listAppend(
                columns,
                spreadsheetGetCellValue(spreadsheet, 1, colIdx)
            );
        }
        return columns;
    }

}