package fr.kybox.impl.services;

import fr.kybox.entities.Region;
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
 * Provides the necessary methods for finding and persisting Region entities
 */
@Service
public class RegionPersistenceService extends AbstractPersistenceService<Integer, Region> {

    // Logger object
    private static final Logger log = LogManager.getLogger(RegionPersistenceService.class);

    /**
     * Search for all region-type entities available with at least one Site entity
     * @return The found Region entities instance list or null if none has been found
     */
    public List<Region> findAllRegionsAvailable(){

        if(log.isDebugEnabled()) log.debug("METHOD : findAllRegionsAvailable()");

        List<Region> resultList = null;

        try{

            entityManager.getTransaction().begin();

            final List regionList = entityManager.createNamedQuery(Region.FIND_ALL_REGIONS_AVAILABLE)
                    .getResultList();
            resultList = regionList;

            entityManager.getTransaction().commit();

        }
        catch(PersistenceException | IllegalArgumentException e){

            entityManager.getTransaction().rollback();
            log.error(e);
        }

        return resultList;
    }

    /**
     * Search for all region-type entities
     * @return The found Region entities instance list or null if none has been found
     */
    public List<Region> findAllRegions(){

        if(log.isDebugEnabled()) log.debug("METHOD : findAllRegions()");

        List<Region> resultList = null;

        try{

            entityManager.getTransaction().begin();

            final List regionList = entityManager.createNamedQuery(Region.FIND_ALL_REGIONS)
                    .getResultList();
            resultList = regionList;

            entityManager.getTransaction().commit();

        }
        catch(PersistenceException | IllegalArgumentException e){

            entityManager.getTransaction().rollback();
            log.error(e);
        }

        return resultList;
    }

    /**
     * Search for all site-type entities available in a Region
     * @param id The Region ID
     * @return The number of Site entities available in the Region
     */
    public Integer countSitesByRegions(Integer id){

        if(log.isDebugEnabled()) log.debug("METHOD : countSitesByRegions("+ id +")");

        Integer result = null;

        try{

            entityManager.getTransaction().begin();

            Long count = (Long) entityManager.createNamedQuery(Region.COUNT_SITES_BY_REGIONS)
                    .setParameter("id", id)
                    .getSingleResult();
            result = Integer.valueOf(count.intValue());

            entityManager.getTransaction().commit();

        }
        catch(PersistenceException | IllegalArgumentException e){

            entityManager.getTransaction().rollback();
            log.error(e);
        }

        return result;
    }
}
