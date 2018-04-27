package fr.kybox.impl.services;

import fr.kybox.entities.Region;
import fr.kybox.entities.Site;
import fr.kybox.impl.AbstractPersistenceService;
import fr.kybox.util.HibernateUtil;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import java.util.List;

/**
 * @author Kybox
 * @version 1.0
 */
@Service
public class SitePersistenceService extends AbstractPersistenceService<Integer, Site> {

    private static final Logger logger = LogManager.getLogger(SitePersistenceService.class);

    public List<Site> findLastestSites(int maxResults) {

        List<Site> siteList = null;
        try{

            entityManager.getTransaction().begin();
            final List resultList = entityManager.createNamedQuery(Site.FIND_LASTEST_SITES)
                    .setMaxResults(maxResults)
                    .getResultList();
            siteList = resultList;
            entityManager.getTransaction().commit();
        }
        catch (NoResultException e){ entityManager.getTransaction().rollback(); }
        return siteList;
    }

    public List<Site> findAllSites(){

        List resultList = null;

        try{

            entityManager.getTransaction().begin();
            resultList = entityManager.createNamedQuery(Site.FIND_ALL_SITES).getResultList();
            entityManager.getTransaction().commit();
        }
        catch (NoResultException e){
            entityManager.getTransaction().rollback();
        }
        return resultList;
    }

    public List<Site> findByRegion(Region region){

        List<Site> siteList = null;

        try{

            entityManager.getTransaction().begin();
            final List resultList = entityManager.createNamedQuery(Site.FIND_BY_REGION)
                    .setParameter("region", region)
                    .getResultList();
            siteList = resultList;
            entityManager.getTransaction().commit();
        }
        catch (NoResultException e){ entityManager.getTransaction().rollback(); }

        return siteList;
    }

    public List<Site> findSiteByKeyword(String keyword){

        keyword = "%" + keyword + "%";
        List<Site> entityList = null;

        try{

            entityManager.getTransaction().begin();
            final List resultList = entityManager.createNamedQuery(Site.FIND_BY_KEYWORD)
                    .setParameter("keyword", keyword)
                    .getResultList();

            entityList = resultList;
            entityManager.getTransaction().commit();
        }
        catch (NoResultException e){
            e.printStackTrace();
            entityManager.getTransaction().rollback();
        }

        return entityList;
    }
}
