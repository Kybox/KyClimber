package fr.kybox.impl.manager;

import fr.kybox.entities.User;
import fr.kybox.exception.NotFoundException;
import fr.kybox.interfaces.manager.UserManager;
import fr.kybox.util.HibernateUtil;
import fr.kybox.util.MD5;

import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.Query;
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

        List<User> userList;

        entityManager.getTransaction().begin();

        Query query = entityManager.createQuery("select u from User u");
        userList = query.getResultList();

        entityManager.getTransaction().commit();

        return userList;
    }

    @Override
    public User getUser(String login, String pass) throws NotFoundException {

        pass = MD5.hash(pass);

        List<User> userList;
        entityManager.getTransaction().begin();
        String query = "from User u where u.email = :login and u.password = :pass";
        userList = entityManager.createQuery(query).setParameter("login", login).setParameter("pass", pass).getResultList();
        entityManager.getTransaction().commit();
        if(userList.isEmpty()) throw new NotFoundException();
        else return userList.get(0);
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

}
