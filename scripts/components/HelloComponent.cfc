/**
 * 1. Component declaration
 */
component HelloComponent output="false" access="public" {

    /** 2. variable definition, declared to be used like a constant. */
    NEWLINE = CHR(10);

    /**
     * 3. Constructor
     * @name name of the person to greet.
     */
    public component function init(required string name ) {
        writeLog("HelloComponent constructor called...")

        variables.name = arguments.name;
        return this;
    }

    /**
     * 4. public function with optional parameter
     *
     * @verb is the greeting to be used.
     */
    public void function greet(string verb = "Hello") {
        writeLn("#verb# #name#!<br>");
    }

    /**
     * NOTE: Global function is not available inside a component.
     * 5. private function
     @text the text to print.
     */
    private void function writeLn(String text = "") {
        writeOutput(text);
        writeOutput("<br>");
    }
}
