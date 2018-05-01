package fr.kybox.action.manager;

import com.opensymphony.xwork2.ActionSupport;
import fr.kybox.entities.*;
import fr.kybox.impl.services.*;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.interceptor.SessionAware;

import javax.inject.Inject;
import java.util.List;
import java.util.Map;

/**
 * @author Kybox
 * @version 1.0
 */

/**
 * Struts2 - ProfilManagerAction class
 * Load all current user data
 */
public class ProfilManagerAction extends ActionSupport implements SessionAware {

    /** Logger object **/
    private final static Logger log = LogManager.getLogger(ProfilManagerAction.class);

    /** Injected services **/
    @Inject private UserPersistenceService userService;
    @Inject private SitePersistenceService siteService;
    @Inject private TopoPersistenceService topoService;
    @Inject private AvatarPersistenceService avatarService;
    @Inject private CommentPersistenceService commentService;

    /** Attributes **/
    private Map<String, Object> session;
    private User user;

    /** Getters / Setters **/
    public User getUser() { return user; }
    private void setUser(User user) { this.user = user; }
    public List<User> getUserList() { return userService.findAllUsers(); }
    public List<Topo> getTopoList() { return topoService.findAllTopos(); }
    public List<Site> getSiteList() { return siteService.findAllSites(); }
    public List<Avatar> getAvatarList(){ return avatarService.findAllAvatar(); }
    public List<Comment> getCommentList() { return commentService.findByUser(getUser()); }

    /**
     * Overrided default execute method
     * Set user entity from the current session
     * @return "success"
     */
    @Override
    public String execute(){

        if(log.isDebugEnabled()) log.debug("METHOD : execute()");

        setUser((User) session.get("user"));

        return ActionSupport.SUCCESS;
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