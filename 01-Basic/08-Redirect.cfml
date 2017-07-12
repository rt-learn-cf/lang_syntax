<!--- Temporary Redirects --->
<cflocation url="/new_location.cfm">

<!--- Permanent Redirects --->
<cfheader statuscode="301" statustext="Moved Permanently">
<cfheader name="Location" value="https://www.quackit.com/coldfusion/tutorial">
<cfabort>
