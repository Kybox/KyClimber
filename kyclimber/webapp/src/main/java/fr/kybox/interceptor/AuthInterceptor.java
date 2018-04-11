package fr.kybox.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * @author Kybox
 * @version 1.0
 */
public class AuthInterceptor extends AbstractInterceptor {

    @Override
    public String intercept(ActionInvocation invocation) throws Exception {

        String result;

        if(invocation.getInvocationContext().getSession().get("user") != null)
            result = invocation.invoke();
        else result = "error-forbidden";

        return result;
    }
}
