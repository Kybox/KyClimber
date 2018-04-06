package fr.kybox.action;


import com.opensymphony.xwork2.ActionSupport;
import fr.kybox.entities.User;
import fr.kybox.interfaces.ManagerFactory;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Kybox
 * @version 1.0
 */
public class UserAction extends ActionSupport {

    @Inject
    private ManagerFactory managerFactory;

    private List<User> userList = new ArrayList<>();

    public List<User> getUserList() { return userList; }

    public String doList(){

        userList = managerFactory.getUserManager().getUserList();

        return ActionSupport.SUCCESS;
    }
}
