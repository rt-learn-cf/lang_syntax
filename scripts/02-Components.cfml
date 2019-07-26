<cfscript>
    import lang_app.scripts.components.HelloComponent;
	helloComponent = new HelloComponent("Royce");
    helloComponent.greet();

    // What happens if we pass in extra arguments. It's fine, it will just be ignored.
    helloComponent.greet('Yo', 'Go go go!');

</cfscript>

