<cfscript>

    writeHr("1. Initialize a list");

    list1 = "ColdFusion Lists,ColdFusion Arrays,ColdFusion Structures";

    writeHr("2. combine 2 lists by using String concatenation");
    list2a = "Apple,Orange";
    list2b = "Brocolli,Spinach";
    list2c = list2a & "," & list2b;
    writeLn(list2c);

    writeHr("3. Using build in listAppend function");
    list3a = "Apple,Orange";
    list3b = "Brocolli,Spinach";
    list3c = "one";
    writeLn(listAppend(list3a, list3b, list3c));



</cfscript>

