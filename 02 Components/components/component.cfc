<cfcomponent displayname="Customer" hint="ColdFusion Component for Customers">
 <!--- This function retrieves all customers from the database --->
 <cffunction name="retrieveCustomers"
  hint="Gets all customer from the database" returntype="query">
   <cfquery name="getCustomers" datasource="#application.dsn#">
   SELECT * FROM Customers
   </cfquery>
   <cfreturn getCustomers>
 </cffunction>
</cfcomponent>