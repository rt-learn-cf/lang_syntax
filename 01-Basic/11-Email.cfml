<!--- Send Email using ColdFusion --->
<cfmail to="#form.emailaddress#"
  from="barney@bedrock.com"
  subject="Welcome to Bedrock"
  type="text">
  Dear #form.firstname#

  We, here at Bedrock, would like to thank you for joining.

  Best wishes
  Barney
</cfmail>
<cfoutput>
    <p>Thank you #form.firstname# for registering.
    We have just sent you an email.</p>
</cfoutput>

<!--- Send Email to Multiple Recipients --->
<cfquery datasource="quackit" name="GetUsers">
  SELECT emailaddress, firstname
  FROM individual
</cfquery>

<cfmail to="#emailaddress#"
  from="barney@bedrock.com"
  subject="Welcome to Bedrock!"
  type="HTML"
  query="GetUsers">
  Dear #GetUsers.firstname#

  We, here at Bedrock, would like to thank you for joining.

  Best wishes
  Barney
</cfmail>


<!--- Sending Attachments --->

<!--- The <cfmail> tag includes the mimeattach attribute. This attribute allows you to specify an attachment, such as a PDF or Word file, to be sent with the email. --->

<cfmail to="#form.emailaddress#"
    from="barney@bedrock.com"
    subject="Welcome to Bedrock"
    type="text"
    mimeattach="C:/localdirectory/email_attachment.pdf">
    Dear #form.firstname#
​
    We, here at Bedrock, would like to thank you for joining.
​
    Attached is a PDF document outlining our terms and conditions.
​
    Best wishes
    Barney
</cfmail>