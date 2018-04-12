package fr.kybox.impl.manager;

import fr.kybox.entities.Avatar;
import fr.kybox.entities.User;
import fr.kybox.exception.NotFoundException;
import fr.kybox.interfaces.manager.UserManager;
import fr.kybox.util.HibernateUtil;
import fr.kybox.util.MD5;

import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import java.util.List;


/**
 * @author Kybox
 * @version 1.0
 */

@Service
public class UserManagerImpl extends AbstractManager implements UserManager {

    private final EntityManager entityManager = HibernateUtil.getEntityManager();

    @Override
    public List<User> getUserList() {

        entityManager.getTransaction().begin();

        final TypedQuery<User> query = entityManager.createQuery("select u from User u", User.class);
        final List<User> userList = query.getResultList();

        entityManager.getTransaction().commit();

        return userList;
    }

    @Override
    public User getUser(String login, String pass) throws NotFoundException {

        pass = MD5.hash(pass);

        entityManager.getTransaction().begin();

        String query = "from User u where u.email = :login and u.password = :pass";

        final User user = (User) entityManager.createQuery(query).
                setParameter("login", login).
                setParameter("pass", pass).
                getSingleResult();

        entityManager.getTransaction().commit();

        return user;
    }

    @Override
    public User getUser(int userId) throws NotFoundException {

        User user = null;

        try {
            List<User> userList;
            entityManager.getTransaction().begin();
            Query query = entityManager.createQuery("select u from User u where id = :id");
            query.setParameter("id", userId);
            userList = query.getResultList();
            entityManager.getTransaction().commit();
            if(!userList.isEmpty()) user = userList.get(0);
            else throw new NotFoundException();
        }
        catch (Exception e){
            entityManager.getTransaction().rollback();
            e.printStackTrace();
        }

        return user;
    }

    @Override
    public void addNewUser(User user) {

        try {
            entityManager.getTransaction().begin();
            entityManager.persist(user);
            entityManager.getTransaction().commit();
        }
        catch (Exception e){
            e.printStackTrace();
            entityManager.getTransaction().rollback();
        }
    }

    @Override
    public void updateUser(User user){

        System.out.println("UPDATE USER");

        try{
            entityManager.getTransaction().begin();
            entityManager.merge(user);
            entityManager.getTransaction().commit();
        }
        catch (Exception e){
            e.printStackTrace();
            entityManager.getTransaction().rollback();
        }
    }

    @Override
    public List<Avatar> getAvatarList() {

        List<Avatar> avatarList = null;

        try {

            entityManager.getTransaction().begin();
            avatarList = entityManager.createQuery("select a from Avatar a", Avatar.class).getResultList();
            entityManager.getTransaction().commit();
        }
        catch (Exception e){
            e.printStackTrace();
            entityManager.getTransaction().rollback();
        }

        return avatarList;
    }

    @Override
    public String getAvatarUrl(int avatarId) {

        String avatarUrl = null;

        try {

            entityManager.getTransaction().begin();

            Query query = entityManager.createQuery("select a.url from Avatar a where id = :id");
            query.setParameter("id", avatarId);

            avatarUrl = (String) query.getSingleResult();

            entityManager.getTransaction().commit();
        }
        catch (Exception e){
            e.printStackTrace();
            entityManager.getTransaction().rollback();
        }

        return avatarUrl;
    }

}
