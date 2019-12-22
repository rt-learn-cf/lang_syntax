Creating Lists in ColdFusion

<!--- This is easy. You can create a list in ColdFusion just the same you would create any other variable. Just remember to throw in a delimiter:
 --->

<cfset coldfusion_list = "ColdFusion Lists,ColdFusion Arrays,ColdFusion Structures">


<hr>
<cfscript>
    writeOutput(listFind(coldfusion_list, "ColdFusion"));
</cfscript>
<hr>





<!--- Find out the list length --->
listLen(coldfusion_list)

<!--- Loop through the list --->
<cfloop list="#coldfusion_list#" index="i">
    <cfoutput>#i#</cfoutput>
</cfloop>


<!--- Add items to the list --->
<!--- Add an item to the end of the list. The following adds ColdFusion Functions to the end of the list:
 --->
listAppend(coldfusion_list, "ColdFusion Functions")

<!--- Add an item to the beginning of the list. The following adds ColdFusion Functions to the beginning of the list:
 --->
listPrepend(coldfusion_list, "ColdFusion Functions")

<!--- Add an item somewhere in the middle of the list. The following adds ColdFusion Functions to position 2 of the list:
 --->
listInsertAt(coldfusion_list, "2", "ColdFusion Functions")


<!--- Find out if the list contains a given string --->
listContains(coldfusion_list, "ColdFusion")

<!--- ...or if you don't want it to be case sensitive: --->
listContainsNoCase(coldfusion_list, "ColdFusion")

<!--- Convert a list into an array --->
ListToArray(coldfusion_list)

<!--- Convert an array into a list --->
ArrayToList(array_name)
