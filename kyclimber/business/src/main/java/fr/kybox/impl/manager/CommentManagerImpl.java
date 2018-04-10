package fr.kybox.impl.manager;

import fr.kybox.entities.Comment;
import fr.kybox.entities.User;
import fr.kybox.interfaces.manager.CommentManager;
import fr.kybox.util.HibernateUtil;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.sql.Date;
import java.time.LocalDate;
import java.util.Calendar;
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

            Query query = entityManager.createQuery("select c from Comment c where siteId = :id order by date desc");
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

    @Override
    public void addNewComment(Comment comment) {

        System.out.println("CommentManagerImpl - addNewComment");

        if(entityManager.getTransaction().isActive()) {
            System.out.println("ENTITYMANAGER ACTIVE !");
            entityManager.getTransaction().rollback();
        }

        try{
            entityManager.getTransaction().begin();
            entityManager.merge(comment);
            entityManager.getTransaction().commit();
        }
        catch (Exception e){
            e.printStackTrace();
            entityManager.getTransaction().rollback();
        }
    }
}
