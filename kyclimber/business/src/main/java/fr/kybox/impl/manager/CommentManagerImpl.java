package fr.kybox.impl.manager;

import fr.kybox.entities.Comment;
import fr.kybox.interfaces.manager.CommentManager;
import fr.kybox.util.HibernateUtil;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;

/**
 * @author Kybox
 * @version 1.0
 */
@Service
public class CommentManagerImpl implements CommentManager {

    private final EntityManager entityManager = HibernateUtil.getEntityManager();

    @Override
    public List<Comment> getComments(int siteId) {

        List<Comment> commentList = null;

        try {
            entityManager.getTransaction().begin();

            Query query = entityManager.createQuery("select c from Comment c where siteId = :id");
            query.setParameter("id", siteId);

            commentList = query.getResultList();

            entityManager.getTransaction().commit();
        }
        catch (Exception e){
            e.printStackTrace();
            entityManager.getTransaction().rollback();
        }

        return commentList;
    }
}
