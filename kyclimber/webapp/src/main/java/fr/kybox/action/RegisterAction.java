package fr.kybox.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.kybox.bean.user.User;
import fr.kybox.interfaces.ManagerFactory;
import fr.kybox.util.MD5;
import javassist.NotFoundException;
import org.apache.commons.lang3.StringUtils;

import javax.inject.Inject;

/**
 * @author Kybox
 * @version 1.0
 */
public class RegisterAction extends ActionSupport {

    @Inject
    private ManagerFactory managerFactory;

    private String email;
    private String password;
    private String firstName;
    private String lastName;

    public void setEmail(String email) { this.email = email; }
    public void setPassword(String password) { this.password = password; }
    public void setFirstName(String firstName) { this.firstName = firstName; }
    public void setLastName(String lastName) { this.lastName = lastName; }

    public String doRegistration(){

        String result = ActionSupport.INPUT;

        if(!StringUtils.isAllEmpty(email, password, firstName)){

            User user = new User();
            user.setEmail(email);
            user.setFirstName(firstName);
            user.setLastName(lastName);
            user.setPassword(MD5.hash(password));
            managerFactory.getUserManager().addNewUser(user);
            result = ActionSupport.SUCCESS;
        }

        return result;
    }
}
