<cfscript>
    writeLn("Replace String Examples");
    writeLn("1. Replace single occurrence");
    writeLn("<code>replace('apple', 'P', 'd')</code> = #replace('apple', 'p', 'd')#");
    writeLn("1.a Replace all occurrence");
    writeLn("<code>replace('apple', 'P', 'd')</code> = #replace('apple', 'p', 'd', 'ALL')#");
    // Replace is case sensitive!

    writeLn("String Concatenation");
    writeLn("Hello" & "World");

    writeOutput("<hr>");

    writeHr("2. Check Substrings");
    string2 = "You and Me";
    writeLn(find("AND", string2));

    writeHr("3. Change Case");
    writeLn(lcase("Lower Case!"));
    writeLn(ucase("Upper Case!"));

    writeHr("4. Get Substring"); // TODO
    string4 = "You and Me";
    writeLn();

    writeHr("5. Trim");
    string5 = " You and Me   ";
    writeLn("[#trim(string5)#]");

    writeHr("6. Convert to number");
    string6a = " You and Me";
    try {
        writeLn("[#lsParseNumber(string6a)#]");
    } catch (Expression e) {
        writeLn("Unable to parse: [#string6a#]");
    }
    string6b = "101 dalmatians";
    try {
        writeLn("[#lsParseNumber(string6b)#]");
    } catch (Expression e) {
        writeLn("Unable to parse: [#string6b#]");
    }
    string6c = "42";
    try {
        writeLn("[#lsParseNumber(string6c)#]");
    } catch (Expression e) {
        writeLn("Unable to parse: [#string6c#]");
    }

    // writeHr("7. Parse XML");
    // string7 = '<!--[if gte mso 9]><m:brkBinSub m:val="--"/><![endif]-->';
    // writeLn("[#string7#]");
    // writeLn("[#encodeForXML(string7)#]");
    // string7a  = replace(string7, '-', '&##45;', 'ALL');
    // writeLn("7a [#encodeForXML(string7a)#]");
    // writeLn("[#xmlParse(string7)#]");

    writeHr("8. Java");
    string8 = "Java";
    writeLn(string8.getClass().getName());

    writeHr("9. To Number");
    string9 = "01234";
    writeLn(val(string9)); // #> 1234
    writeLn(val(""));   // #> 0
    writeLn(val("YP")); // #> 0
</cfscript>
