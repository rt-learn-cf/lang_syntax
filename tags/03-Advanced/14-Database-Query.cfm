<cfquery datasource="compass" name="users">
  SELECT `NAME`
    FROM royce_test WHERE
</cfquery>

<cfloop query="users">
   <cfoutput>
   #NAME#
   </cfoutput>
</cfloop>