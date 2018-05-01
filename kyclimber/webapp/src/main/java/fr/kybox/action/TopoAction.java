package fr.kybox.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.kybox.entities.Region;
import fr.kybox.entities.Topo;
import fr.kybox.impl.services.RegionPersistenceService;
import fr.kybox.impl.services.TopoPersistenceService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Kybox
 * @version 1.0
 */

/**
 * Struts2 - TopoAction class
 * Provide the Topo list entities according to the selected region
 */
public class TopoAction extends ActionSupport {

    /** Logger object **/
    private final static Logger log = LogManager.getLogger(TopoAction.class);

    /** Injected services **/
    @Inject private RegionPersistenceService regionService;
    @Inject private TopoPersistenceService topoService;

    /** Attributes **/
    private Integer topoId;

    /** Getters **/
    public Integer getTopoId() { return topoId; }
    public Topo getTopo() {
        if(topoId != null) return topoService.findById(getTopoId());
        else return null;
    }

    /** Setters **/
    public void setTopoId(Integer topoId) { this.topoId = topoId; }

    /**
     * Get the list of Topo entities by Region entity
     * @return HashMap with Region for key and Topo entities instance list
     */
    public Map<Region, List<Topo>> getTopoMap() {

        if(log.isDebugEnabled()) log.debug("METHOD : getTopoMap()");

        Map<Region, List<Topo>> topoMap = new HashMap<>();
        List<Region> regionList = regionService.findAllRegionsAvailable();

        for(Region region : regionList){
            List<Topo> topoList = topoService.findByRegion(region);
            topoMap.put(region, topoList);
        }

        return topoMap;
    }
}
