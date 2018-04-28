package fr.kybox.impl.services;

import fr.kybox.entities.Level;
import fr.kybox.entities.User;
import fr.kybox.impl.AbstractPersistenceService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.persistence.*;
import java.util.List;

/**
 * @author Kybox
 * @version 1.0
 */

/**
 * Provides the necessary methods for finding and persisting user entities
 */
@Service
public class UserPersistenceService extends AbstractPersistenceService<Integer, User> {

    // Logger object
    private final Logger log = LogManager.getLogger(this.getClass());

    /**
     * Search for a user-type entity of the specified email and password.
     * If the entity instance is contained in the persistence context, it is returned from there.
     * @param email User email
     * @param password  User password
     * @return The found User entity instance or null if the entity does not exist.
     */
    public User findUserByLogin(String email, String password){

        if(log.isDebugEnabled()) log.debug("METHOD : findUserByLogin(" + email + ", " + password + ")");

        User user = null;

        try{

            entityManager.getTransaction().begin();

            user = (User) entityManager.createNamedQuery(User.FIND_USER_BY_LOGIN)
                    .setParameter("email", email)
                    .setParameter("pass", password)
                    .getSingleResult();

            entityManager.getTransaction().commit();
        }
        catch(PersistenceException | IllegalArgumentException e){

            entityManager.getTransaction().rollback();
            log.error(e);
        }

        return user;
    }

    /**
     * Search for all user-type entites
     * @return The found User entities instance list or null if none has been found
     */
    public List<User> findAllUsers(){

        if(log.isDebugEnabled()) log.debug("METHOD : findAllUsers()");

        List entityList = null;

        try{

            entityManager.getTransaction().begin();

            entityList = entityManager.createNamedQuery(User.FIND_ALL_USERS).getResultList();

            entityManager.getTransaction().commit();
        }
        catch(PersistenceException | IllegalArgumentException e){

            entityManager.getTransaction().rollback();
            log.error(e);
        }

        return entityList;
    }

    /**
     * Search for a user-type entities of the specified keywords.
     * @param keywords The keywords contained in the entity
     * @return The found User entities instance list or null if none has been found
     */
    public List<User> findUserByKeyword(String keywords){

        if(log.isDebugEnabled()) log.debug("METHOD : findUserByKeyword(" + keywords + ")");

        List entityList = null;
        keywords = "%" + keywords + "%";

        try{
            entityManager.getTransaction().begin();

            entityList = entityManager.createNamedQuery(User.FIND_USER_BY_KEYWORD)
                    .setParameter("keyword", keywords)
                    .getResultList();

            entityManager.getTransaction().commit();
        }
        catch(PersistenceException | IllegalArgumentException e){

            entityManager.getTransaction().rollback();
            log.error(e);
        }

        return entityList;
    }

    /**
     * Search for a level-type entity of the specified level
     * @param level The desired user level
     * @return The found Level entity instance list or null if none has been found
     */
    public Level getUserLevel(String level){

        if(log.isDebugEnabled()) log.debug("METHOD : getUserLevel()");

        Level entity = null;

        try{

            entityManager.getTransaction().begin();

            entity = (Level) entityManager.createNamedQuery(Level.GET_LEVEL)
                    .setParameter("level", level)
                    .getSingleResult();

            entityManager.getTransaction().commit();
        }
        catch(PersistenceException | IllegalArgumentException e){

            entityManager.getTransaction().rollback();
            log.error(e);
        }

        return entity;
    }
}
