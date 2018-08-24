/**
 * 1. Component declaration
 */
component displayName="Shape" output="false" access="public" {


    /**
     * 3. Implicit constructor.  This will be invoked automatically if you use
     * the new keyword.
     *
     * @name the name of this shape.
     */
    public Shape function init(required string name ) {
        variables.name = arguments.name;
        return this;
    }

    /**
     * public function with optional parameter. public can be omitted since it
     * is the default access control.
     */
    public void function draw() {
        writeLn("Shape class is drawing a #name# shape.");
    }

    /**
     * WET(2/2): Writes a message and moves the pointer to the next line.
     *
     * @message the text to print.
     */
    public void function writeLn(string message = "") hint="2. lintfp" {
        writeOutput(message);
        writeOutput("<br>");
    }

}
