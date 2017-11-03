<!--- Set Variable --->
<cfset firstname="Bono">
<br>


<!--- Output variable in the html --->
<cfoutput>
  Holla #firstname#.
</cfoutput>
<br>


<!--- Conditiontally define a variable if it don't exist --->
<cfparam name="firstName" default="Ozzy">
<br>


<!--- Check If a variable exists --->
<cfif IsDefined("firstName")>
	<cfoutput>
	  Hello #firstName#.
	</cfoutput>
<cfelse>
  Hello stranger!
</cfif>
<br>


<!--- Scoping a variable --->
<cfset Session.BodyType = "Perfect">
<cfoutput>
  Body Type: #Session.BodyType#
</cfoutput>
<br>

<cfoutput>
  Test
</cfoutput>
