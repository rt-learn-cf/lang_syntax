<cfscript>
    writeHr();
    writeLine("Print an array using for each");
    fruits1 = [ "Apple", "Banana"];
    writeDump(fruits1);

    for (fruit in fruits1) {
        writeLine(fruit);
    }

    writeHr();
    writeLine("Print an array by iterating with a control variable");
    fruits2 = [ "Apple", "Banana"];
    writeDump(fruits2);

    for (i=1;i<=arrayLen(fruits2);i++) {
        writeLine(fruits2[i]);
    }


</cfscript>