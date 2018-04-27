package fr.kybox.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.kybox.entities.Region;
import fr.kybox.entities.Site;
import fr.kybox.entities.Topo;
import fr.kybox.impl.services.SitePersistenceService;
import fr.kybox.impl.services.TopoPersistenceService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.inject.Inject;
import java.util.List;

/**
 * @author Kybox
 * @version 1.0
 */
public class HomeAction extends ActionSupport {

    private final Logger logger = LogManager.getLogger(this.getClass());

    @Inject
    private SitePersistenceService siteService;

    @Inject
    private TopoPersistenceService topoService;

    public List<Site> getSiteList() {
        return siteService.findLastestSites(4);
    }

    public List<Topo> getTopoList(){
        return topoService.findLastestTopo(4);
    }
}
