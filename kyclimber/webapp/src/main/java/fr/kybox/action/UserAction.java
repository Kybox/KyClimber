package fr.kybox.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.kybox.entities.*;
import fr.kybox.impl.services.*;
import org.apache.struts2.interceptor.SessionAware;

import javax.inject.Inject;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * @author Kybox
 * @version 1.0
 */
public class UserAction extends ActionSupport implements SessionAware {

    @Inject
    private TopoPersistenceService topoService;

    @Inject
    private RegionPersistenceService regionService;

    @Inject
    private UserPersistenceService userService;

    @Inject
    private CommentPersistenceService commentService;

    @Inject
    private AvatarPersistenceService avatarService;

    private Map<String, Object> session;
    private User user;
    private String email;
    private String firstName;
    private String lastName;
    private String road;
    private String postalCode;
    private String city;
    private String country;


    private List<Avatar> avatarList;

    private List<Topo> topoList;
    private List<Region> regionList;
    private List<User> userList;

    private List<Comment> commentList;


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

    public String getPostalCode() { return postalCode; }
    public void setPostalCode(String postalCode) { this.postalCode = postalCode; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }

    public String getCountry() { return country; }
    public void setCountry(String country) { this.country = country; }

    public String getResult() { return result; }
    public void setResult(String result) { this.result = result; }

    public List<Avatar> getAvatarList(){
        avatarList = avatarService.findAll();
        System.out.println("avatarList size = " + avatarList.size());
        System.out.println("ARRAY = " + Arrays.toString(avatarList.toArray()));
        return avatarList;
    }

    public List<Topo> getTopoList() {
        topoList = topoService.findAll();
        System.out.println("topoList size = " + topoList.size());
        System.out.println("ARRAY = " + Arrays.toString(topoList.toArray()));
        return topoList;
    }
    public void setTopoList(List<Topo> topoList) { this.topoList = topoList; }

    public List<Region> getRegionList(){
        regionList = regionService.findAll();
        System.out.println("RegionList size = " + regionList.size());
        System.out.println("ARRAY = " + Arrays.toString(regionList.toArray()));
        return regionList;
    }
    public void setRegionList(List<Region> regionList) { this.regionList = regionList; }

    public List<User> getUserList(){
        userList = userService.findAll();
        return userList;
    }
    public void setUserList(List<User> userList) { this.userList = userList; }

    public List<Comment> getCommentList() {
        commentList = commentService.findByUser(user);
        return commentList;
    }

    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
    }

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

        userService.save(user);

        return ActionSupport.SUCCESS;
    }

    public String updateAjaxUserTopo(){

        return ActionSupport.SUCCESS;
    }


    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }
}
