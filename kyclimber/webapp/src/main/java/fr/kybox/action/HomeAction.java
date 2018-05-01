package fr.kybox.action;

import com.opensymphony.xwork2.ActionSupport;
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

/**
 * Struts2 - HomeAction class
 * Get the last 4 Site and Topo registered entities
 */
public class HomeAction extends ActionSupport {

    /** Logger object **/
    private final static Logger log = LogManager.getLogger(HomeAction.class);

    /** Injected services **/
    @Inject private SitePersistenceService siteService;
    @Inject private TopoPersistenceService topoService;

    /**
     * Get the site-type entities list of the specified max results.
     * @return The Site entities instance list.
     */
    public List<Site> getSiteList() {

        if(log.isDebugEnabled()) log.debug("METHOD : getSiteList()");

        return siteService.findLastestSites(4);
    }

    /**
     * Get the topo-type entities list of the specified max results.
     * @return The Topo entities instance list.
     */
    public List<Topo> getTopoList(){

        if(log.isDebugEnabled()) log.debug("METHOD : getSiteList()");

        return topoService.findLastestTopo(4);
    }
}
