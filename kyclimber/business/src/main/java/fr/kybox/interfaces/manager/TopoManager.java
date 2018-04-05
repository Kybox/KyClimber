package fr.kybox.interfaces.manager;

import fr.kybox.bean.topo.Region;
import fr.kybox.bean.topo.Site;

import java.util.List;

public interface TopoManager {

    List<Region> getRegionList();
    Region getRegionById(Integer id);
    List<Site> getSiteList(int regionId);
}
