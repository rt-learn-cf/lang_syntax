<cfscript>
    writeHr();
    writeLine("Initialize");
    hash1 = {1: "Test"};
    writeDump(hash1);


    writeLine("Size: #structCount(hash1)#");


    writeHr();
    writeLine("2. Dynamic Key");
    numeric function test() {
        return 1;
    }

    hash2 = {
        "#test()#": 3  // Not compatible with CF10.
    };

    writeDump(hash2);

    writeHr();
    writeLine("3. Access elements");
    hash3 = { key: 'value3'};
    writeLine("Using bracket: #hash3['key']#");
    writeLine("Or using dot notation: #hash3.key#");



</cfscript>

