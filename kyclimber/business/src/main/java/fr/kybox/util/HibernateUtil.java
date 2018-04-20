package fr.kybox.util;

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
