package fr.kybox.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.kybox.entities.User;
import fr.kybox.exception.NotFoundException;
import fr.kybox.interfaces.ManagerFactory;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.interceptor.SessionAware;

import javax.inject.Inject;
import java.util.Map;

/**
 * @author Kybox
 * @version 1.0
 */
public class LoginAction extends ActionSupport implements SessionAware {

    private String login;
    private String password;

    @Inject
    private ManagerFactory managerFactory;
    private Map<String, Object> session;

    public String getLogin() { return login; }
    public void setLogin(String login) { this.login = login; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String doLogin(){

        String result = ActionSupport.INPUT;

        if(!StringUtils.isAllEmpty(login, password)) {

            User user = null;
            try {
                user = managerFactory.getUserManager().getUser(login, password);
                this.session.put("user", user);
                result = ActionSupport.SUCCESS;
            } catch (NotFoundException e) {
                this.addActionError("Identifiant ou mot de passe invalide !");
            }
        }
        return result;
    }

    public String doLogout(){

        this.session.remove("user");
        return ActionSupport.SUCCESS;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }
}
