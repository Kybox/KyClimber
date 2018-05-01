package fr.kybox.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.kybox.entities.Level;
import fr.kybox.entities.User;
import fr.kybox.impl.services.UserPersistenceService;
import fr.kybox.util.MD5;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.inject.Inject;

/**
 * @author Kybox
 * @version 1.0
 */

/**
 * Struts2 - SignupAction class
 * Registering a new User entity
 */
public class SignupAction extends ActionSupport {

    /** Logger object **/
    private final static Logger log = LogManager.getLogger(SignupAction.class);

    /** Injected service **/
    @Inject private UserPersistenceService userService;

    /** Attributes **/
    private User user;
    private String email;
    private String password;
    private String firstName;
    private String lastName;
    private String dpSignup = "open";
    private String result;

    /** Getters **/
    public void setEmail(String email) { this.email = email; }
    public void setPassword(String password) { this.password = password; }
    public void setFirstName(String firstName) { this.firstName = firstName; }
    public void setLastName(String lastName) { this.lastName = lastName; }
    public String getDpSignup() { return dpSignup; }
    public String getResult() { return result; }

    /** Setters **/
    public String getEmail() { return email; }
    public String getPassword() { return password; }
    public String getFirstName() { return firstName; }
    public String getLastName() { return lastName; }
    public String getDpOpen() { return dpSignup; }

    /**
     * Overrided default execute method
     * Create a new user account based on the data entered
     * @return "success" if a new user entity is created otherwise "input"
     */
    @Override
    public String execute(){

        if(log.isDebugEnabled()) log.debug("METHOD : execute()");

        if(!StringUtils.isAllEmpty(email, password, firstName)) {

            user = new User();
            user.setEmail(getEmail());
            user.setFirstName(getFirstName());
            user.setLastName(getLastName());
            user.setPassword(MD5.hash(getPassword()));
            user.setLevel(userService.getUserLevel(Level.DEFAULT));

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
