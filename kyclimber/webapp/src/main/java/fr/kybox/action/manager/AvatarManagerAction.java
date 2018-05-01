package fr.kybox.action.manager;

import com.opensymphony.xwork2.ActionSupport;
import fr.kybox.entities.Avatar;
import fr.kybox.entities.User;
import fr.kybox.impl.services.AvatarPersistenceService;
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
 * Struts2 - AvatarManagerAction class
 * Manage the user's avatar
 */
public class AvatarManagerAction extends ActionSupport implements SessionAware {

    /** Logger object **/
    private final static Logger log = LogManager.getLogger(AvatarManagerAction.class);

    /** Injected services **/
    @Inject private AvatarPersistenceService avatarService;
    @Inject private UserPersistenceService userService;

    /** Attributes **/
    private Map<String, Object> session;
    private int userAvatarId;

    /** Getters / Setters **/
    public int getUserAvatarId() { return userAvatarId; }
    public void setUserAvatarId(int userAvatarId) { this.userAvatarId = userAvatarId; }

    /**
     * Overrided default execute method
     * Set and save the selected avatar
     * @return "success" if the update is performed otherwise "error"
     */
    @Override
    public String execute(){

        if(log.isDebugEnabled()) log.debug("METHOD : execute()");

        String result = ActionSupport.SUCCESS;

        User user = (User) session.get("user");

        if(user != null){

            Avatar avatar = avatarService.findById(userAvatarId);

            if(avatar != null){

                user.setAvatar(avatar);
                userService.merge(user);

            }
            else result = ActionSupport.ERROR;
        }
        else result = ActionSupport.ERROR;

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
