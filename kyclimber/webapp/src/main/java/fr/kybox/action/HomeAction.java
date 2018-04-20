package fr.kybox.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.kybox.entities.Region;
import fr.kybox.entities.Site;
import fr.kybox.impl.services.SitePersistenceService;

import javax.inject.Inject;
import java.util.List;

/**
 * @author Kybox
 * @version 1.0
 */
public class HomeAction extends ActionSupport {

    @Inject
    private SitePersistenceService siteService;

    private List<Site> siteList;
    private Region region;

    public List<Site> getSiteList() { siteList = siteService.findLastestSites(4); return siteList; }
    public void setSiteList(List<Site> siteList) { this.siteList = siteList; }

    public Region getRegion() { return region; }
    public void setRegion(Region region) { this.region = region; }

    public String execute(){

        return ActionSupport.SUCCESS;
    }

    public String doHome(){
        return ActionSupport.SUCCESS;
    }
}
