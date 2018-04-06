package fr.kybox.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.kybox.entities.Region;
import fr.kybox.entities.Site;
import fr.kybox.interfaces.ManagerFactory;

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
    private List<Site> siteList;

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

    // Site
    public List<Site> getSiteList() {
        siteList = managerFactory.getTopoManager().getSiteList(getRegionId());
        return siteList;
    }
    public void setSiteList(List<Site> siteList) { this.siteList = siteList; }

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
