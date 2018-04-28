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
    private List<Site> siteList;

    private String result;



    public String getResult() { return result; }
    public void setResult(String result) { this.result = result; }



    public List<Topo> getTopoList() {
        topoList = topoService.findAllTopos();
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
        userList = userService.findAllUsers();
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



    @Override
    public String execute(){



        return ActionSupport.SUCCESS;
    }

    public String updateAjaxInfos(){


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
