<!--- Calling a ColdFusion Component --->
<!--- <cfset name="">
<cfinvoke component="components.Customer"
    method="getName"
    returnvariable="name"></cfinvoke>
<cfoutput>#name#</cfoutput><br>
 --->

<!--- 0.  Constructor is not called. --->
<hr>
<cfoutput>CreateObject("Component", "components.Customer")<br></cfoutput>
<cfset customer0 = CreateObject("Component", "components.Customer") />
<cfdump var="#customer0#" /><br>
<cfoutput>0. #customer0.getName()#<br></cfoutput>

<!--- 1.  --->
<hr>
<cfoutput>CreateObject("Component", "components.Customer").init()<br></cfoutput>
<cfset customer1 = CreateObject("Component", "components.Customer").init() />
<cfdump var="#customer1#" /><br>
<cfoutput>1. #customer1.getName()#<br></cfoutput>

<!--- 2.  --->
<hr>
<cfoutput>CreateObject("Component", "components.Customer").init(name = "Second")<br></cfoutput>
<cfset customer2 = CreateObject("Component", "components.Customer").init(name = "Second") />
<cfdump var="#customer2#" /><br>
<cfoutput>2. #customer2.getName()#<br></cfoutput>

<!--- 3.  --->
<hr>
<cfoutput>new components.Customer()<br></cfoutput>
<cfset customer3 = new components.Customer() />
<cfdump var="#customer3#" /><br>
<cfoutput>3. #customer3.getName()#<br></cfoutput>

<!--- 4.  --->
<hr>
<cfoutput>new components.Customer(name="Fourth")<br></cfoutput>
<cfset customer4 = new components.Customer(name="Fourth") />
<cfdump var="#customer4#" /><br>
<cfoutput>4. #customer4.getName()#<br></cfoutput>

