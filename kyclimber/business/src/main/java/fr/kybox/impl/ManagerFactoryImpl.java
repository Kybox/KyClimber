package fr.kybox.impl;

import fr.kybox.interfaces.ManagerFactory;
import fr.kybox.interfaces.manager.UserManager;

import javax.inject.Inject;
import javax.inject.Named;

/**
 * @author Kybox
 * @version 1.0
 */
@Named("managerFactory")
public class ManagerFactoryImpl implements ManagerFactory {

    @Inject
    private UserManager userManager;


    @Override
    public UserManager getUserManager() {
       return this.userManager;
    }

    public void setUserManager(UserManager userManager){
        this.userManager = userManager;
    }
}
