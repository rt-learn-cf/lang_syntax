/**
 * Use for development to log with line number, function than called, and the template page.
 */
component DevLogger {

    DevLogger function init(String baseProject="")
    {
        variables.baseProject = arguments.baseProject;
        return this;
    }

    Void function info(String text="")
    {
        var timeStamp = dateTimeFormat(now(), "yyyy/mm/dd HH:nn:ss");
        var callStack = callStackGet()[2];
        var template = calcRelativePath(callStack);
        var formattedMessage = "#template####callStack.function#";
        formattedMessage &= ":#callStack.lineNumber#";
        formattedMessage &= " - #arguments.text#";

        writeLog(
            type="Information",
            file="DevLogger",
            text="#timeStamp# [INFO] #formattedMessage#");
    }

    /**
     * @callStack the call stack.
     */
    private String function calcRelativePath(required Struct callStack)
    {
        return replace(arguments.callStack.template, variables.baseProject, "");
    }
}