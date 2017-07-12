
<cfquery datasource="quackit" name="GetUsers">
SELECT FirstName, IndividualId, LastName, UserName FROM individual
</cfquery>

<cfdump var="#GetUsers#">

