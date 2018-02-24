<cfscript>

  writeHr("1. Current Date: ");
  now = dateFormat(now(), "short");
  writeDump(now);

  tomorrow = dateFormat(dateAdd('d', 1, now()), "short");

  writeHr("2. Tomorrow Date: ");
  writeDump(tomorrow);

  writeHr("3. Date from string: ");
  stringDate = '1/14/2018';
  date3 = dateFormat(dateAdd('M', 1, stringDate), "short");
  writeDump(date3);


</cfscript>