<h3>RandRange Example</h3>

<!--- Do the following only if the form has been submitted. --->

    <!--- Do the following only if the seed field has a non-empty string. --->
        <cfoutput>
            <b>Seed value is 1234</b><br>
        </cfoutput>
        <br>

        <!--- Call Randomize to seed the random number generator. --->
        <cfset r = Randomize(1234, "SHA1PRNG")>

    <!--- Generate and display the random number. --->
    <cfoutput><p><b>
        RandRange returned: #RandRange(-5, 5, "SHA1PRNG")#
    </cfoutput></b></p>
