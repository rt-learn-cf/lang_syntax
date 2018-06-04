<cfscript>

    // bool1 = {};
    // if (bool1) { // Cannot convert the value of type class coldfusion.runtime.Struct to a boolean
    //     writeLn("Empty struct resolves to true");
    // } else {
    //     writeLn("Empty struct resolves to false");
    // }

    trueVal = ('1' == 1);
    writeLn(trueVal);
    writeLn("[#trueVal#]" == "[true]");

    // writeLn("Comparing 'true' and 'YES': #(true == trueVal)#");

    writeLn("Start if numeric tests");
    if (-1) {
        writeLn(-1);
    }

    if (0) {
        writeLn(0);
    }

    if (1) {
        writeLn(1);
    }
    writeLn("end if numeric tests");

    // writeLn(" #(true == trueVal)#");


    // writeLn("Comparing 'true' and 'YES': #(true == trueVal)#");




</cfscript>
