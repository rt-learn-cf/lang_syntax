<cfscript>
        var queryRunner = new ecgateway.utils.gateway.QueryRunner();
        queryRunner.execute(
            name="test",
            dataSource=request.ds,
            sql="UPDATE royce_test SET name = 'four' WHERE AGE = 4;"
        );
</cfscript>