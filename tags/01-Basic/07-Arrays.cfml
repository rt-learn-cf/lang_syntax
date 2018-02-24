<hr>
07.01.  Creating Arrays in ColdFusion <br>
<code>&lt;cfset faq = ArrayNew(1)&gt;</code>
<cfset faq = ArrayNew(1)>
<cfdump var="#faq#">
<br>


<hr>
07.02.  Appending values to an array<br>
<cfset ArrayAppend(faq, "What are ColdFusion arrays")>
<cfset ArrayAppend(faq, "How to create a ColdFusion array?")>
<cfset ArrayAppend(faq, "What are two dimensional arrays?")>
<cfdump var="#faq#">

<br>
<hr>
07.03.  Accessing Arrays in CF <br>
<cfoutput>#faq[1]#</cfoutput><br>
<cfoutput>#faq[2]#</cfoutput><br>
<cfoutput>#faq[3]#</cfoutput><br><br>

<cfdump var="#faq#">

<hr>
<h3>Modifying the Contents of an Array</h3>
<hr>

To add an item to the end of an array, use the ArrayAppend() function:<br>
Append to array by <code class="well">ArrayAppend(faq, "Did this get appended?")</code>
<cfset ArrayAppend(faq, "Did this get appended?")>
<cfdump var="#faq#"><br>


<hr>
To add an item to the beginning of the array, use the <code>ArrayPrepend()</code> function:
<cfset ArrayPrepend(faq, "Did this get inserted at the beginning?")>
<cfdump var="#faq#"><br>

<hr>
To insert an item in a specific position in the array, use the <code>ArrayInsertAt()</code> function (in this case, the new value is added before position 3):
<cfset ArrayInsertAt(faq, 3, "Did this got inserted at 3?")>
<cfdump var="#faq#"><br>


<hr>
Traversing an array
<cfset thingsILike = ["Warm Sandy Beaches", "Tropical Drinks", 42]>
<ul>
<cfloop array = "#thingsILike#" index="thing">
    <li>
    <cfoutput>#thing#</cfoutput>
</li>
</cfloop>
</ul>
