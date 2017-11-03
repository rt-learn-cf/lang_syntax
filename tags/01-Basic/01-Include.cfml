<cfinclude template="../../common/header.cfm">

<p>Who are we? We are ColdFusion cfinclude enthusiasts of course!</p>

<cfset mainvar = "hello main">
<cfoutput>Inside <code>01-Include</code> file: <code>#mainvar#</code></cfoutput><br>

<cftry>
	<cfinclude template="../../common/exception.cfm">
<cfcatch type="any">
	<cfif IsDefined("message")>
		<cfoutput>#message#</cfoutput><br>
	<cfelse>
		<cfoutput>Message is not defined.</cfoutput>
	</cfif>
</cfcatch>
</cftry>

<cfinclude template="../../common/footer2.cfml">