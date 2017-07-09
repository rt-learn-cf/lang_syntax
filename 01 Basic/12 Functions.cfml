<!--- Example of Usage 1 --->
<cfoutput>
#RandRange(1,10)#
</cfoutput>

<!--- Example of Usage 2 --->
<cfset myRandomNumber = RandRange(1,10)>
<cfoutput>
#myRandomNumber#
</cfoutput>

<!--- Nested Functions --->
<cfoutput>
  #DateFormat(Now(), "ddd dd mmmm, yyyy")#
</cfoutput>

