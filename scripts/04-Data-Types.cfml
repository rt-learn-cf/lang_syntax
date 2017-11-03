<cfscript>
    EMPTY_STRING = "";
    ZERO_STRING = "0";

    // 1. Boolean =============================================================
    result_1_1 = 1 == 1;
    result_1_2 = "1" == 1;
    result_1_3 = '1' == 1;

    writeLine("1.1 1 == 1 is #(result_1_1)#");
    writeLine("1.2 ""1"" == 1 is #result_1_2#"); // '1' == 1 is equal
    writeLine("1.3 '1' == 1 is #result_1_3#"); // these are equal


    // 1.4. Yes, no evaluates as boolean expression.
    if ("yes") {
        writeLine("1.4. yes");
        // 1.5. writeLine(yes);  Variable YES is undefined.
    }

    // 1.6. expression evaluation is case insensitive
    if ("yEs") { // string has to evaluate to boolean, random string will error out.
        writeLine("1.6. yEs");
    }

    // 1.7.
    if ("yEs") { // string has to evaluate to boolean, random string will error out.
        writeLine("1.7. yEs");
    }


    // 2. Numeric =============================================================
    writeLine("2.1. Is 0 Numeric? #IsNumeric(0)#");
    writeLine("2.2. Is empty string Numeric? #IsNumeric(EMPTY_STRING)#");
    writeLine("2.3. Is ""0"" Numeric? #IsNumeric(ZERO_STRING)#");
    writeLine("2.4. Len(45) Is? #Len(45)#"); // 2



    private function writeLine(string message = "") {
        writeDump(message);
        writeOutput("<br>");
    }

</cfscript>