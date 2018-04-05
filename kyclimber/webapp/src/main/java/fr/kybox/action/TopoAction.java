package fr.kybox.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.kybox.bean.topo.Region;
import fr.kybox.interfaces.ManagerFactory;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Kybox
 * @version 1.0
 */
public class TopoAction extends ActionSupport {

    @Inject
    private ManagerFactory managerFactory;
    private List<Region> regionList = new ArrayList<>();

    public List<Region> getRegionList() { return regionList; }

    public String doGetRegionList(){

        regionList = managerFactory.getTopoManager().getRegionList();

        System.out.println(regionList.size());

        return ActionSupport.SUCCESS;
    }
    public String doList(){

        return ActionSupport.SUCCESS;
    }
}
