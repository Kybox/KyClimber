package fr.kybox.action.manager;

import com.opensymphony.xwork2.ActionSupport;
import fr.kybox.entities.User;
import fr.kybox.impl.services.UserPersistenceService;
import org.apache.struts2.interceptor.SessionAware;

import javax.inject.Inject;
import java.util.Map;

/**
 * @author Kybox
 * @version 1.0
 */
public class UserManagerAction extends ActionSupport implements SessionAware {

    @Inject
    UserPersistenceService userService;

    private Map<String, Object> session;

    private String email;
    private String firstName;
    private String lastName;
    private String road;
    private String postalCode;
    private String city;
    private String country;

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }

    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }

    public String getRoad() { return road; }
    public void setRoad(String road) { this.road = road; }

    public String getPostalCode() { return postalCode; }
    public void setPostalCode(String postalCode) { this.postalCode = postalCode; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }

    public String getCountry() { return country; }
    public void setCountry(String country) { this.country = country; }


    @Override
    public String execute(){

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
        catch (Exception e){ result = ActionSupport.ERROR; }

        return result;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }
}
