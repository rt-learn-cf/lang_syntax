/**
  * 1. Component declaration
  *
  * @CFLintIgnore UNQUOTED_STRUCT_KEY,UNQUOTED_STRUCT_KEY
  */
component HelloComponent implements="GreeterInterface" output="false" access="public" {

    /** 2. variable definition, declared to be used like a constant. */
    NEWLINE = CHR(10);

    /**
     * 7. Property
     */
    property name="myname" type=String;


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
      * 6. private function
      *
      * holla is not missing a hint
      */
    private void function holla() {
        writeOutput("Ola!<br/>");
    }

    /**
      * 5. Interface function is required to be implemented
      *
      * @message feedback message
      */

      /**
       * [greet description]
       * @message {[type]} required String message [description]
       * @return {[type]}          [description]
       */
    public String function feedback(required String message) {
        writeOutput("#arguments.message#!<br>");
        writeOutput(holla());
        return arguments.message;
    }



}
