package fr.kybox.action.manager;

import com.opensymphony.xwork2.ActionSupport;
import fr.kybox.entities.Topo;
import fr.kybox.entities.User;
import fr.kybox.impl.services.RegionPersistenceService;
import fr.kybox.impl.services.TopoPersistenceService;
import fr.kybox.impl.services.UserPersistenceService;

import javax.inject.Inject;
import java.util.List;

/**
 * @author Kybox
 * @version 1.0
 */
public class TopoManagerAction extends ActionSupport {

    @Inject
    private TopoPersistenceService topoService;
    @Inject
    private UserPersistenceService userService;

    private int topoId;
    private String topoName;
    private String topoDescription;
    private String topoPublisher;
    private String topoCover;
    private boolean topoAvailable;
    private boolean topoLent;
    private Integer topoUserLentId;
    private int topoRegionId;
    private Integer topoUserId;
    private List<Topo> topoList;

    public int getTopoId() { return topoId; }
    public void setTopoId(int topoId) { this.topoId = topoId; }
    public String getTopoName() { return topoName; }
    public void setTopoName(String topoName) { this.topoName = topoName; }
    public String getTopoDescription() { return topoDescription; }
    public void setTopoDescription(String topoDescription) { this.topoDescription = topoDescription; }
    public String getTopoPublisher() { return topoPublisher; }
    public void setTopoPublisher(String topoPublisher) { this.topoPublisher = topoPublisher; }
    public String getTopoCover() { return topoCover; }
    public void setTopoCover(String topoCover) { this.topoCover = topoCover; }
    public boolean isTopoAvailable() { return topoAvailable; }
    public void setTopoAvailable(boolean topoAvailable) { this.topoAvailable = topoAvailable; }
    public boolean isTopoLent() { return topoLent; }
    public void setTopoLent(boolean topoLent) { this.topoLent = topoLent; }
    public Integer getTopoUserLentId() { return topoUserLentId; }
    public void setTopoUserLentId(Integer topoUserLentId) { this.topoUserLentId = topoUserLentId; }
    public int getTopoRegionId() { return topoRegionId; }
    public void setTopoRegionId(int topoRegionId) { this.topoRegionId = topoRegionId; }
    public Integer getTopoUserId() { return topoUserId; }
    public void setTopoUserId(Integer topoUserId) { this.topoUserId = topoUserId; }

    public List<Topo> getTopoList() {
        topoList = topoService.findAll();
        return topoList;
    }
    public void setTopoList(List<Topo> topoList) { this.topoList = topoList; }

    @Override
    public String execute(){

        return ActionSupport.SUCCESS;
    }

    /**
     * Ajax update topo in user profil
     * @return String (success/error)
     */
    public String updateAjaxUserTopo(){

        System.out.println("TopoId = " + getTopoId());
        System.out.println("TopoName = " + getTopoName());
        System.out.println("TopoDesc = " + getTopoDescription());
        System.out.println("TopoPubli = " + getTopoPublisher());
        System.out.println("TopoAvailable = " + isTopoAvailable());
        System.out.println("");

        Topo topo = topoService.findById(getTopoId());

        System.out.println("Topo found = " + topo.getName());

        User userFrom = userService.findById(getTopoUserId());
        topo.setUser(userFrom);

        System.out.println("Topo from = " + userFrom.getFirstName());


        topo.setName(getTopoName());
        topo.setDescription(getTopoDescription());
        topo.setPublisher(getTopoPublisher());
        topo.setCover(getTopoCover());
        //topo.setRegion(regionService.findById(getTopoRegionId()));
        topo.setAvailable(isTopoAvailable());
        if(isTopoLent()) topo.setLentToUser(userService.findById(getTopoUserLentId()));
        else topo.setLentToUser(null);

        topoService.save(topo);

        return ActionSupport.SUCCESS;
    }
}
