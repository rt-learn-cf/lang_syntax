/**
 * Child class declaration.
 */
component
    displayName="Square" access="public"
    extends="lang_app.scripts.components.Shape" {

    /**
     * Implicit constructor.  This will be invoked automatically if you use
     * the new keyword.
     *
     * @length the length of the side of this square.
     */
    public Square function init(required numeric length) {
        variables.length = arguments.length;
        variables.name = "Square";
        return this;
    }

    /**
     * Overriding a parent method.
     */
    void function draw() {
        this.writeLn("Square class is drawing a shape with 4 sides");

        writeLn("1. Invoke overriden method");
        super.draw();
    }

}
