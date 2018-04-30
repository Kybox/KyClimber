package fr.kybox.impl.services;

import fr.kybox.entities.Avatar;
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
 * Provides the necessary methods for finding and persisting Avatar entities
 */
@Service
public class AvatarPersistenceService extends AbstractPersistenceService <Integer, Avatar> {

    // Logger object
    private static final Logger log = LogManager.getLogger(AvatarPersistenceService.class);

    /**
     * Search for all avatar-type entities
     * @return The found Avatar entities instance list or null if none has been found
     */
    public List<Avatar> findAllAvatar(){

        if(log.isDebugEnabled()) log.debug("METHOD : findAllAvatar()");

        List resultList = null;

        try{

            entityManager.getTransaction().begin();

            resultList = entityManager.createNamedQuery(Avatar.FIND_ALL_AVATAR).getResultList();

            entityManager.getTransaction().commit();
        }
        catch(PersistenceException | IllegalArgumentException e){

            entityManager.getTransaction().rollback();
            log.error(e);
        }

        return resultList;
    }
}
