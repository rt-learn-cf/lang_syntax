<cfscript>
    writeHr("1. Initialize an empty array");
    emptyArray1 = [];
    writeDump(emptyArray1);
    writeLn();


    writeHr("1.1 Initialize a 1-dimensional empty array");
    emptyArray2 = arrayNew(1);
    writeDump(emptyArray2);
    writeLn();


    writeHr("2. Initialize an array");
    writeLn();
    fruits = [ "Apple", "Banana"];
    writeLn("Fruits");
    writeDump(fruits);
    veggies = [ "Cabbage", "Cucumber"];
    writeLn("Veggies");
    writeDump(veggies);


    writeHr("3.1 Append two arrays by using the array method addAll");
    fruitsAndVeggies = [];
    fruitsAndVeggies.addAll(fruits);
    fruitsAndVeggies.addAll(veggies);
    writeDump(fruitsAndVeggies);


    writeHr("3.2 Append two arrays by using the array method arrayAppend");
    fruitsAndVeggies2 = ['carrot'];
    writeDump(arrayAppend(fruitsAndVeggies2, ['singkamas'], true));
    writeDump(fruitsAndVeggies2);


    writeHr("4. Initialize an array element");
    array4 = [];
    array4[4] = 'fourth';
    writeDump(array4);


    writeHr("4. Initialize an array from a comma separated string by uing the function listToArray(string)");
    arrayString = ListToArray('A,B,C,D');
    writeDump(arrayString);


    writeHr("5. Traverse an array, index starts at 1.");
    writeLn();
    for (i = 1;i <= arrayLen(arrayString);i++) {
        writeLn(arrayString[i]);
    }

    writeHr("6. Join array into string");
    array6 = [1, 2, 3];
    writeLn("[#arrayToList(array6, ' ')#]");



</cfscript>