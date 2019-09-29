<!--- @CFLintIgnore VAR_TOO_SHORT --->
<cfscript>
    // 1. Loop an array of Struct
    struct1 = { name: 'first' };
    struct2 = { name: 'second' };
    array1 = [struct1, struct2];

    for (next in array1) {
        writeDump(serializeJSON(next));
    }

    array2 =['a', 'b']
    for (i=1;i<=arrayLen(array2);i=i+1) {
        writeOutput(array2[i]);
    }

    // 2. Loop a query
    for (row in myQuery) {
        writeOutput("<li>#row.platform#</li>");
    }


</cfscript>
