<!--- Creating Arrays in ColdFusion --->
<cfset faq = ArrayNew(1)>
<cfset ArrayAppend(faq, "What are ColdFusion arrays")>
<cfset ArrayAppend(faq, "How to create a ColdFusion array?")>
<cfset ArrayAppend(faq, "What are two dimensional arrays?")>

<!--- Accessing Arrays in CF --->
<cfoutput>#faq[2]#</cfoutput>


<!--- Modifying the Contents of an Array --->

<!--- To add an item to the end of an array, use the ArrayAppend() function: --->
<cfset ArrayAppend(faq, "How to modify an array?")>

<!--- To add an item to the beginning of the array, use the ArrayPrepend() function: --->
<cfset ArrayPrepend(faq, "How to modify an array?")>

<!--- To insert an item in a specific position in the array, use the ArrayInsertAt() function (in this case, the new value is added before position 3): --->
<cfset ArrayInsertAt(faq, ,3, "How to modify an array?")>
