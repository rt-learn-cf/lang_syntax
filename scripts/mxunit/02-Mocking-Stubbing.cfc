
/**
 * @hint Unit tests for owi.business.ProductCodes
 *
 * @CFLintIgnore EXCESSIVE_FUNCTION_LENGTH,EXCESSIVE_FUNCTIONS,COMPONENT_TOO_LONG,AVOID_USING_CREATEOBJECT,VAR_INVALID_NAME,METHOD_INVALID_NAME,METHOD_TOO_LONG,METHOD_TOO_WORDY,VAR_TOO_WORDY,VAR_TOO_LONG,VAR_TOO_SHORT,VAR_INVALID_NAME,METHOD_IS_TEMPORARY,VAR_IS_TEMPORARY
 */
component extends = "mxunit.framework.TestCase" {

    /**
     * 1. Test Method, any public.
     */
    void function classMethod_given_this_and_that_should_do_this_and_that()
    {
        // var mockSubject = mock("lang_app.scripts.mxunit.TestSubject");

        var mockDep = mock("lang_app.scripts.mxunit.TestDependency", "typesafe");

        new lang_app.scripts.mxunit.TestSubject(dep = mockDep);
    }
}
