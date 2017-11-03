<cfcomponent displayname="Customer" hint="ColdFusion Component for Customers">

<cffunction name="init">
	<cfargument name="name" type="string" default="Guest" hint="Initialize with the name of the customer.">

	<cfse

</cffunction>

 <!--- This function retrieves all customers from the database --->
 <cffunction name="retrieveCustomers"
  hint="Gets all customer from the database" returntype="query">
   <cfquery name="getCustomers" datasource="#application.dsn#">
   SELECT 1 FROM Customers
   </cfquery>
   <cfreturn getCustomers>
 </cffunction>
</cfcomponent>