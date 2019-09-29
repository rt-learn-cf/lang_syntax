<!--- Basic CFQUERY Example --->
<cfquery datasource="crm" result="customers">
  select *
  from customers
</cfquery>

<cfdump var="#customers#" abort="true">

<!--- Authentication --->
<cfquery datasource="Entertainment" username="webuser" password="letmein">
  select *
  from Movies
</cfquery>

<!--- You can cache a query using the cachedAfter attribute. If the query was last run after the supplied date, cached data is used. Otherwise the query is re-run. --->
<cfquery datasource="Entertainment" cachedAfter="November 20, 2006">
  select *
  from Movies
</cfquery>

<!--- You can also cache a query using the cachedWithin attribute in conjunction with the CreateTimeSpan() function. --->
<cfquery datasource="Entertainment" cachedwithin="#CreateTimeSpan(0,1,0,0)#">
  select *
  from Movies
</cfquery>

<!--- Limiting the Number of Records Returned
 --->
<cfquery datasource="Entertainment" maxrows="50">
  select *
  from Movies
</cfquery>

<!--- Timeouts --->
<!--- You can set a timeout limit using the timeout attribute. This can be useful in preventing requests running far longer than they should and impacting on the whole application as a result.
 --->
<!--- The timeout attribute sets the maximum number of seconds that each action of a query is allowed to execute before returning an error.
 --->
<cfquery datasource="Entertainment" timeout="30">
  select *
  from Movies
</cfquery>
