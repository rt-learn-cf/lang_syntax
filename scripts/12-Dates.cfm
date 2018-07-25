<cfscript>

  writeHr("1. Current Date (short): ");
  now1a = dateFormat(now(), "short");
  writeLn(now1a);

  writeHr("1.b Current Date (full): ");
  now1b = dateFormat(now(), "full");
  writeLn(now1b);

  now3 = now();
  writeHr("1.c now: ");
  writeLn(now3);

  tomorrow = dateFormat(dateAdd('d', 1, now()), "short");

  writeHr("2. Tomorrow Date: ");
  writeDump(tomorrow);

  writeHr("3. Date from string: ");
  stringDate = '1/14/2018';
  date3 = dateFormat(dateAdd('M', 1, stringDate), "short");
  writeDump(date3);

  writeHr("4. Convert local date/time to utc");
  now4 = now();
  actual4 = dateConvert("Local2UTC", now4);

  writeLn(now4); // UTC2Local
  writeLn(actual4); // UTC2Local
  writeLn(new lang_app.common.DateUtil().utcNow()); // UTC2Local


  writeHr("5. ODBC Time");
  actual5 = CreateODBCDateTime(Now());
  writeLn(actual5);
</cfscript>