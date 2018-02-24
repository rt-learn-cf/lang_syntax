/**
 *
 */
component TestSubject {

    /**
     * Constructor.
     * @dep test dependency.
     */
    void function init(TestDependency dep = new TestDependency())
    {
        writeLog("Constructor Called...");
    }
}