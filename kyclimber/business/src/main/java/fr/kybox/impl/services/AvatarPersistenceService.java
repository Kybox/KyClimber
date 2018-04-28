package fr.kybox.impl.services;

import fr.kybox.entities.AbstractEntity;
import fr.kybox.entities.Avatar;
import fr.kybox.impl.AbstractPersistenceService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Kybox
 * @version 1.0
 */
@Service
public class AvatarPersistenceService extends AbstractPersistenceService <Integer, Avatar> {

    private static final Logger logger = LogManager.getLogger(AvatarPersistenceService.class);

    @Override
    public List<Avatar> findAll(){

        List<Avatar> entityList = null;

        logger.trace("Hibernate > List<E> findAllUsers()");
        try{
            entityManager.getTransaction().begin();
            final List resultList = entityManager.createNamedQuery(Avatar.FIND_ALL_AVATAR).getResultList();
            entityList = resultList;
            entityManager.getTransaction().commit();
        }
        catch (Exception e){
            e.printStackTrace();
            entityManager.getTransaction().rollback();
            logger.error("Hibernate error in merge(T entity) method !");
        }
        return entityList;
    }
}
