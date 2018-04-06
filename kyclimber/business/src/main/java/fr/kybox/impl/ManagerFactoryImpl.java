package fr.kybox.impl;

import fr.kybox.interfaces.ManagerFactory;
import fr.kybox.interfaces.manager.SiteManager;
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

    @Inject
    private SiteManager siteManager;


    @Override
    public UserManager getUserManager() {
       return this.userManager;
    }

    @Override
    public SiteManager getSiteManager() { return this.siteManager; }

    public void setUserManager(UserManager userManager){
        this.userManager = userManager;
    }
    public void setSiteManager(SiteManager siteManager){ this.siteManager = siteManager; }
}
