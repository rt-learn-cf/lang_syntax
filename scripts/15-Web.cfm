<cfscript>
    writeHr('Read url parameters');
    // test name[alias]
    writeDump(encodeForURL('test[1]'));
    writeOutput('<br>');
    writeDump(url['test[1]']);


</cfscript>

