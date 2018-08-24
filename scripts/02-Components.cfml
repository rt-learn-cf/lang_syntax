<cfscript>

    // 1. Instantiating and invoking a method.
    new lang_app.components.HelloComponent("Royce").greet();

    // 2. Instantiating a parent component.
    new lang_app.scripts.components.Shape("irregular").draw();

    // 3. Instantiating a child component.
    new lang_app.scripts.components.Square(5).draw();

    // 4. Instantiating a minimal component
    writeLn("4. Minimal Component");
    comp4 = new lang_app.scripts.components.MinimalComponent();
    writeDump(comp4);


    writeHr("5. Interfaces");
    void function func5(Animal animalParam = new lang_app.scripts.components.PuppyDog()) {
        arguments.animalParam.makeSound();
    }

    // func5(new lang_app.scripts.components.FatherDog());
    func5(new lang_app.scripts.components.PuppyDog());
    // func5();

    writeHr("6. Lambdas");
    square6a = new lang_app.scripts.components.Square(5);
    square6b = new lang_app.scripts.components.Square(10);
    writeDump(square6a.draw == square6b.draw);
    writeDump(square6a.draw);
    writeDump(square6b.draw);
    writeDump(square6b['draw']);
    writeDump(square6a.draw == square6b['draw']);



</cfscript>

