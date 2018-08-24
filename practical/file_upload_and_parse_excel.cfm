<cfset showForm = true>
<cfif structKeyExists(form, "xlsfile") and len(form.xlsfile)>

    <!--- Destination outside of web root --->
    <cfset dest = getTempDirectory()>

    <cffile action="upload" destination="#dest#" filefield="xlsfile" result="upload" nameconflict="makeunique">

    <cfif upload.fileWasSaved>
        <cfset theFile = upload.serverDirectory & "/" & upload.serverFile>
        <cfif isSpreadsheetFile(theFile)>
            <cfspreadsheet action="read" src="#theFile#" query="data" >
            <cffile action="delete" file="#theFile#">
            <cfset showForm = false>
        <cfelse>
            <cfset errors = "The file was not an Excel file.">
            <cffile action="delete" file="#theFile#">
        </cfif>
    <cfelse>
        <cfset errors = "The file was not properly uploaded.">
    </cfif>

</cfif>

<cfif showForm>
    <cfif structKeyExists(variables, "errors")>
        <cfoutput>
        <p>
        <b>Error: #variables.errors#</b>
        </p>
        </cfoutput>
    </cfif>

    <form enctype="multipart/form-data" method="post">

          <input type="file" name="xlsfile" required>
          <input type="submit" value="Upload XLS File">

    </form>
<cfelse>

    <style>
    .ssTable { width: 100%;
               border-style:solid;
               border-width:thin;
    }
    .ssHeader { background-color: #ffff00; }
    .ssTable td, .ssTable th {
        padding: 10px;
        border-style:solid;
        border-width:thin;
    }
    </style>

    <p>
    Here is the data in your Excel sheet (assuming first row as headers):
    </p>

    <cfscript>
    metadata = getMetadata(data);
    writeDump(data);
    abort;
    writeLog("Record Count: #data.recordCount#");
    </cfscript>

    <cfif data.recordCount IS 1>
        <p>
        This spreadsheet appeared to have no data.
        </p>
    <cfelse>
        <cfdump var="#data#">
        <table class="ssTable">
            <tr class="ssHeader">
                <cfloop index="i" from="1" to="7">
                    <cfoutput><th>#data[i][1]#</th></cfoutput>
                </cfloop>
            </tr>
            <cfoutput query="data" startRow="2">
                <tr>
                    <td>#data[COLUMNS.COMMENT][currentRow]#</td>
                </tr>
            </cfoutput>
        </table>
    </cfif>
</cfif>
