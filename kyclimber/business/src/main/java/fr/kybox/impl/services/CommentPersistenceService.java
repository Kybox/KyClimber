package fr.kybox.impl.services;

import fr.kybox.entities.Comment;
import fr.kybox.entities.Site;
import fr.kybox.entities.User;
import fr.kybox.impl.AbstractPersistenceService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.persistence.PersistenceException;
import java.util.List;

/**
 * @author Kybox
 * @version 1.0
 */

/**
 * Provides the necessary methods for finding and persisting Comment entities
 */
@Service
public class CommentPersistenceService extends AbstractPersistenceService<Integer,Comment> {

    // Logger object
    private static final Logger log = LogManager.getLogger(CommentPersistenceService.class);

    /**
     * Search for a comment-type entities of the specified user.
     * @param user User entity
     * @return The found Comment entities instance list or null if none has been found.
     */
    public List<Comment> findByUser(User user){

        if(log.isDebugEnabled()) log.debug("METHOD : findByUser("+ user +")");

        List resultList = null;

        try{

            entityManager.getTransaction().begin();

            resultList = entityManager.createNamedQuery(Comment.FIND_BY_USER)
                    .setParameter("user", user)
                    .getResultList();

            entityManager.getTransaction().commit();
        }
        catch(PersistenceException | IllegalArgumentException e){

            entityManager.getTransaction().rollback();
            log.error(e);
        }

        return resultList;
    }

    /**
     * Search for a comment-type entities of the specified Site.
     * @param site The Site entity
     * @return The found Comment entities instance list or null if none has been found.
     */
    public List<Comment> findBySite(Site site){

        if(log.isDebugEnabled()) log.debug("METHOD : findBySite("+ site +")");

        List resultList = null;

        try{

            entityManager.getTransaction().begin();

            resultList = entityManager.createNamedQuery(Comment.FIND_BY_SITE)
                    .setParameter("site", site)
                    .getResultList();

            entityManager.getTransaction().commit();
        }
        catch(PersistenceException | IllegalArgumentException e){

            entityManager.getTransaction().rollback();
            log.error(e);
        }

        return resultList;
    }
}
