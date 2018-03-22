/**
 * Tool to measure time intervals between calls.
 */
component Profiler {

    /**
     * Constructor.
     * Mark the start time of the tracking.
     * @enabled quickly disable logging during development.
     */
    Profiler function init(String className = "", Boolean enabled = true)
    {
        variables.className = arguments.className;
        variables.enabled = arguments.enabled;
        variables.previousTickCount = getTickCount();
        return this;
    }

    /**
     * @where optional text to log at what point are you logging.
     */
    Numeric function check(String where = "")
    {
        if (!variables.enabled) {
            return;
        }
        var current = getTickCount();
        var elapsed = current - variables.previousTickCount;
        variables.previousTickCount = current;
        writeLog("Elapsed: #elapsed#ms -  #variables.className#: #arguments.where#");
        return elapsed;
    }
}