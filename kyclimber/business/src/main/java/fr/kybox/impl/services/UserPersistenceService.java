package fr.kybox.impl.services;

import fr.kybox.entities.Avatar;
import fr.kybox.entities.User;
import fr.kybox.impl.AbstractPersistenceService;
import fr.kybox.util.HibernateUtil;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;

/**
 * @author Kybox
 * @version 1.0
 */
@Service
public class UserPersistenceService extends AbstractPersistenceService<Integer, User> {

    //private final EntityManager entityManager = HibernateUtil.getEntityManager();
    private static final Logger logger = LogManager.getLogger(UserPersistenceService.class);

    public User findUserByLogin(String pEmail, String pPass){

        User user = null;

        try{

            entityManager.getTransaction().begin();

            user = (User) entityManager.createNamedQuery(User.FIND_USER_BY_LOGIN)
                    .setParameter("email", pEmail)
                    .setParameter("pass", pPass)
                    .getSingleResult();

            entityManager.getTransaction().commit();
        }
        catch (NoResultException e){
            entityManager.getTransaction().rollback();
        }

        return user;
    }

    @Override
    public List<User> findAll(){

        List<User> entityList = null;

        logger.trace("Hibernate > List<E> findAll()");
        try{
            entityManager.getTransaction().begin();
            final List resultList = entityManager.createNamedQuery(User.FIND_ALL_USERS).getResultList();
            entityList = resultList;
            entityManager.getTransaction().commit();
        }
        catch (Exception e){
            e.printStackTrace();
            entityManager.getTransaction().rollback();
            logger.error("Hibernate error in merge(T entity) method !");
        }
        return entityList;
    }


    public List<User> findUserByKeyword(String keyword){

        List<User> entityList = null;
        keyword = "%" + keyword + "%";
        System.out.println("Search pattern = " + keyword);

        try{
            entityManager.getTransaction().begin();
            final List resultList = entityManager.createNamedQuery(User.FIND_USER_BY_KEYWORD)
                    .setParameter("keyword", keyword)
                    .getResultList();
            entityList = resultList;
            entityManager.getTransaction().commit();
        }
        catch (NoResultException e){
            e.printStackTrace();
            entityManager.getTransaction().rollback();
            logger.error("No result exception !");
        }

        return entityList;
    }
}
