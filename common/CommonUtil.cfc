<cfscript>

// Global Functions

/**
 * Writes a an html hr element.
 * @text an optional text to print after the hr tag.
 */
void function writeHr(String text = "") hint="1. lintfp" {
    writeOutput("<hr>#text#<br>");
}

/**
 * WET(1/2): Writes a message and moves the pointer to the next line.
 *
 * @message the text to print.
 */
public void function writeLn(string message = "") hint="2. lintfp" {
    writeOutput(message);
    writeOutput("<br>");
}
</cfscript>
