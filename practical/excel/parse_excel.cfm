<cfscript>
    path = getDirectoryFromPath(getCurrentTemplatePath());
    filename = "Example of automatic Comments.xls";

    scp = new lang_app.practical.excel.SameCarrierProcessor();


    records = scp.parse("#path##filename#");
    writeDump(records);
</cfscript>
