package fr.kybox.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.kybox.entities.User;
import fr.kybox.impl.services.UserPersistenceService;
import fr.kybox.util.MD5;
import org.apache.commons.lang3.StringUtils;

import javax.inject.Inject;

/**
 * @author Kybox
 * @version 1.0
 */
public class SignupAction extends ActionSupport {

    @Inject
    private UserPersistenceService userService;

    private User user;
    private String email;
    private String password;
    private String firstName;
    private String lastName;
    private String dpSignup = "open";
    private String result;

    public void setEmail(String email) { this.email = email; }
    public void setPassword(String password) { this.password = password; }
    public void setFirstName(String firstName) { this.firstName = firstName; }
    public void setLastName(String lastName) { this.lastName = lastName; }
    public String getDpSignup() { return dpSignup; }
    public String getResult() { return result; }

    public String getEmail() { return email; }
    public String getPassword() { return password; }
    public String getFirstName() { return firstName; }
    public String getLastName() { return lastName; }
    public String getDpOpen() { return dpSignup; }

    @Override
    public String execute(){

        if(!StringUtils.isAllEmpty(email, password, firstName)) {
            user = new User();
            user.setEmail(email);
            user.setFirstName(firstName);
            user.setLastName(lastName);
            user.setPassword(MD5.hash(password));
            userService.merge(user);

            result = ActionSupport.SUCCESS;
        }
        else{
            this.addActionError("Les champs marqués d'un astérisque (*) sont obligatoires.");
            result = ActionSupport.INPUT;
        }

        return result;
    }
}
