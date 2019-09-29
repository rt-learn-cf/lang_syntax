<cfdump var="#serializeJSON(form)#"><br />

<cffile action="read" file="#form.uploadFile#" variable="fileContents" />

<cfset lineCounter = 0>

<cfimport path="lang_app.common.StringUtils">

<cfloop list="#fileContents#" delimiters="#CHR(10)#" index="line">
    <cfset stringUtils = new StringUtils()>
    <cfif stringUtils.startsWith(line, '##')>
        <cfcontinue>
    </cfif>
    <cfset lineCounter = lineCounter + 1>

    <cfif lineCounter EQ 1>
        <cfset session.baseId = line>
        Base ID:
    <cfelse>
        <cfset session["product#lineCounter - 1#"] = line>
        Product:
    </cfif>
    <cfoutput>#line#<br /></cfoutput>
</cfloop>
<cfset session.productCount = lineCounter - 1>

<cflocation url="index.cfml">
