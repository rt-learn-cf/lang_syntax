<cfscript>
    writeLine("Print an array using for each");
    fruits = [ "Apple", "Banana"];
    writeDump(fruits);

    for (fruit in fruits) {
        writeLine(fruit);
    }
</cfscript>