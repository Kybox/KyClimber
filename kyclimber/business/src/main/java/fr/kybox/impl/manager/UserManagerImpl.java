package fr.kybox.impl.manager;

import fr.kybox.bean.user.User;
import fr.kybox.exception.NotFoundException;
import fr.kybox.interfaces.manager.UserManager;
import fr.kybox.util.MD5;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * @author Kybox
 * @version 1.0
 */
@Service
public class UserManagerImpl extends AbstractManager implements UserManager {

    private SessionFactory factory;

    private Session getSession(){

        factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(User.class).buildSessionFactory();
        return factory.getCurrentSession();
    }

    @Override
    public List<User> getUserList() {

        Session session = getSession();
        List<User> userList;

        try {
            session.beginTransaction();
            userList = session.createQuery("from User").list();
            session.getTransaction().commit();
        }
        finally {
            factory.close();
        }

        return userList;
    }

    @Override
    public User getUser(String login, String pass) throws NotFoundException {
        pass = MD5.hash(pass);
        Session session = getSession();
        List<User> userList;
        try {
            session.beginTransaction();
            String query = "from User u where u.email = :login and u.password = :pass";
            userList = session.createQuery(query).setParameter("login", login).setParameter("pass", pass).list();
        }
        finally { factory.close(); }

        if(userList.isEmpty()) throw new NotFoundException();
        else return userList.get(0);
    }

    @Override
    public void addNewUser(User user) {

        Session session = getSession();
        try {
            session.beginTransaction();
            session.save(user);
            session.getTransaction().commit();
        }
        finally {
            factory.close();
        }
    }

}
