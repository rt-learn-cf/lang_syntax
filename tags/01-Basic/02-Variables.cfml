<!--- Set Variable --->
<cfset firstname="Bono">
<br>


<!--- Output variable in the html --->
<cfoutput>
  Hello #firstname#.
</cfoutput>
<br>


<!--- Conditiontally define a variable if it don't exist --->
<cfparam name="firstName" default="Ozzy">
<br>


<!--- Check If a variable exists --->
<cfif IsDefined("firstName")>
  Hello #firstname#!
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


<!--- Home Link --->
<cfinclude template="../../common/footer.cfml">
