/**
 * https://helpx.adobe.com/coldfusion/cfml-reference/coldfusion-tags/tags-f/cffunction.html
 *
 * @CFLintIgnore
 */
component FunctionAccess {

    /**
     * 1.a Public.
     * available to locally executing page or component method.  Default access.
     * @return {[type]} [description]
     */
    public Void function apublicFunction() {}

    /**
     * 1.b Public.
     * @return {[type]} [description]
     */
    Void function publicFunctionToo() {}

    /**
     * 2. package.
     *  available only to the component that declares the method, components
     *  that extend the component, or any other components in the package.
     *  Methods are available to the CFC pages in the same package.
     *
     * @return {[type]} [description]
     */
    package Void function apackageFunction() {}

    /**
     * 3. remote.
     *  available to a locally or remotely executing page or component method,
     *  or a remote client through a URL, Flash, or a web service. To publish
     *  the function as a web service, this option is required.
     */
    remote Void function aremoteFunction() {}

    /**
     * 4. private.
     * available only to the component that declares the method and any
     * components that extend the component in which it is defined.
     */
    private Void function aprivateFunction() {}
}
