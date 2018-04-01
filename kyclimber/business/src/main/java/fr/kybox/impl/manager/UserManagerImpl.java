package fr.kybox.impl.manager;

import fr.kybox.bean.user.User;
import fr.kybox.interfaces.manager.UserManager;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Kybox
 * @version 1.0
 */
@Service
public class UserManagerImpl extends AbstractManager implements UserManager {

    @Inject
    private UserManager userManager;

    private List<User> userList = new ArrayList<>();

    @Override
    public List<User> getUserList() {

        SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(User.class).buildSessionFactory();

        Session session = factory.getCurrentSession();

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

    @PostConstruct
    private void initUserList(){

        for(int i = 0; i < 4; i++){
            User user = new User();
            user.setFirstName("User_" + i);
            user.setLastName("Climber");
            userList.add(user);
            System.out.println("New user !");
        }
    }

}
