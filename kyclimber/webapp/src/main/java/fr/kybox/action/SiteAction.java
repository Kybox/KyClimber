package fr.kybox.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.kybox.entities.Comment;
import fr.kybox.entities.Region;
import fr.kybox.entities.Site;
import fr.kybox.entities.Topo;
import fr.kybox.impl.services.CommentPersistenceService;
import fr.kybox.impl.services.RegionPersistenceService;
import fr.kybox.impl.services.SitePersistenceService;
import fr.kybox.impl.services.TopoPersistenceService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.inject.Inject;
import java.util.*;

/**
 * @author Kybox
 * @version 1.0
 */

/**
 * Struts2 - SiteAction class
 * Displays the menu of regions and climbing sites
 */
public class SiteAction extends ActionSupport {

    /** Logger object **/
    private final static Logger log = LogManager.getLogger(SiteAction.class);

    /** Injected services **/
    @Inject private SitePersistenceService siteService;
    @Inject private RegionPersistenceService regionService;
    @Inject private CommentPersistenceService commentService;
    @Inject private TopoPersistenceService topoService;

    /** Attributes **/
    private int regionId;
    private int siteId;
    private Region region;

    /** Getters **/
    public List<Comment> getCommentList() { return commentService.findBySite(getSite()); }
    public List<Site> getSiteList() { return siteService.findByRegion(getRegion()); }
    public List<Topo> getTopoList() { return topoService.findBySite(getSite()); }
    public Site getSite() { return siteService.findById(getSiteId()); }
    public Integer getRegionId() { return regionId; }
    public int getSiteId() { return siteId; }
    public Region getRegion() {
        if(regionId != 0)
            region = regionService.findById(regionId);
        return region;
    }

    /** Setters **/
    public void setRegionId(Integer regionId) { this.regionId = regionId; }
    public void setSiteId(int siteId) { this.siteId = siteId; }

    /**
     * Get the list of available sites by region
     * @return HashMap with region id for key and sites names and number for value
     */
    public Map<Integer, List<String>> getMapRegionList() {

        if(log.isDebugEnabled()) log.debug("METHOD : getMapRegionList()");

        Map<Integer, List<String>> mapRegionList = new HashMap<>();
        List<Region> regionList = regionService.findAllRegionsAvailable();

        for(Region region : regionList){

            Integer count = regionService.countSitesByRegions(region.getId());
            List<String> dataList = new ArrayList<>();
            dataList.add(region.getName());
            dataList.add(count.toString());
            mapRegionList.put(region.getId(), dataList);
        }

        return mapRegionList;
    }
}
