<cfscript>
    writeHr("1. Find index of pattern");
    index = reFind("a{2,4}", "hahahaaahaaaahaaaaahhh");


    writeLn('03.01. reFind("a{2,4}", "hahahaaahaaaahaaaaahhh")');
    writeLn("03.01. Result is: #index#");  // 6


    writeHr("2. Find index of pattern - not found");
    index = reFind("b{2,4}", "hahahaaahaaaahaaaaahhh");
    writeLn('03.02 reFind("b{2,4}", "hahahaaahaaaahaaaaahhh");');
    writeLn("03.02. Result is: #index#");

    data4 = "DataPlan1GB";
    writeHr(
        "4. Replace #data4# >>> #reReplace(
            data4, "(DataPlan)(\d+GB)", "\2\1" , "All"
        )#");

    data5 = "DataPlan50GB9050";
    writeHr(
        "5. Replace #data5# >>> #reReplace(
            data5, "(DataPlan)(\d+GB)", "\2\1" , "All"
        )#");


    data6 = "The quick brown Fox jumps over the lazy dog.";
    writeLn("6. Match #data6#");
    writeDump(reMatch("([A-Z]\w+)", data6));


    data7 = '<!-- "" ---></TD></TD></TD></TH></TH></TH></TR></TR></TR></TABLE></TABLE></TABLE></A></ABBREV></ACRONYM></ADDRESS></APPLET></AU></B></BANNER></BIG></BLINK></BLOCKQUOTE></BQ></CAPTION></CENTER>';
    writeLog("7. Comments replace: #reReplace(data7, '<!-- "" --->', '', 'all')#");



</cfscript>
