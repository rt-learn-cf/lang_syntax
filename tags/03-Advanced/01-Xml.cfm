            <cfset mydoc = XmlParse(ExpandPath("./actual.xml")) />
<!---             <cfdump var="#mydoc#">
            <cfdump var="#mydoc.xmlRoot.XmlAttributes#">
 --->
            <cfset test = StructFindValue(mydoc.xmlRoot.XmlAttributes, "http://schemas.xmlsoap.org/soap/envelope/")>

            <cfoutput>#mydoc.xmlRoot.XmlNsPrefix#</cfoutput>
            <cfoutput>#listToArray(test[1].key, ':')[2]#</cfoutput>
            <!--- <cfdump var="#test[1].key#"> --->

            <hr>
            <cfoutput>#mydoc['Envelope']#</cfoutput>
            <hr>
            <cfoutput>#mydoc['Envelope']['Body']#</cfoutput>
            <hr>
            <cfoutput>#mydoc['Envelope']['Body']['ReadBalanceResponse']#</cfoutput>
            <hr>

