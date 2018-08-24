component FatherDog implements="Animal" {

    Animal function init() {
        this.legs = 4;
        return this;
    }

    void function makeSound() {
        writeLog("Father Bark!");
        secret();
    }

    private void function secret() {
        writeLog("Daddy Secret");
    }
}