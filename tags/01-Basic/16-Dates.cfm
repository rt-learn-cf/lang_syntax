
<cfset todayDate = Now()>
<body>
<h3>DateFormat Example</h3>
<p>Today's date is <cfoutput>#todayDate#</cfoutput>.
<p>Using DateFormat, we can display that date in different ways:
<cfoutput>
<ul>
    <li>#DateFormat(todayDate)#
    <li>#DateFormat(todayDate, "mmm-dd-yyyy")#
    <li>#DateFormat(todayDate, "mmmm d, yyyy")#
    <li>#DateFormat(todayDate, "mm/dd/yyyy")#
    <li>#DateFormat(todayDate, "d-mmm-yyyy")#
    <li>#DateFormat(todayDate, "ddd, mmmm dd, yyyy")#
    <li>#DateFormat(todayDate, "short")#
    <li>#DateFormat(todayDate, "medium")#
    <li>#DateFormat(todayDate, "long")#
    <li>#DateFormat(todayDate, "full")#
</ul>
</cfoutput>


<cfset todayDateTime = Now()>
<body>
<h3>DateTimeFormat Example</h3>
<p>Today's date and time are <cfoutput>#todayDateTime#</cfoutput>.
<p>Using DateTimeFormat, we can display that date and time in different ways:
<cfoutput>
<ul>
    <li>#DateTimeFormat(todayDateTime)#
    <li>#DateTimeFormat(todayDateTime, "yyyy.MM.dd G 'at' HH:nn:ss z")#
    <li>#DateTimeFormat(todayDateTime, "EEE, MMM d, ''yy")#
    <li>#DateTimeFormat(todayDateTime, "h:nn a")#
    <li>#DateTimeFormat(todayDateTime, "hh 'o''clock' a, zzzz")#
    <li>#DateTimeFormat(todayDateTime, "K:nn a, z")#
    <li>#DateTimeFormat(todayDateTime, "yyyyy.MMMMM.dd GGG hh:nn aaa")#
    <li>#DateTimeFormat(todayDateTime, "EEE, d MMM yyyy HH:nn:ss Z")#
    <li>#DateTimeFormat(todayDateTime, "yyMMddHHnnssZ", "GMT")#
</ul>
</cfoutput>