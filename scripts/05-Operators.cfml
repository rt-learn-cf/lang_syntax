<cfscript>

    // 1. Logical OR operator
    writeLine("1. Logical OR Operator");

    result_1_1 = "no" || 1;
    writeLine("1.1.  ""no"" || 1 is  #result_1_1#"); // 1

    result_1_2 = 0 || 2;
    writeLine("1.2.  0 || 2 is #result_1_2#"); // 2


    // 2. Logical AND operator
    writeLine("1. Logical AND Operator");

    result_2_1 = 3 && 2;
    writeLine("2.1.  3 && 2 is #result_2_1#"); // 2

    result_2_2 = 0 && 3;
    writeLine("2.2.  0 && 3 is #result_2_2#"); // 0

</cfscript>
