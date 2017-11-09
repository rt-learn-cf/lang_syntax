<cfscript>

// Global Functions

function writeLine(string message = "") {
    writeDump(message);
    writeOutput("<br>");
}

function writelnCode(string message = "") {
    writeDump(message);
    writeOutput("<br>");
}


</cfscript>
