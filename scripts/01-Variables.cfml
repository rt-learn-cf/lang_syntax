<cfscript>
void function main() {
    // 1. Local variable declaration using the var keyword.
    var var1 = "royce1";
    writeLn("1. Printing local variable #var1#");

    // 2. Local variable declaration using the local scope.
    local.var2 = "royce2";
    writeLn("2. Printing local variable #local.var2#");
}

main();
</cfscript>