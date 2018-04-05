package fr.kybox.interfaces;

import fr.kybox.interfaces.manager.TopoManager;
import fr.kybox.interfaces.manager.UserManager;

/**
 * @author Kybox
 * @version 1.0
 */
public interface ManagerFactory {

    UserManager getUserManager();
    TopoManager getTopoManager();
}
