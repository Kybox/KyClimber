package fr.kybox.interfaces.manager;

import fr.kybox.entities.User;
import fr.kybox.exception.NotFoundException;

import java.util.List;


/**
 * @author Kybox
 * @version 1.0
 */
public interface UserManager {

    List<User> getUserList();

    User getUser(String login, String pass) throws NotFoundException;

    void addNewUser(User user);

}
