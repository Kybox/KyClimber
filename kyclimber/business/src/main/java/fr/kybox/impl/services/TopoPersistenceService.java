package fr.kybox.impl.services;

import fr.kybox.entities.*;
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
 * Provides the necessary methods for finding and persisting topo entities
 */
@Service
public class TopoPersistenceService extends AbstractPersistenceService<Integer, Topo> {

    // Logger object
    private static final Logger log = LogManager.getLogger(TopoPersistenceService.class);

    /**
     * Search for all topo-type entities
     * @return The found Topo entities instance list or null if none has been found
     */
    public List<Topo> findAllTopos(){

        if(log.isDebugEnabled()) log.debug("METHOD : findAllTopos()");

        List resultList = null;

        try{
            entityManager.getTransaction().begin();

            resultList = entityManager.createNamedQuery(Topo.FIND_ALL_TOPO).getResultList();

            entityManager.getTransaction().commit();
        }
        catch(PersistenceException | IllegalArgumentException e){

            entityManager.getTransaction().rollback();
            log.error(e);
        }

        return resultList;
    }

    /**
     * Search for a topo-type entities of the specified site.
     * If the entity instance is contained in the persistence context, it is returned from there.
     * @param site Site entity
     * @return The found Topo entities instance list or null if none has been found.
     */
    public List<Topo> findBySite(Site site){

        if(log.isDebugEnabled()) log.debug("METHOD : findBySite(" + site + ")");

        List resultList = null;

        try{

            entityManager.getTransaction().begin();

            resultList = entityManager.createNamedQuery(Topo.FIND_BY_SITE)
                    .setParameter("site", site)
                    .getResultList();

            entityManager.getTransaction().commit();
        }
        catch(PersistenceException | IllegalArgumentException e){

            entityManager.getTransaction().rollback();
            log.error(e);
        }

        return resultList;
    }

    /**
     * Search for a topo-type entities of the specified region.
     * If the entity instance is contained in the persistence context, it is returned from there.
     * @param region Region entity
     * @return The found Topo entities instance list or null if none has been found.
     */
    public List<Topo> findByRegion(Region region){

        if(log.isDebugEnabled()) log.debug("METHOD : findByRegion(" + region + ")");

        List resultList = null;

        try{

            entityManager.getTransaction().begin();

            resultList = entityManager.createNamedQuery(Topo.FIND_BY_REGION)
                    .setParameter("region", region)
                    .getResultList();

            entityManager.getTransaction().commit();

        }
        catch(PersistenceException | IllegalArgumentException e){

            entityManager.getTransaction().rollback();
            log.error(e);
        }

        return resultList;
    }

    /**
     * Search for lastest topo-type entities of the specified max results.
     * @param maxResults Integer for the max results
     * @return The found Topo entities instance list or null if none has been found.
     */
    public List<Topo> findLastestTopo(int maxResults) {

        if(log.isDebugEnabled()) log.debug("METHOD : findLastestTopo(" + maxResults + ")");

        List resultList = null;

        try{

            entityManager.getTransaction().begin();

            resultList = entityManager.createNamedQuery(Topo.FIND_LASTEST_TOPOS)
                    .setMaxResults(maxResults)
                    .getResultList();

            entityManager.getTransaction().commit();
        }
        catch(PersistenceException | IllegalArgumentException e){

            entityManager.getTransaction().rollback();
            log.error(e);
        }

        return resultList;
    }

    /**
     * Search for a topo-type entities of the specified keywords.
     * @param keywords The keywords contained in the entity
     * @return The found Topo entities instance list or null if none has been found
     */
    public List<Topo> findByKeywords(String keywords){

        if(log.isDebugEnabled()) log.debug("METHOD : findByKeywords(" + keywords + ")");

        List resultList = null;

        try{

            entityManager.getTransaction().begin();

            resultList = entityManager.createNamedQuery(Topo.FIND_BY_KEYWORDS)
                    .setParameter("keywords", "%" + keywords + "%")
                    .getResultList();
            entityManager.getTransaction().commit();


        }
        catch(PersistenceException | IllegalArgumentException e){

            entityManager.getTransaction().rollback();
            log.error(e);
        }

        return resultList;
    }


    /**
     * Search for a topo-type entities of the specified user.
     * If the entity instance is contained in the persistence context, it is returned from there.
     * @param user User entity
     * @return The found Topo entity instance or null if the entity does not exist.
     */
    public List<Topo> findAllByUser(User user) {

        if(log.isDebugEnabled()) log.debug("METHOD : findAllByUser(" + user + ")");

        List resultList = null;

        try {

            entityManager.getTransaction().begin();

            resultList = entityManager.createNamedQuery(Topo.FIND_BY_USER)
                    .setParameter("user", user)
                    .getResultList();

            entityManager.getTransaction().commit();
        }
        catch(PersistenceException | IllegalArgumentException e){

            entityManager.getTransaction().rollback();
            log.error(e);
        }

        return resultList;
    }
}
