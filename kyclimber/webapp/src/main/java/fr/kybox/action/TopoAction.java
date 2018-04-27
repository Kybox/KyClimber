package fr.kybox.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.kybox.entities.Region;
import fr.kybox.entities.Topo;
import fr.kybox.impl.services.RegionPersistenceService;
import fr.kybox.impl.services.TopoPersistenceService;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Kybox
 * @version 1.0
 */
public class TopoAction extends ActionSupport {

    @Inject
    private RegionPersistenceService regionService;

    @Inject
    private TopoPersistenceService topoService;

    private Integer topoId;
    private Map<Region, List<Topo>> topoMap;

    public Integer getTopoId() { return topoId; }
    public void setTopoId(Integer topoId) { this.topoId = topoId; }

    public Topo getTopo() {
        if(topoId != null) return topoService.findById(getTopoId());
        else return null;
    }

    public Map<Region, List<Topo>> getTopoMap() {

        topoMap = new HashMap<>();
        List<Region> regionList = regionService.findAllRegionsAvailable();

        for(Region region : regionList){
            List<Topo> topoList = topoService.findByRegion(region);
            topoMap.put(region, topoList);
        }

        return topoMap;
    }
}
