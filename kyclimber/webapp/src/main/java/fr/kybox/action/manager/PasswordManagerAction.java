package fr.kybox.action.manager;

import com.opensymphony.xwork2.ActionSupport;
import fr.kybox.entities.User;
import fr.kybox.impl.services.UserPersistenceService;
import fr.kybox.util.MD5;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.interceptor.SessionAware;

import javax.inject.Inject;
import java.util.Map;

/**
 * @author Kybox
 * @version 1.0
 */

/**
 * Struts2 - PasswordManagerAction class
 * Manage the user's password
 */
public class PasswordManagerAction extends ActionSupport implements SessionAware {

    /** Logger object **/
    private final static Logger log = LogManager.getLogger(PasswordManagerAction.class);

    /** Injected service **/
    @Inject private UserPersistenceService userService;

    /** Attributes **/
    private String result;
    private String oldPassword;
    private String newPassword;
    private Map<String, Object> session;

    /** Getters / Setters **/
    public String getOldPassword() { return oldPassword; }
    public void setOldPassword(String oldPassword) { this.oldPassword = oldPassword; }
    public String getNewPassword() { return newPassword; }
    public void setNewPassword(String newPassword) { this.newPassword = newPassword; }

    /**
     * Overrided default execute method
     * Update the user's password
     * @return "success" if the update is performed otherwise "error"
     */
    @Override
    public String execute(){

        if(log.isDebugEnabled()) log.debug("METHOD : execute()");

        final User user = (User) session.get("user");

        if(user.getPassword().equals(MD5.hash(oldPassword))){

            user.setPassword(MD5.hash(newPassword));
            userService.merge(user);
            result = ActionSupport.SUCCESS;
        }
        else result = ActionSupport.ERROR;

        return result;
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
}
