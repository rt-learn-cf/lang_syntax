<cfif structKeyExists(form, "xlsfile") and len(form.xlsfile)>

    <!--- Destination outside of web root --->
    <cfset dest = getTempDirectory()>

    <cfdump var="#dest#" output="console">

    <cffile action="upload" destination="#dest#" filefield="xlsfile" result="upload" nameconflict="makeunique">

    <cfdump var="#upload.fileWasSaved#" output="console">

    <cfif upload.fileWasSaved>
        <cfset theFile = upload.serverDirectory & "/" & upload.serverFile>

        <cfdump var="#theFile#" output="console">
        <cfdump var="#isSpreadsheetFile(theFile)#" output="console">

        <cfif isSpreadsheetFile(theFile)>
            <cfspreadsheet action="read" src="#theFile#" query="data" headerrow="1">
            <!--- <cffile action="delete" file="#theFile#"> --->
            <cfset showForm = false>
        <cfelse>
            <cfset errors = "The file was not an Excel file.">
            <cffile action="delete" file="#theFile#">
        </cfif>
    <cfelse>
        <cfset errors = "The file was not properly uploaded.">
    </cfif>
</cfif>