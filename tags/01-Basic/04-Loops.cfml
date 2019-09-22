<!--- 1. Index Loop --->
<!--- @CFLintIgnore VAR_TOO_SHORT,FUNCTION_TOO_COMPLEX --->
<cfloop from="1" to="5" index="i">
  <cfoutput>
  #i#<br />
  </cfoutput>
</cfloop>

<!--- 1a. The (optional) step attribute allows you to determine how big the increments will be. --->
<!--- @CFLintIgnore VAR_TOO_SHORT --->
<cfloop from="1" to="10" index="i" step="2">
  <cfoutput>
  #i#<br />
  </cfoutput>
</cfloop>

<!--- 2. The Conditional Loop --->
<cfset doLoop2=false>
<cfloop condition="doLoop2 eq false">
  <cfoutput>
  doLoop2 = #doLoop2#  (still in loop)<br />
 </cfoutput>
  <cfif RandRange(1,10) eq 10>
    <cfset doLoop2="true">
  </cfif>
</cfloop>
<cfoutput>
  doLoop2 = #doLoop2# (loop has finished)
</cfoutput>

<!--- 3. The Query Loop --->
<cfquery name="getMovies" datasource="Entertainment">
  select top 4 movieName
  from Movies
</cfquery>
<cfloop query="getMovies">
   #movieName#
</cfloop>

<!--- The List Loop --->
<cfloop list="ColdFusion,HTML;XML" index="ListItem" delimiters=",;">
  <cfoutput>
   #ListItem#<br />
 </cfoutput>
</cfloop>

<!--- The File Loop --->
<cfloop list="#myFile#" index="FileItem" delimiters="#chr(10)##chr(13)#">
  <cfoutput>
   #FileItem#<br />
 </cfoutput>
</cfloop>

<!--- COM Collection/Structure Loops --->
<cfset myBooks = StructNew()>
<cfset myVariable = StructInsert(myBooks,"ColdFusion","ColdFusion MX Bible")>
<cfset myVariable = StructInsert(myBooks,"HTML","HTML Visual QuickStart")>
<cfset myVariable = StructInsert(myBooks,"XML","Inside XML")>
<cfloop collection="#myBooks#" item="subject">
  <cfoutput>
 #subject#: #StructFind(myBooks,subject)#<br />
 </cfoutput>
</cfloop>
