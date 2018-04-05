package fr.kybox.impl.manager;

import fr.kybox.bean.topo.Region;
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
}
