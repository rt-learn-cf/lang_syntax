<cfscript>
    writeHr("1. Initialize");
    hash1 = {1: "Test"};
    writeDump(hash1);


    writeLn("Size: #structCount(hash1)#");


    writeHr("2. Dynamic Key");
    numeric function test() {
        return 1;
    }

    hash2 = {
        "#test()#": 3  // Not compatible with CF10.
    };
    writeDump(hash2);


    writeHr("3. Access elements");
    hash3 = { key: 'value3'};
    writeLn("Using bracket: #hash3['key']#");
    writeLn("Or using dot notation: #hash3.key#");


    writeHr("4. Traverse Struct.");
    struct4 = {
        "name"    : "Royce",
        "strength": 5
    };
    for (key in struct4) {
        writeOutput(key & ": " & struct4[key] & "<br />");
    }

    writeHr("4.2 Traverse Struct with key and value.");
    struct4_2 = {
        "name"    : "Royce",
        "strength": 5
    };

    structEach(struct4_2, function(key, value) {
        writeOutput(arguments.key & ": " & struct4[arguments.key] & "<br />");

    });


    writeHr("5. Struct Size");
    struct5 = {
        "name"    : "Royce",
        "strength": 5
    };
    writeOutput(structCount(struct5));


    writeHr("6. IsEmpty function");
    struct6 = {};
    writeOutput(structIsEmpty(struct6));


    writeHr("7. Keys case sensitivity");
    struct6 = {'Name': "Royce"};
    writeOutput("Output: #struct6['name']#");


</cfscript>

