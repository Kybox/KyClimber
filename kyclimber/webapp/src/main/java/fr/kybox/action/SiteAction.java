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
public class SiteAction extends ActionSupport {

    @Inject
    private ManagerFactory managerFactory;
    private List<Region> regionList;
    private int regionId;
    private int siteId;
    private Region region;
    private Site site;
    private List<Site> siteList;

    // RegionList
    public List<Region> getRegionList() {
        regionList = managerFactory.getSiteManager().getRegionList();
        return regionList;
    }
    public void setRegionList(List<Region> regionList){
        this.regionList = regionList;
    }

    // RegionId
    public Integer getRegionId() { return regionId; }
    public void setRegionId(Integer regionId) { this.regionId = regionId; }

    // SiteId
    public int getSiteId() { return siteId; }
    public void setSiteId(int siteId) { this.siteId = siteId; }

    // Region
    public Region getRegion() {
        if(regionId != 0)
            region = managerFactory.getSiteManager().getRegionById(regionId);
        return region;
    }
    public void setRegion(Region region){ this.region = region; }

    // Site List
    public List<Site> getSiteList() {
        siteList = managerFactory.getSiteManager().getSiteList(getRegionId());
        return siteList;
    }
    public void setSiteList(List<Site> siteList) { this.siteList = siteList; }

    // Site
    public Site getSite() {
        site = managerFactory.getSiteManager().getSite(getSiteId());
        return site;
    }
    public void setSite(Site site) { this.site = site; }

    public String doGetRegionList(){

        regionList = managerFactory.getSiteManager().getRegionList();

        System.out.println(regionList.size());

        return ActionSupport.SUCCESS;
    }
}
