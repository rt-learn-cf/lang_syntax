<cfscript>
	writeLine("Initialize");
	hash1 = {1: "Test"};
	writeDump(hash1);
	writeLine("Size: #len(hash1)#");


	writeLine("2. Dynamic Key");
	numeric function test() {
		return 1;
	}
	hash2 = {
		#test()#: 3  // Not compatible with CF10.
	};
	writeDump(hash2);

</cfscript>

