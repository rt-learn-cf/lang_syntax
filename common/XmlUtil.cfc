/**
 *
 */
component XmlUtil {

    /**
     * @text xml string to search for comments for escaping.
     */
    String function escapeComment(required String text)
    {
        // return arguments.text.replaceAll('--', '&##45;&##45;');
        return arguments.text.replaceAll('(?<!<!)--(?!>)', '&##45;&##45;');
    }

    /**
     * @text xml string to search for comments for escaping.
     */
    String function removeBom(required String text)
    {
        return arguments.text.replaceAll("[^\\x20-\\x7e]", '');
    }
}