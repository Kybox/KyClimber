package fr.kybox.impl.services;

import fr.kybox.entities.Region;
import fr.kybox.entities.Site;
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
 * Provides the necessary methods for finding and persisting Site entities
 */
@Service
public class SitePersistenceService extends AbstractPersistenceService<Integer, Site> {

    // Logger object
    private static final Logger log = LogManager.getLogger(SitePersistenceService.class);

    /**
     * Search for lastest site-type entities of the specified max results.
     * @param maxResults Integer for the max results
     * @return The found Site entities instance list or null if none has been found.
     */
    public List<Site> findLastestSites(int maxResults) {

        if(log.isDebugEnabled()) log.debug("METHOD : findLastestSites(" + maxResults + ")");

        List resultList = null;

        try{

            entityManager.getTransaction().begin();

            resultList = entityManager.createNamedQuery(Site.FIND_LASTEST_SITES)
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
     * Search for a site-type entities of the specified site.
     * If the entity instance is contained in the persistence context, it is returned from there.
     * @param region Region entity
     * @return The found Site entities instance list or null if none has been found.
     */
    public List<Site> findByRegion(Region region){

        if(log.isDebugEnabled()) log.debug("METHOD : findByRegion(" + region + ")");

        List resultList = null;

        try{

            entityManager.getTransaction().begin();

            resultList = entityManager.createNamedQuery(Site.FIND_BY_REGION)
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
     * Search for a site-type entities of the specified keywords.
     * @param keywords The keywords contained in the entity
     * @return The found Site entities instance list or null if none has been found
     */
    public List<Site> findSiteByKeyword(String keywords){

        if(log.isDebugEnabled()) log.debug("METHOD : findSiteByKeyword(" + keywords + ")");

        keywords = "%" + keywords + "%";

        List resultList = null;

        try{

            entityManager.getTransaction().begin();

            resultList = entityManager.createNamedQuery(Site.FIND_BY_KEYWORD)
                    .setParameter("keyword", keywords)
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
     * Search for all site-type entites
     * @return The found Site entities instance list or null if none has been found
     */
    public List<Site> findAllSites(){

        if(log.isDebugEnabled()) log.debug("METHOD : findAllSites()");

        List resultList = null;

        try{

            entityManager.getTransaction().begin();

            resultList = entityManager.createNamedQuery(Site.FIND_ALL_SITES).getResultList();

            entityManager.getTransaction().commit();
        }
        catch(PersistenceException | IllegalArgumentException e){

            entityManager.getTransaction().rollback();
            log.error(e);
        }

        return resultList;
    }

}
