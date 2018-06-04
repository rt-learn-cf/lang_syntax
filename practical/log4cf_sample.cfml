<cfscript>
    logger = new log4cf.Logger();

    logger.info('test');
    logger.debug('test');

    object = new lang_app.practical.ComponentWithLogging();
    object.hello();


</cfscript>