package fr.kybox.action.manager;

import com.opensymphony.xwork2.ActionSupport;
import fr.kybox.entities.User;
import fr.kybox.impl.services.UserPersistenceService;
import fr.kybox.util.MD5;
import org.apache.struts2.interceptor.SessionAware;

import javax.inject.Inject;
import java.util.Map;

/**
 * @author Kybox
 * @version 1.0
 */
public class PasswordManagerAction extends ActionSupport implements SessionAware {

    @Inject
    private UserPersistenceService userService;

    private String result;
    private String oldPassword;
    private String newPassword;
    private Map<String, Object> session;

    public String getOldPassword() { return oldPassword; }
    public void setOldPassword(String oldPassword) { this.oldPassword = oldPassword; }
    public String getNewPassword() { return newPassword; }
    public void setNewPassword(String newPassword) { this.newPassword = newPassword; }

    @Override
    public String execute(){

        final User user = (User) session.get("user");

        if(user.getPassword().equals(MD5.hash(oldPassword))){

            user.setPassword(MD5.hash(newPassword));
            userService.merge(user);
            result = ActionSupport.SUCCESS;
        }
        else result = ActionSupport.ERROR;

        return result;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }
}
