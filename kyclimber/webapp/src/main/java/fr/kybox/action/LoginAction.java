package fr.kybox.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.kybox.entities.User;
import fr.kybox.impl.services.UserPersistenceService;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * @author Kybox
 * @version 1.0
 */
public class LoginAction extends ActionSupport implements SessionAware, ServletRequestAware {

    private String result;
    private String login;
    private String password;

    @Inject
    private UserPersistenceService userService;

    private Map<String, Object> session;
    private HttpServletRequest httpServletRequest;

    public String getLogin() { return login; }
    public void setLogin(String login) { this.login = login; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getResult() { return result; }

    public String doLogin(){

        result = ActionSupport.INPUT;

        if(!StringUtils.isAllEmpty(login, password)) {

            final User user = userService.findUserByLogin(login, password);

            if(user != null) {
                httpServletRequest.changeSessionId();
                this.session.put("user", user);
                result = ActionSupport.SUCCESS;
            }
            else result = ActionSupport.ERROR;
        }
        return result;
    }

    public String doLogout(){
        httpServletRequest.getSession().invalidate();
        return ActionSupport.SUCCESS;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    @Override
    public void setServletRequest(HttpServletRequest request) {
        httpServletRequest = request;
    }
}
