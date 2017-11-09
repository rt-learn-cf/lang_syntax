05.01 If statement<br>
<cfset firstName = "Bono">
<cfif firstName eq "Bono">
  Still haven't found what I'm looking for.
</cfif>


<!--- If else statement --->
<cfset firstName = "Ozzy">
<cfif firstName eq "Bono">
  Still haven't found what I'm looking for.
<cfelse>
  Choose your own song then...
</cfif>


<!--- If else if statement --->
<cfset firstName = "Ozzy">
<cfif firstName eq "Bono">
  Still haven't found what I'm looking for.
<cfelseif firstName eq "Ozzy">
  Crazy Train!
<cfelse>
  Choose your own song then...
</cfif>

<!--- NOT Equal To? --->
<cfset firstName = "Ozzy">
<cfif firstName neq "Bono">
  Crazy Train!
</cfif>

<!--- Less Than? --->
<cfset albumSales = 10>
<cfif albumSales lt 100>
  Don't give up your day job!
</cfif>

<!--- Greater Than? --->
<cfset albumSales = 150000000>
<cfif albumSales gt 1000000>
  Give up your day job!
</cfif>


<!--- Greater Than Or Equal To/Less Than Or Equal To? --->
<cfset age = 80>
<cfif age gte 80>
  Give up your day job!
</cfif>
<cfif age lte 17>
  You are considered a minor in most countries!
</cfif>
