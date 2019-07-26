<cfset myxmldoc = XmlParse("../../common/sample.xml")>
<cfset selectedElements = XmlSearch(myxmldoc, "/employee/name/first")>

<cfoutput>#serializeJSON(selectedElements[1].xmlText)#</cfoutput>
