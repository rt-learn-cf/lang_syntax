<cfscript>
    writeDump(callStackGet());


    function test() {
        writeDump(callStackGet());
    }

    lambda = function() {
        writeDump(callStackGet());
    };
    lambda();

    test();
</cfscript>
