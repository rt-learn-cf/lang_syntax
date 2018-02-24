<cfscript>
    writeHr("1. Print an array using for each");
    fruits1 = [ "Apple", "Banana"];
    writeDump(fruits1);

    for (fruit in fruits1) {
        writeLn(fruit);
    }

    writeHr("2. Print an array by iterating with a control variable");
    fruits2 = [ "Apple", "Banana"];
    writeDump(fruits2);


    fruits3 = [ "Apple", "Banana"];
    writeHr("3. For Loop");
    for (i = 1; i<=arrayLen(fruits3); i++) {
        writeLn(fruits3[i]);
    }

    fruits4 = [ "Apple", "Banana"];
    writeHr("4. For in Loop");
    for (fruit in fruits4) {
        writeLn(fruit);
    }
</cfscript>
