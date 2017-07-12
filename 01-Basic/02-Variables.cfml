<!--- Set Variable --->
<cfset firstname="Bono">

<!--- Output variable in the html --->
<cfoutput>
  Hello #firstname#.
</cfoutput>

<!--- Conditiontally define a variable if it don't exist --->
<cfparam name="firstName" default="Ozzy">

<!--- Check If a variable exists --->
<cfif IsDefined("firstName")>
  Hello #firstname#!
<cfelse>
  Hello stranger!
</cfif>

<!--- Scoping a variable --->
<cfset Session.BodyType = "Perfect">
<cfoutput>
  Body Type: #Session.BodyType#
</cfoutput>


