<cfscript>
    import lang_app.scripts.components.HelloComponent;
	helloComponent = new HelloComponent("Royce");
    helloComponent.greet();

    // What happens if we pass in extra arguments. It's fine, it will just be ignored,
    // unless it's an interface in that case it will error out.
    helloComponent.greet('Yo', 'this parameter is ignored!');


    writeOutput('Dynamic method invocation');
    helloComponent['greet'];
    writeOutput('<br /');

    helloComponent.feedback('CF is great!');

</cfscript>

