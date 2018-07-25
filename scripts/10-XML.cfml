<cfscript>
    xmlUtil = new lang_app.common.XmlUtil();
    text1 = trim('
        <?xml version = "1.0" encoding = "UTF-8" ?>
        <!--
        Students grades are uploaded by months
        -- comment
        -->
        <class_list>

           <student>
              <name>Tanmay</name>
              <grade>A</grade>
           </student>
        </class_list>
    ');
    writeHr("1. escape comment:");
    writeLog("[#xmlUtil.escapeComment(text1)#]");
    XmlParse(xmlUtil.escapeComment(text1));
    writeLn("[#encodeForXML(xmlUtil.escapeComment(text1))#]");


</cfscript>