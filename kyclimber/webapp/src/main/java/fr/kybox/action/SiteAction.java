package fr.kybox.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.kybox.entities.Comment;
import fr.kybox.entities.Region;
import fr.kybox.entities.Site;
import fr.kybox.impl.services.CommentPersistenceService;
import fr.kybox.impl.services.RegionPersistenceService;
import fr.kybox.impl.services.SitePersistenceService;

import javax.inject.Inject;
import java.util.*;

/**
 * @author Kybox
 * @version 1.0
 */
public class SiteAction extends ActionSupport {

    @Inject
    private SitePersistenceService siteService;

    @Inject
    private RegionPersistenceService regionService;

    @Inject
    private CommentPersistenceService commentService;

    private List<Region> regionList;

    private Map<Integer, List<String>> mapRegionList;

    private int regionId;
    private int siteId;
    private int userId;
    private Region region;
    private Site site;
    private List<Site> siteList;
    private List<Comment> commentList;
    private Comment comment;

    // RegionList
    public List<Region> getRegionList() {
        regionList = this.regionList;
        //regionList = regionService.findAll();
        System.out.println("REGION LIST SIZE = " + regionList.size());
        System.out.println("ARRAY = " + Arrays.toString(regionList.toArray()));
        System.out.println("");
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

    // UserId
    private int getUserId() { return userId; }
    private void setUserId(int userId) { this.userId = userId; }

    // Region
    public Region getRegion() {
        if(regionId != 0)
            region = regionService.findById(regionId);
        return region;
    }
    public void setRegion(Region region){ this.region = region; }


    public Map<Integer, List<String>> getMapRegionList() {

        mapRegionList = new HashMap<>();
        regionList = regionService.findAllRegionsAvailable();

        for(Region region : regionList){

            Integer count = regionService.countRegion(region.getId());
            List<String> dataList = new ArrayList<>();
            dataList.add(region.getName());
            dataList.add(count.toString());
            mapRegionList.put(region.getId(), dataList);
        }

        System.out.println("MAP SIZE = " + mapRegionList.size());
        return mapRegionList;
    }

    public void setMapRegionList(Map<Integer, List<String>> mapRegionList) {
        this.mapRegionList = mapRegionList;
    }

    // Site List
    public List<Site> getSiteList() {
        siteList = siteService.findByRegion(getRegion());
        return siteList;
    }
    public void setSiteList(List<Site> siteList) { this.siteList = siteList; }

    // Site
    public Site getSite() {
        site = siteService.findById(getSiteId());
        return site;
    }
    public void setSite(Site site) { this.site = site; }

    // Comment List
    public List<Comment> getCommentList() {
        commentList = commentService.findBySite(getSite());
        return commentList;
    }
    public void setCommentList(List<Comment> commentList) { this.commentList = commentList; }

    // Comment
    public Comment getComment() { return comment; }
    public void setComment(Comment comment) { this.comment = comment; }

    public String doGetRegionList(){

        regionList = regionService.findAll();

        System.out.println(regionList.size());

        return ActionSupport.SUCCESS;
    }
}
