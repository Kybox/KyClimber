package fr.kybox.action.manager;

import com.opensymphony.xwork2.ActionSupport;
import fr.kybox.entities.*;
import fr.kybox.impl.services.*;
import org.apache.struts2.interceptor.SessionAware;

import javax.inject.Inject;
import java.util.List;
import java.util.Map;

/**
 * @author Kybox
 * @version 1.0
 */
public class ProfilManagerAction extends ActionSupport implements SessionAware {

    /** Injected beans **/
    @Inject private UserPersistenceService userService;
    @Inject private SitePersistenceService siteService;
    @Inject private TopoPersistenceService topoService;
    @Inject private AvatarPersistenceService avatarService;
    @Inject private CommentPersistenceService commentService;

    private Map<String, Object> session;
    private User user;

    public User getUser() { return user; }
    private void setUser(User user) { this.user = user; }

    public List<User> getUserList() { return userService.findAll(); }
    public List<Topo> getTopoList() { return topoService.findAll(); }
    public List<Site> getSiteList() { return siteService.findAll(); }
    public List<Avatar> getAvatarList(){ return avatarService.findAll(); }
    public List<Comment> getCommentList() { return commentService.findByUser(getUser()); }

    @Override
    public String execute(){
        setUser((User) session.get("user"));
        return ActionSupport.SUCCESS;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }
}