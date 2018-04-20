package fr.kybox.impl;

import fr.kybox.entities.AbstractEntity;
import fr.kybox.interfaces.PersistenceService;
import fr.kybox.util.HibernateUtil;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.annotation.PostConstruct;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.lang.reflect.ParameterizedType;
import java.util.List;

/**
 * @author Kybox
 * @version 1.0
 */
public class AbstractPersistenceService<K, E extends AbstractEntity> implements PersistenceService<K, E> {

    protected Class<E> entityClass;

    //@PersistenceContext
    //protected EntityManager entityManager;
    //@PersistenceContext
    protected final EntityManager entityManager = HibernateUtil.getEntityManager();

    //@PersistenceContext(unitName = "kyclimber", type = PersistenceContextType.EXTENDED)
    //private EntityManager entityManager;

    private static final Logger logger = LogManager.getLogger(AbstractPersistenceService.class);

    @PostConstruct
    public void init() {
        ParameterizedType genericSuperclass = (ParameterizedType) getClass().getGenericSuperclass();
        this.entityClass = (Class<E>) genericSuperclass.getActualTypeArguments()[1];
    }

    @Override
    public E findById(K id) {
        return entityManager.find(entityClass, id);
    }

    @Override
    public E save(E entity) {
        logger.trace("Hibernate > save(E entity)");
        try{
            entityManager.getTransaction().begin();
            entityManager.merge(entity);
            entityManager.getTransaction().commit();
        }
        catch (Exception e){
            e.printStackTrace();
            entityManager.getTransaction().rollback();
            logger.error("Hibernate error in save(T entity) method !");
        }
        return entity;
    }


    @Override
    public List<E> findAll(){

        List<E> entityList = null;

        logger.trace("Hibernate > List<E> findAll()");
        try{
            entityManager.getTransaction().begin();
            final List resultList = entityManager.createNamedQuery(AbstractEntity.FIND_ALL).getResultList();
            entityList = resultList;
            entityManager.getTransaction().commit();
        }
        catch (Exception e){
            e.printStackTrace();
            entityManager.getTransaction().rollback();
            logger.error("Hibernate error in save(T entity) method !");
        }
        return entityList;
    }
}
