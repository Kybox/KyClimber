package fr.kybox.impl.services;

import fr.kybox.entities.Avatar;
import fr.kybox.entities.Topo;
import fr.kybox.entities.User;
import fr.kybox.impl.AbstractPersistenceService;
import fr.kybox.util.HibernateUtil;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import java.util.List;

/**
 * @author Kybox
 * @version 1.0
 */
@Service
public class TopoPersistenceService extends AbstractPersistenceService<Integer, Topo> {

    private static final Logger logger = LogManager.getLogger(TopoPersistenceService.class);

    public List<Topo> findAllByUser(User pUser) {

        List resultList = null;
        try {
            entityManager.getTransaction().begin();

            resultList = entityManager.createNamedQuery(Topo.FIND_BY_USER)
                    .setParameter("user", pUser)
                    .getResultList();

            entityManager.getTransaction().commit();
        }
        catch (Exception e) {
            e.printStackTrace();
            entityManager.getTransaction().rollback();
        }

        return resultList;
    }

    @Override
    public List<Topo> findAll(){

        List<Topo> entityList = null;

        logger.trace("Hibernate > List<E> findAll()");
        try{
            entityManager.getTransaction().begin();
            final List resultList = entityManager.createNamedQuery(Topo.FIND_ALL_TOPO).getResultList();
            entityList = resultList;
            entityManager.getTransaction().commit();
        }
        catch (Exception e){
            e.printStackTrace();
            entityManager.getTransaction().rollback();
            logger.error("Topo - Hibernate error findAll method !");
        }
        return entityList;
    }
}
