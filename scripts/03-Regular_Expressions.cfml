<cfscript>
	// 1. Find index of pattern
	index = REFind("a{2,4}", "hahahaaahaaaahaaaaahhh");


	writeLine('03.01. REFind("a{2,4}", "hahahaaahaaaahaaaaahhh")');
	writeLine("03.01. Result is: #index#");  // 6


	// 2. Find index of pattern - not found
	index = REFind("b{2,4}", "hahahaaahaaaahaaaaahhh");
	writeLine('03.02 REFind("b{2,4}", "hahahaaahaaaahaaaaahhh");');
	writeLine("03.02. Result is: #index#");
</cfscript>


