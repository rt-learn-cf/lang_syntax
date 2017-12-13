/**
 * 1. Component declaration
 */
component displayName="HelloComponent" output="false" access="public" {

    /** 2. variable definition, declared to be used like a constant. */
    NEWLINE = CHR(10);

    /**
     * 3. Constructor
     * @name to be used for database connection. ARG_HINT_MISSING,
     */
    public component function init(required string name ) {
        variables.name = arguments.name;
        return this;
    }

    /**
     * 4. public function with optional parameter
     *
     * @verb is not missing a hint
     */
    public void function greet(string verb = "Hello") {
        writeOutput("#verb# #name#!<br>");
        writeOutput(holla());
    }

    /**
     * 5. private function
     *
     * holla is not missing a hint
     */
    private void function holla() {
        writeOutput("Ola!");
    }
}
