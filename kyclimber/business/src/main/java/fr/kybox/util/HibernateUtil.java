package fr.kybox.util;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 * Provides an entityManager instance for the persistence services
 */
public class HibernateUtil {

    private static final String PERSISTENCE_UNIT = "kyclimber";
    private static EntityManagerFactory entityManagerFactory;
    private static EntityManager entityManager;

    // Logger object
    private static final Logger log = LogManager.getLogger(HibernateUtil.class);

    private static void setEntityManager(){

        if(log.isDebugEnabled()) log.debug("METHOD : setEntityManager()");

        entityManagerFactory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
        entityManager = entityManagerFactory.createEntityManager();
    }
    public static EntityManager getEntityManager(){

        if(log.isDebugEnabled()) log.debug("METHOD : getEntityManager()");

        if(entityManager == null) setEntityManager();

        return entityManager;
    }
}
