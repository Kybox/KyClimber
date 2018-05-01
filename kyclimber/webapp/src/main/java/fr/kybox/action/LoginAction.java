package fr.kybox.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.kybox.entities.User;
import fr.kybox.impl.services.UserPersistenceService;
import fr.kybox.util.MD5;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * @author Kybox
 * @version 1.0
 */

/**
 * Struts2 - LoginAction class
 */
public class LoginAction extends ActionSupport implements SessionAware, ServletRequestAware {

    /** Logger object **/
    private final static Logger log = LogManager.getLogger(LoginAction.class);

    /** Injected service **/
    @Inject private UserPersistenceService userService;

    /** Attributes **/
    private String login;
    private String result;
    private String password;
    private Map<String, Object> session;
    private HttpServletRequest httpServletRequest;

    /** Getters **/
    public String getLogin() { return login; }
    public String getPassword() { return password; }
    public String getResult() { return result; }

    /** Setters **/
    public void setLogin(String login) { this.login = login; }
    public void setPassword(String password) { this.password = password; }

    /**
     * Creating a user session if the credentials are correct.
     * @return "success" if the session was created otherwise "input".
     */
    public String doLogin(){

        if(log.isDebugEnabled()) log.debug("METHOD : doLogin()");

        result = ActionSupport.INPUT;

        if(!StringUtils.isAllEmpty(login, password)) {

            final User user = userService.findUserByLogin(login, MD5.hash(password));

            if(user != null) {

                httpServletRequest.changeSessionId();

                this.session.put("user", user);

                result = ActionSupport.SUCCESS;
            }
            else result = ActionSupport.ERROR;
        }

        return result;
    }

    /**
     * Cancel user session validation
     * @return "success"
     */
    public String doLogout(){

        if(log.isDebugEnabled()) log.debug("METHOD : doLogout()");

        httpServletRequest.getSession().invalidate();

        return ActionSupport.SUCCESS;
    }

    /**
     * Overrided setSession method
     * @param session The current session
     */
    @Override
    public void setSession(Map<String, Object> session) {

        if(log.isDebugEnabled()) log.debug("METHOD : setSession()");

        this.session = session;
    }

    @Override
    public void setServletRequest(HttpServletRequest request) {

        httpServletRequest = request;
    }
}
