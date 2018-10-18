
<!--- <cfquery datasource="quackit" name="GetUsers">
SELECT FirstName, IndividualId, LastName, UserName FROM individual
</cfquery>

<cfdump var="#GetUsers#">
 --->

<!--- Testing Dump with abort --->

<cfset Hello = false>

<cfdump var="#Hello#" abort="true">
Do this get executed

