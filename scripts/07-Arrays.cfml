<cfscript>
    writeLine("<hr>Initialize an array");
    fruits = [ "Apple", "Banana"];
    writeDump(fruits);
    veggies = [ "Cabbage", "Cucumber"];
    writeDump(veggies);

    writeLine("<hr>Append two arrays by using the array method addAll");
    fruitsAndVeggies = [];
    fruitsAndVeggies.addAll(fruits);
    fruitsAndVeggies.addAll(veggies);

    writeDump(arrayAppend([1], [2], true));


    writeDump(fruitsAndVeggies);

    writeLine("<hr>Initialize an array from a comma separated string by uing the function listToArray(string)");
    arrayString = ListToArray('A,B,C,D');
    writeDump(arrayString);

    writeLine("<hr>Traverse an array, index starts at 1.");
    for (i = 1;i <= arrayLen(arrayString);i++) {
        writeLine(arrayString[i]);
    }

</cfscript>