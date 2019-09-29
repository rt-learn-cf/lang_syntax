<cfcomponent displayname="Application" output="true" hint="Handle the application.">

    <cfinclude template="common/CommonUtil.cfm">

    <!--- Set up the application. --->
    <cfset THIS.javaSettings = { LoadPaths = ['/lib'], reloadOnChange =true, loadColdFusionClassPath = true }
    />

    <cfsetting requesttimeout="300" showdebugoutput="false" enablecfoutputonly="false" />

    <cffunction name="init" access="public" returntype="component" output="false" hint="Constructor">

    <cfset THIS.javaSettings = { LoadPaths = ['/lib'], reloadOnChange =true, loadColdFusionClassPath = true }
    />


        <cfapplication name="lang_app" sessionmanagement="true" />

        <!--- Return out. --->
        <cfreturn true />
    </cffunction>


    <cffunction name="OnApplicationStart" access="public" returntype="boolean" output="false" hint="Fires when the application is first created.">

        <cfapplication name="lang_app" sessionmanagement="true" />

        <!--- Return out. --->
        <cfreturn true />
    </cffunction>


    <cffunction name="OnSessionStart" access="public" returntype="void" output="false" hint="Fires when the session is first created.">

        <!--- Set the timeouts in the cookies --->
        <cflock timeout="30" name="#session.sessionID#" type="exclusive">
            <cfheader name="Set-Cookie" value="CFID=#session.CFID#; expires=#getHttpTimeString(dateAdd('n', 300, now()))#; path=/">
            <cfheader name="Set-Cookie" value="CFTOKEN=#session.CFTOKEN#; expires=#getHttpTimeString(dateAdd('n', 300, now()))#; path=/">
        </cflock>

        <!--- Return out. --->
        <cfreturn />
    </cffunction>

    <cffunction name="OnRequestStart" access="public" returntype="boolean" output="false" hint="Fires at first part of page processing.">

        <!--- Return out. --->
        <cfreturn true />

    </cffunction>


    <cffunction name="OnRequest" access="public" returntype="void" output="true" hint="Fires after pre page processing is complete.">

        <!--- Define arguments. --->
        <cfargument name="TargetPage" type="string" required="true" />

        <!--- reload the application if reload is defined in url --->
        <cfif isDefined("url.reload") and url.reload>
            <cfset OnApplicationStart()>
            <cfset OnSessionStart()>
        </cfif>

        <!--- Include the requested page. --->
        <cfinclude template="#ARGUMENTS.TargetPage#" />

        <!--- Home Link --->
        <cfinclude template="common/footer.cfml">

        <!--- Return out. --->
        <cfreturn />
    </cffunction>


    <cffunction name="OnRequestEnd" access="public" returntype="void" output="true" hint="Fires after the page processing is complete.">

        <!--- Return out. --->
        <cfreturn />
    </cffunction>


    <cffunction name="OnSessionEnd" access="public" returntype="void" output="false" hint="Fires when the session is terminated.">

        <!--- Define arguments. --->
        <cfargument name="SessionScope" type="struct" required="true" />
        <cfargument name="ApplicationScope" type="struct" required="false" default="#StructNew()#" />

        <!--- Return out. --->
        <cfreturn />
    </cffunction>


    <cffunction name="OnApplicationEnd" access="public" returntype="void" output="false" hint="Fires when the application is terminated.">

        <!--- Define arguments. --->
        <cfargument name="ApplicationScope" type="struct" required="false" default="#StructNew()#" />

        <!--- Return out. --->
        <cfreturn />
    </cffunction>
</cfcomponent>
