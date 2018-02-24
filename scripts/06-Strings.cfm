<cfscript>
    writeLn("Replace String Examples");
    writeLn("1. Replace all occurrence");
    writeLn("<code>replace('apple', 'P', 'd')</code> = #replace('apple', 'p', 'd')#");
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

    writeHr("5. Lowercase");
    string5 = "You and Me";
    writeLn(LCase(string5));



//    writeLn("Character at position");
//    writeLn("Hello"[1]);
</cfscript>
