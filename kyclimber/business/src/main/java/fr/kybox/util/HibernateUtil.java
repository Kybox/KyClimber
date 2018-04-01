package fr.kybox.util;

import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

/**
 * @author Kybox
 * @version 1.0
 */
public class HibernateUtil {

    private static SessionFactory sessionFactory;
    private static Configuration configuration;

    private static void setFactory(){

        configuration = new Configuration().configure("hibernate.cfg.xml");
        sessionFactory = configuration.buildSessionFactory();
    }

    public static SessionFactory getSessionFactory() {

        if(sessionFactory == null) setFactory();
        return sessionFactory;
    }
}
