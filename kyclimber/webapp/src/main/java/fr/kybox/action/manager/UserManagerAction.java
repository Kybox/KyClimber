package fr.kybox.action.manager;

import com.opensymphony.xwork2.ActionSupport;
import fr.kybox.entities.User;
import fr.kybox.impl.services.UserPersistenceService;
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
 * Struts2 - UserManagerAction class
 * Manage the login and personal user's informations
 */
public class UserManagerAction extends ActionSupport implements SessionAware {

    /** Logger object **/
    private final static Logger log = LogManager.getLogger(UserManagerAction.class);

    /** Injected service **/
    @Inject private UserPersistenceService userService;

    /** Attributes **/
    private String email;
    private String firstName;
    private String lastName;
    private String road;
    private String postalCode;
    private String city;
    private String country;
    private Map<String, Object> session;

    /** Getters **/
    public String getRoad() { return road; }
    public String getCity() { return city; }
    public String getEmail() { return email; }
    public String getCountry() { return country; }
    public String getLastName() { return lastName; }
    public String getFirstName() { return firstName; }
    public String getPostalCode() { return postalCode; }

    /** Setters **/
    public void setRoad(String road) { this.road = road; }
    public void setCity(String city) { this.city = city; }
    public void setEmail(String email) { this.email = email; }
    public void setCountry(String country) { this.country = country; }
    public void setLastName(String lastName) { this.lastName = lastName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }
    public void setPostalCode(String postalCode) { this.postalCode = postalCode; }

    /**
     * Overrided default execute method
     * Update User entity from the current session
     * @return "success" if the update is performed otherwise "error"
     */
    @Override
    public String execute(){

        if(log.isDebugEnabled()) log.debug("METHOD : execute()");

        String result = ActionSupport.SUCCESS;

        try{

            User user = (User) session.get("user");

            user.setEmail(getEmail());
            user.setFirstName(getFirstName());
            user.setLastName(getLastName());
            user.setRoad(getRoad());
            user.setPostalCode(getPostalCode());
            user.setCity(getCity());
            user.setCountry(getCountry());

            userService.merge(user);
        }
        catch (Exception e){

            result = ActionSupport.ERROR;
            log.error(e);
        }

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
