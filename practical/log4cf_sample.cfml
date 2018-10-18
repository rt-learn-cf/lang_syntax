<cfscript>
    logger = new log4cf.Logger();

    logger.info('test');
    logger.debug('test');

    sampThatLogs = new lang_app.practical.ComponentWithLogging();
    sampThatLogs.hello();
</cfscript>