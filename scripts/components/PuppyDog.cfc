component Puppy extends="FatherDog" {

    function init(String name="Generic") {
        this.name = arguments.name;
        return super.init();
    }

    // void function makeSound() {
    //     writeLog("#this.legs# #this.name# Puppy Bark!");
    // }

    private void function secret() {
        writeLog("Puppy Secret");
    }
}