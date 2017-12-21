<cfscript>

// Global Functions

/**
 * @hint Writes a an html hr element.
 */
void function writeHr() hint="lintfp" {
    writeOutput("<hr>");
}

/**
 * @hint Writes a message and moves the pointer to the next line.
 * @message the text to print.
 */
void function writeLine(string message = "")  hint="lintfp" {
    writeDump(message);
    writeOutput("<br>");
}

</cfscript>
