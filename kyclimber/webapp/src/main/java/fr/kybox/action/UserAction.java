package fr.kybox.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.kybox.entities.User;
import fr.kybox.interfaces.ManagerFactory;
import fr.kybox.util.MD5;
import org.apache.struts2.interceptor.SessionAware;

import javax.inject.Inject;
import java.util.Map;

/**
 * @author Kybox
 * @version 1.0
 */
public class UserAction extends ActionSupport implements SessionAware {

    @Inject
    private ManagerFactory managerFactory;

    private Map<String, Object> session;
    private User user;
    private String email;
    private String firstName;
    private String lastName;
    private String road;
    private Integer postalCode;
    private String city;
    private String country;
    private Integer tel;
    private String oldPass;
    private String newPass1;
    private String newPass2;

    private String result;

    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }

    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }

    public String getRoad() { return road; }
    public void setRoad(String road) { this.road = road; }

    public Integer getPostalCode() { return postalCode; }
    public void setPostalCode(Integer postalCode) { this.postalCode = postalCode; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }

    public String getCountry() { return country; }
    public void setCountry(String country) { this.country = country; }

    public Integer getTel() { return tel; }
    public void setTel(Integer tel) { this.tel = tel; }

    public String getOldPass() { return oldPass; }
    public void setOldPass(String oldPass) { this.oldPass = oldPass; }

    public String getNewPass1() { return newPass1; }
    public void setNewPass1(String newPass1) { this.newPass1 = newPass1; }

    public String getNewPass2() { return newPass2; }
    public void setNewPass2(String newPass2) { this.newPass2 = newPass2; }

    public String getResult() { return result; }
    public void setResult(String result) { this.result = result; }

    private void initUser() { setUser((User) session.get("user")); }

    @Override
    public String execute(){

        initUser();
        return ActionSupport.SUCCESS;
    }

    public String updateAjaxInfos(){

        if(user == null) initUser();

        user.setEmail(getEmail());
        user.setFirstName(getFirstName());
        user.setLastName(getLastName());
        user.setRoad(getRoad());
        user.setPostalCode(getPostalCode());
        user.setCity(getCity());
        user.setCountry(getCountry());
        user.setTel(getTel());

        managerFactory.getUserManager().updateUser(user);

        return ActionSupport.SUCCESS;
    }

    public String updateAjaxUserPassword(){

        if(user == null) initUser();

        if(getOldPass().equals(user.getPassword())){

            if(getNewPass1().equals(getNewPass2())){

                user.setPassword(getNewPass1());

                managerFactory.getUserManager().updateUser(user);

                setResult(ActionSupport.SUCCESS);
            }
            else setResult(ActionSupport.ERROR);
        }
        else setResult(ActionSupport.ERROR);

        return result;
    }


    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }
}
