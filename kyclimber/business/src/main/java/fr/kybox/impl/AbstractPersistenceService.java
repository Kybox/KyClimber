package fr.kybox.impl;

import fr.kybox.entities.AbstractEntity;
import fr.kybox.interfaces.PersistenceService;
import fr.kybox.util.HibernateUtil;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.annotation.PostConstruct;
import javax.persistence.*;
import java.lang.reflect.ParameterizedType;

/**
 * @author Kybox
 * @version 1.0
 */
public class AbstractPersistenceService<K, E extends AbstractEntity> implements PersistenceService<K, E> {

    protected Class<E> entityClass;
    private final Logger log = LogManager.getLogger(this.getClass());
    protected final EntityManager entityManager = HibernateUtil.getEntityManager();

    @PostConstruct
    public void init() {

        if(log.isDebugEnabled()) log.debug("METHOD : init");

        ParameterizedType genericSuperclass = (ParameterizedType) getClass().getGenericSuperclass();

        this.entityClass = (Class<E>) genericSuperclass.getActualTypeArguments()[1];
    }

    @Override
    public E findById(K id) {

        if(log.isDebugEnabled()) log.debug("METHOD : findById(" + id + ")");

        E entity = null;

        try{
            entityManager.getTransaction().begin();
            entity = entityManager.find(entityClass, id);
            entityManager.getTransaction().commit();
        }
        catch (IllegalArgumentException e){
            entityManager.getTransaction().rollback();
            log.error("IllegalArgumentException");
            log.error(e);
        }

        return entity;
    }

    @Override
    public E merge(E entity) {

        if(log.isDebugEnabled()) log.debug("METHOD : merge(" + entity + ")");

        try{
            entityManager.getTransaction().begin();
            entityManager.merge(entity);
            entityManager.getTransaction().commit();
        }
        catch (IllegalArgumentException e){
            entityManager.getTransaction().rollback();
            log.error("IllegalArgumentException");
            log.error(e);
        }
        catch (TransactionRequiredException e){
            entityManager.getTransaction().rollback();
            log.error("TransactionRequiredException");
            log.error(e);
        }

        return entity;
    }

    @Override
    public void persist(E entity) {

        if(log.isDebugEnabled()) log.debug("METHOD : persist(" + entity + ")");

        try{
            entityManager.getTransaction().begin();
            entityManager.persist(entity);
            entityManager.getTransaction().commit();
        }
        catch (EntityExistsException e){
            entityManager.getTransaction().rollback();
            log.error("EntityExistsException");
            log.error(e);
        }
        catch (IllegalArgumentException e){
            entityManager.getTransaction().rollback();
            log.error("IllegalArgumentException");
            log.error(e);
        }
        catch (TransactionRequiredException e){
            entityManager.getTransaction().rollback();
            log.error("TransactionRequiredException");
            log.error(e);
        }
    }

    @Override
    public void remove(E entity) {

        if(log.isDebugEnabled()) log.debug("METHOD : remove(" + entity + ")");

        try{
            entityManager.getTransaction().begin();
            entityManager.remove(entity);
            entityManager.getTransaction().commit();
        }
        catch (IllegalArgumentException e){
            entityManager.getTransaction().rollback();
            log.error("IllegalArgumentException");
            log.error(e);
        }
        catch (TransactionRequiredException e){
            entityManager.getTransaction().rollback();
            log.error("TransactionRequiredException");
            log.error(e);
        }
    }
}
