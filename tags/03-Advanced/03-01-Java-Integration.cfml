<cfobject action="create" type="java" class="CFCInvoker" name="x">
<cfset cfcPath = "/Applications/ColdFusion2016/cfusion/wwwroot/lang_app/tags/03-Advanced/DataGetterComponent.cfc"/>
<cfset y = x.directInvoke(cfcPath)>
<cfoutput>#y#</cfoutput>