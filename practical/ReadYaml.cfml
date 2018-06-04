<cfscript>
    // Load jyml.jar with JavaLoader
    javaloader = createObject("component", "javaloader.JavaLoader").init( [expandPath("../lib/jyaml-1.3.jar")] );
    // Create jyml class
    yaml = javaloader.create("org.ho.yaml.Yaml");

    writeDump(expandPath("../log4cf.yml"));


    dataFile = createObject("java", "java.io.File").init(
        expandPath("../log4cf.yml")
    );

    data = yaml.load(dataFile);

    writeDump( data );
</cfscript>