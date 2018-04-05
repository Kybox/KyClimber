package fr.kybox.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;


/**
 * @author Deepak Kumar
 * Web: http://www.roseindia.net
 */
public class HibernateUtil {

    private static final String PERSISTENCE_UNIT = "kyclimber";
    private static EntityManagerFactory entityManagerFactory;
    private static EntityManager entityManager;

    private static void setEntityManager(){

        entityManagerFactory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
        entityManager = entityManagerFactory.createEntityManager();
    }
    public static EntityManager getEntityManager(){

        if(entityManager == null) setEntityManager();

        return entityManager;
    }
}
