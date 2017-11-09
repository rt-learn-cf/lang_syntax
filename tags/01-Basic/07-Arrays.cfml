07.01.  Creating Arrays in ColdFusion <br>
<code>&lt;cfset faq = ArrayNew(1)&gt;</code>
<cfset faq = ArrayNew(1)>
<cfdump var="#faq#">
<br>


07.02.  Appending values to an array<br>
<cfset ArrayAppend(faq, "What are ColdFusion arrays")>
<cfset ArrayAppend(faq, "How to create a ColdFusion array?")>
<cfset ArrayAppend(faq, "What are two dimensional arrays?")>

<br>
07.03.  Accessing Arrays in CF<br>
<cfoutput>#faq[1]#</cfoutput><br>
<cfoutput>#faq[2]#</cfoutput><br>
<cfoutput>#faq[3]#</cfoutput><br><br>
<cfoutput>#faq[4]#</cfoutput><br><br>

<cfdump var="#faq#">

<!--- Modifying the Contents of an Array --->

<!--- To add an item to the end of an array, use the ArrayAppend() function: --->
Append to array by <code>ArrayAppend(faq, "How to modify an array?")</code>
<cfset ArrayAppend(faq, "How to modify an array?")>
<cfdump var="faq"><br>



<!--- To add an item to the beginning of the array, use the ArrayPrepend() function: --->
<cfset ArrayPrepend(faq, "How to modify an array?")>

<!--- To insert an item in a specific position in the array, use the ArrayInsertAt() function (in this case, the new value is added before position 3): --->
<cfset ArrayInsertAt(faq, 3, "How to modify an array?")>
