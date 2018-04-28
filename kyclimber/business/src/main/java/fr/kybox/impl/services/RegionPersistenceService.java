package fr.kybox.impl.services;

import fr.kybox.entities.Region;
import fr.kybox.impl.AbstractPersistenceService;
import org.springframework.stereotype.Service;

import javax.ejb.Stateless;
import javax.persistence.NoResultException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Kybox
 * @version 1.0
 */
@Service
public class RegionPersistenceService extends AbstractPersistenceService<Integer, Region> {

    public List<Region> findAllRegionsAvailable(){

        List<Region> resultList = null;

        try{

            entityManager.getTransaction().begin();
            final List regionList = entityManager.createNamedQuery(Region.FIND_ALL_REGIONS_AVAILABLE)
                    .getResultList();
            resultList = regionList;
            entityManager.getTransaction().commit();

        }
        catch (NoResultException e){
            e.printStackTrace();
            entityManager.getTransaction().rollback();
        }
        catch (Exception e){
            e.printStackTrace();
        }

        return resultList;
    }

    public List<Region> findAllRegions(){

        List<Region> resultList = null;

        try{

            entityManager.getTransaction().begin();
            final List regionList = entityManager.createNamedQuery(Region.FIND_ALL_REGIONS)
                    .getResultList();
            resultList = regionList;
            entityManager.getTransaction().commit();

        }
        catch (NoResultException e){
            e.printStackTrace();
            entityManager.getTransaction().rollback();
        }
        catch (Exception e){
            e.printStackTrace();
        }

        return resultList;
    }

    public Integer countRegion(Integer id){

        Integer result = null;

        try{
            entityManager.getTransaction().begin();

            Long count = (Long) entityManager.createNamedQuery(Region.COUNT_REGIONS)
                    .setParameter("id", id)
                    .getSingleResult();
            result = Integer.valueOf(count.intValue());

            entityManager.getTransaction().commit();

        }
        catch (NoResultException e){
            e.printStackTrace();
            entityManager.getTransaction().rollback();
        }
        catch (Exception e){
            e.printStackTrace();
        }

        return result;
    }

}
