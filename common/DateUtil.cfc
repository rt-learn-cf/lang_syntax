import ecgateway.utils.gateway.QueryRunner;

/**
 *
 */
component DateUtil {
    /**
     * Return now in UTC.
     */
    Date function utcNow()
    {
        return dateConvert("Local2UTC", now());
    }

    /**
     * Generates date based on DB time.
     * @offset days offset, 0 for today.
     */
    Date function getDate(Numeric offset=0)
    {
        var queryResult = variables.queryRunner.execute(
            name="dbdate",
            dataSource=request.ds,
            sql="
                SELECT DATE(DATE_ADD(NOW() as db_date, INTERVAL #arguments.offset# DAY))
            "
        );
        return queryResult.getRecords()[0].db_date;
    };
}
