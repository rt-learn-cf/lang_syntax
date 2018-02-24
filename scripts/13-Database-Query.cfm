<cfscript>
    list1 = arrayToList(['one', 'three']);

    sql = "
            SELECT *
              FROM royce_test
             WHERE name NOT IN (:sqlParam)
    ";

    params = [
        {
            name      = "sqlParam"
            , value     = list1
            , cfsqltype = "CF_SQL_VARCHAR"
            , list      = "yes"
        }
    ];

    queryRunner = new ecgateway.utils.gateway.QueryRunner();
    queryResult = queryRunner.execute(
        name = "test",
        datasource = "compass",
        sql = sql,
        params = params
    );

    writeDump(queryResult);
    writeDump(queryResult.getRecords());
</cfscript>