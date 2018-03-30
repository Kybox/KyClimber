package fr.kybox.impl.manager;

import fr.kybox.bean.user.User;
import fr.kybox.interfaces.manager.UserManager;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.inject.Named;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Kybox
 * @version 1.0
 */
@Named
public class UserManagerImpl extends AbstractManager implements UserManager {

    @Inject
    private UserManager userManager;

    private List<User> userList = new ArrayList<>();

    @Override
    public List<User> getUserList() {

        System.out.println("List created : " + userList.toString());
        return userList;
    }

    @PostConstruct
    private void initUserList(){

        for(int i = 0; i < 4; i++){
            User user = new User();
            user.setFirstName("User_" + i);
            user.setLastName("Climber");
            userList.add(user);
            System.out.println("New user !");
        }
    }

}
