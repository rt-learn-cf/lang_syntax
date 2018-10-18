/**
 * @CFLintIgnore COMPONENT_INVALID_NAME,COMPONENT_TOO_LONG,VAR_INVALID_NAME,METHOD_TOO_LONG,METHOD_TOO_WORDY,UNQUOTED_STRUCT_KEY
 */
component extends="mxunit.framework.TestCase" {

    /**
     * @hint Executes once before any test case is run.
     */
    void function beforeTests() {
        writeOutput("1 beforeTests()...");
    }

    /**
     * @hint Executes once before each test case is run.
     */
    void function setup() {
        writeOutput("setup()...");
    }

    /**
     * @hint Public functions are run.
     */
    void function test() {
        debug(1 == 1);
        debug(true);
        assertEquals(1 == 1, true);
    }
}
