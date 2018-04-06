package fr.kybox.interfaces.manager;

import fr.kybox.entities.Region;
import fr.kybox.entities.Site;

import java.util.List;

public interface SiteManager {

    List<Region> getRegionList();
    Region getRegionById(Integer id);
    List<Site> getSiteList(int regionId);
    Site getSite(int siteId);
}
