/**
 *
 */
component StringUtils {
    /**
     * [startsWith description]
     * @text  {[type]} required String        text      [description]
     * @substring  {[type]} required String        substring [description]
     * @return {[type]}          [description]
     */
    Boolean function startsWith(required String text, required String substring) {
        return left(arguments.text, len(arguments.substring)) == arguments.substring;
    }

    /**
     * [splitEveryNth description]
     * @param  {[type]} required String        string [description]
     * @param  {[type]} required Numeric       pos    [description]
     * @param  {[type]} required String        sep    [description]
     * @return {[type]}          [description]
     */
    String function splitEveryNth(required String string, required Numeric pos, required String sep) {
        var output = "";
        for (var i=1;i<=len(arguments.string);i++) {
            output &= mid(arguments.string, i, 1);
            if (i % arguments.pos == 0) {
                output &= sep;
            }
        }
        return output;
    }
}
