package fr.kybox.impl.manager;

import fr.kybox.bean.topo.Region;
import fr.kybox.bean.topo.Site;
import fr.kybox.interfaces.manager.TopoManager;
import fr.kybox.util.HibernateUtil;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;

/**
 * @author Kybox
 * @version 1.0
 */
@Service
public class TopoManagerImpl implements TopoManager {

    private final EntityManager entityManager = HibernateUtil.getEntityManager();

    @Override
    public List<Region> getRegionList() {

        entityManager.getTransaction().begin();
        Query query = entityManager.createQuery("select r from Region r");
        List<Region> regionList = query.getResultList();
        entityManager.getTransaction().commit();
        return regionList;
    }

    @Override
    public Region getRegionById(Integer id) {

        Region region = null;
        try {
            entityManager.getTransaction().begin();
            region = entityManager.find(Region.class, id);
            entityManager.getTransaction().commit();
        }
        catch (Exception e){
            e.printStackTrace();
            entityManager.getTransaction().rollback();
        }
        return region;
    }

    @Override
    public List<Site> getSiteList(int regionId) {

        List<Site> siteList = null;
        try {
            entityManager.getTransaction().begin();
            Query query = entityManager.createQuery("select s from Site s where s.regionId = :id");
            query.setParameter("id", regionId);
            siteList = query.getResultList();
            entityManager.getTransaction().commit();
        }
        catch (Exception e){
            e.printStackTrace();
            entityManager.getTransaction().rollback();
        }
        return siteList;
    }
}
