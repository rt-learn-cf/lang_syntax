<cfscript>
    writeHr("1. Find index of pattern");
    index = reFind("a{2,4}", "hahahaaahaaaahaaaaahhh");


    writeLn('03.01. REFind("a{2,4}", "hahahaaahaaaahaaaaahhh")');
    writeLn("03.01. Result is: #index#");  // 6


    writeHr("2. Find index of pattern - not found");
    index = reFind("b{2,4}", "hahahaaahaaaahaaaaahhh");
    writeLn('03.02 REFind("b{2,4}", "hahahaaahaaaahaaaaahhh");');
    writeLn("03.02. Result is: #index#");

    data4 = "DataPlan1GB";
    writeHr(
        "4. Replace #data4# >>> #REReplace(
            data4, "(DataPlan)(\d+GB)", "\2\1" , "All"
        )#");

    data5 = "DataPlan50GB9050";
    writeHr(
        "5. Replace #data5# >>> #REReplace(
            data5, "(DataPlan)(\d+GB)", "\2\1" , "All"
        )#");

</cfscript>
