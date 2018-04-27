package fr.kybox.action.manager;

import com.opensymphony.xwork2.ActionSupport;
import fr.kybox.entities.Avatar;
import fr.kybox.entities.User;
import fr.kybox.impl.services.AvatarPersistenceService;
import fr.kybox.impl.services.UserPersistenceService;
import org.apache.struts2.interceptor.SessionAware;

import javax.inject.Inject;
import java.util.Map;

/**
 * @author Kybox
 * @version 1.0
 */
public class AvatarManagerAction extends ActionSupport implements SessionAware {

    @Inject
    private AvatarPersistenceService avatarService;

    @Inject
    private UserPersistenceService userService;

    private Map<String, Object> session;
    private int userAvatarId;

    public int getUserAvatarId() { return userAvatarId; }
    public void setUserAvatarId(int userAvatarId) { this.userAvatarId = userAvatarId; }

    @Override
    public String execute(){

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

    @Override
    public void setSession(Map<String, Object> session) { this.session = session; }
}
