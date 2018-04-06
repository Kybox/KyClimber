package fr.kybox.impl.manager;

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
    private Configuration configuration;

    private void setFactory(){

        configuration = new Configuration().configure("hibernate.cfg.xml");
        sessionFactory = configuration.buildSessionFactory();
    }

    public SessionFactory getSessionFactory() {

        if(sessionFactory == null) setFactory();
        return sessionFactory;
    }

    @Override
    public Session getSession() {
        return null;
    }
}
