package fr.kybox.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.kybox.bean.topo.Region;
import fr.kybox.interfaces.ManagerFactory;
import org.apache.struts2.components.ActionError;
import org.apache.struts2.components.ActionMessage;

import javax.inject.Inject;
import java.util.List;

/**
 * @author Kybox
 * @version 1.0
 */
public class TopoAction extends ActionSupport {

    @Inject
    private ManagerFactory managerFactory;
    private List<Region> regionList;
    private int regionId;
    private Region region;

    // RegionList
    public List<Region> getRegionList() {
        regionList = managerFactory.getTopoManager().getRegionList();
        return regionList;
    }
    public void setRegionList(List<Region> regionList){
        this.regionList = regionList;
    }

    // RegionId
    public Integer getRegionId() { return regionId; }
    public void setRegionId(Integer regionId) { this.regionId = regionId; }

    // Region
    public Region getRegion() {
        if(regionId != 0)
            region = managerFactory.getTopoManager().getRegionById(regionId);
        return region;
    }
    public void setRegion(Region region){ this.region = region; }

    public String doGetRegionList(){

        regionList = managerFactory.getTopoManager().getRegionList();

        System.out.println(regionList.size());

        return ActionSupport.SUCCESS;
    }

    public String doGetSiteList(){

        System.out.println("L'ID sélectionné est " + regionId);
        return ActionSupport.SUCCESS;
    }

    public String doGetTopo(){

        System.out.println("L'ID sélectionné est " + regionId);
        return ActionSupport.SUCCESS;
    }
}
