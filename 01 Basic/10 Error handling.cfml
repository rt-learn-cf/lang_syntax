<p>Header, other content etc goes here</p>

<cftry>
<cfquery datasource="SomeUnavailableDsn" name="getUsers">
   select FirstName from individual
</cfquery>
<cfoutput query="getUsers">#FirstName#<br /></cfoutput>
<cfcatch type="any">
  <p><strong>Apologies, an error has occurred.
  Please try again later.<strong><p>
</cfcatch>
</cftry>

<p>Footer, other content etc goes here</p>


<!--- Handling Multiple Error Types --->

<!--- To handle more than one error type, you simply use a different <cfcatch> for each type you want to handle. --->

<cftry>
... High risk code goes here...
<cfcatch type="Database">
  A database error has occurred. Please try again later.
</cfcatch>
<cfcatch type="Expression">
  An expression error has occurred. Please try again later.
</cfcatch>
<cfcatch type="MissingInclude">
  An include file has gone missing. Please try again later.
</cfcatch>
</cftry>


