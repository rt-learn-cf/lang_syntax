<!--- Index Loop --->
<cfloop from="1" to="5" index="i">
  <cfoutput>
  #i#<br />
  </cfoutput>
</cfloop>

<!--- The (optional) step attribute allows you to determine how big the increments will be. --->
<cfloop from="1" to="10" index="i" step="2">
  <cfoutput>
  #i#<br />
  </cfoutput>
</cfloop>

<!--- The Conditional Loop --->
<cfset myVar=false>
<cfloop condition="myVar eq false">
  <cfoutput>
  myVar = #myVar#  (still in loop)<br />
 </cfoutput>
  <cfif RandRange(1,10) eq 10>
    <cfset myVar="true">
  </cfif>
</cfloop>
<cfoutput>
myVar = #myVar# (loop has finished)
</cfoutput>

<!--- The Query Loop --->
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