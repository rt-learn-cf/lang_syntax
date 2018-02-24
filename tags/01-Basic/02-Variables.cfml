<!--- Set Variable --->
1. Set value of a variable
<cfset firstName1="Bono">
<br><br>


2. Dump value of a variable
<cfdump var="#firstName1#">
<br><br>

3. Output variable in the html<br>
<cfoutput>
  Holla #firstName1#.
</cfoutput>
<br><br>

4. Some examples: <br>
1 + 2 = <code><cfdump var = "1 + 2" /></code><br>
#1 + 2# = <code><cfdump var = "#1 + 2#" /></code><br>
1 + 2 IS #1 + 2# = <code><cfdump var = "1 + 2 IS #1 + 2#"/></code><br>

<!--- Conditiontally define a variable if it don't exist --->
<cfparam name="firstName" default="Ozzy">
<br>


<!--- Check If a variable exists --->
<cfif IsDefined("firstName6")>
	<cfoutput>
	  Hello #firstName6#.
	</cfoutput>
<cfelse>
  Hello stranger!
</cfif>
<br>


<!--- Scoping a variable --->
<!--- <cfset Session.BodyType = "Perfect">
<cfoutput>
  Body Type: #Session.BodyType#
</cfoutput>
 ---><br>

<cfoutput>
  Test 1
</cfoutput>


<!--- Get variabse value by name? --->
<cfoutput>
    Dynamic variables
  #variables['firstName']#
</cfoutput>
