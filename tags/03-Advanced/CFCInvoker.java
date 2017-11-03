/**
 * The resulting class file cannot be invoked directly in a jvm, it must be
 * invoked from coldfusion runtime environment.
 */
import coldfusion.cfc.CFCProxy;

public class CFCInvoker {
    public String directInvoke(String cfcPath)
    {
        String myMessage = "";
        try
            {
                final CFCProxy myCFC = new CFCProxy(cfcPath, true);
                Object[] myArgs = { "Hello" };
                myMessage = (String)myCFC.invoke("getData", myArgs);
            } catch (Throwable e) {
                e.printStackTrace();
            }
            return myMessage;
    }

    public static void main(String... args) {
        final CFCInvoker invoker = new CFCInvoker();
        invoker.directInvoke("/Applications/ColdFusion2016/cfusion/wwwroot/lang_app/tags/03-Advanced/DataGetterComponent.cfc");
    }
}
