<cfscript>
    savecontent variable="urlRegex" {
        /**
         * This regular expression has been defined as being
         * verbose. That allows us to use white space and
         * comments to make it more readable. Double backslash is required
         * for the backslash to work.
         */

        // Must match beginning
        writeOutput("^");

        // Match standard http
        writeOutput("http");

        // secured http optionally
        writeOutput("s?");

        // http(://)
        writeOutput(":\/\/");

        // 1 or more alphanum or dash(-)
        writeOutput("[a-z0-9\-]+");

        // followed by 0 or more dot-alphanum or dash(-)
        writeOutput("(?:\.[a-z0-9_-]+)*");

        // optionally :portnumbers
        writeOutput("(?::\d+)?");

        // 0 or more subpaths like /path-example
        writeOutput("(?:\/[a-z0-9_-]+)*");

        // optionally ending with a slash
        writeOutput("\/?");

        // Must match ending.
        writeOutput("$");
    };
</cfscript>