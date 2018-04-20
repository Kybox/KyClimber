package fr.kybox.impl.services;

import fr.kybox.entities.Comment;
import fr.kybox.entities.Site;
import fr.kybox.entities.User;
import fr.kybox.impl.AbstractPersistenceService;
import fr.kybox.util.HibernateUtil;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import java.util.List;

/**
 * @author Kybox
 * @version 1.0
 */
@Service
public class CommentPersistenceService extends AbstractPersistenceService<Integer,Comment> {

    //private final EntityManager entityManager = HibernateUtil.getEntityManager();
    private static final Logger logger = LogManager.getLogger(CommentPersistenceService.class);

    public List<Comment> findByUser(User user){

        List resultList = null;

        try{

            entityManager.getTransaction().begin();
            resultList = entityManager.createNamedQuery(Comment.FIND_BY_USER)
                    .setParameter("user", user)
                    .getResultList();
            entityManager.getTransaction().commit();
        }
        catch (Exception e){
            e.printStackTrace();
            entityManager.getTransaction().rollback();
        }

        return resultList;
    }

    public List<Comment> findBySite(Site site){

        List<Comment> commentList = null;

        try{

            entityManager.getTransaction().begin();
            final List resultList = entityManager.createNamedQuery(Comment.FIND_BY_SITE)
                    .setParameter("site", site)
                    .getResultList();
            commentList = resultList;
            entityManager.getTransaction().commit();
        }
        catch (NoResultException e){ entityManager.getTransaction().rollback(); }

        return commentList;
    }
}
