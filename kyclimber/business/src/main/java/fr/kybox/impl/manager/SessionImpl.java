package fr.kybox.impl.manager;

import fr.kybox.bean.user.User;
import fr.kybox.interfaces.manager.SessionManager;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 * @author Kybox
 * @version 1.0
 */
public class SessionImpl implements SessionManager {

    private SessionFactory sessionFactory;

    private void setFactory(){

        sessionFactory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(User.class).buildSessionFactory();
    }

    @Override
    public Session getSession() {
        return null;
    }
}
