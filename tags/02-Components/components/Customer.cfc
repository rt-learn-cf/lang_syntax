<cfcomponent displayname="Customer" hint="ColdFusion Component for Customers" accessors="true">

    <cfproperty name="name" type="String" default="Property" />

    <cfset variables.outside = 1234>

    <cffunction name="init" output="false" returntype="Customer" hint="This serves as a constructor.">
        <cfargument name="name" type="string" default="Guest" hint="Initialize with the name of the customer.">
        <cfset this.name |= arguments.name />

        <cfoutput>Class initialization (#this.name#)<br></cfoutput>
        <cfreturn this />
    </cffunction>

    <cffunction name="getName"
        hint="Returns the customer name"
        returntype="String" output="false">

        <cfif !isDefined("this.name")>
            <cfset this.name = "undefined">
        </cfif>

        <cfreturn this.name />

    </cffunction>

    <cfdump var="#variables.outside#">
</cfcomponent>
