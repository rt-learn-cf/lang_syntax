/**
 * Error bean example.
 */
component {
    /**
     * Constructor.
     */
    public errorBean function init() {
        variables.errors = [];
        return this;
    }

    /**
     * Adds an error to this object.
     * @message the error message to attach to a field.
     * @field the field name to which to attach the error method to.
     */
    public void function addError(required string message, required string field) {
        arrayAppend(
            variables.errors,
            {
                'message'=arguments.message,
                'field'=arguments.field
            }
        );
    }

    /**
     * Returns the array of the errors.
     */
    public Array function getErrors() {
        return variables.errors;
    }

    /**
     * Checks if there are any errors registered.
     */
    public Boolean function hasErrors() {
        if(arrayLen(variables.errors)) {
            return true;
        }  else {
            return false;
        }
    }

    public void function clearErrors() {
        variables.errors = [];
    }

}