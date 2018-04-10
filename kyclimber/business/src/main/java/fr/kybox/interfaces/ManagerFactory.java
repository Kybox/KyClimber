package fr.kybox.interfaces;

import fr.kybox.interfaces.manager.CommentManager;
import fr.kybox.interfaces.manager.SiteManager;
import fr.kybox.interfaces.manager.UserManager;

/**
 * @author Kybox
 * @version 1.0
 */
public interface ManagerFactory {

    UserManager getUserManager();
    SiteManager getSiteManager();
    CommentManager getCommentManager();
}
