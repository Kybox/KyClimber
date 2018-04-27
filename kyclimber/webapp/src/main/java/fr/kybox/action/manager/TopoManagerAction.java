package fr.kybox.action.manager;

import com.opensymphony.xwork2.ActionSupport;
import fr.kybox.entities.Site;
import fr.kybox.entities.Topo;
import fr.kybox.entities.User;
import fr.kybox.impl.services.SitePersistenceService;
import fr.kybox.impl.services.TopoPersistenceService;
import fr.kybox.impl.services.UserPersistenceService;
import org.apache.struts2.interceptor.SessionAware;

import javax.inject.Inject;
import java.util.Map;

/**
 * @author Kybox
 * @version 1.0
 */
public class TopoManagerAction extends ActionSupport implements SessionAware {

    @Inject private UserPersistenceService userService;
    @Inject private TopoPersistenceService topoService;
    @Inject private SitePersistenceService siteService;

    private Integer topoId;
    private String topoName;
    private boolean topoLent;
    private String topoCover;
    private String actionType;
    private Integer topoSiteId;
    private Integer topoUserId;
    private String topoPublisher;
    private boolean topoAvailable;
    private Integer topoUserLentId;
    private String topoDescription;
    private Map<String, Object> session;

    public Integer getTopoId() { return topoId; }
    public void setTopoId(Integer topoId) { this.topoId = topoId; }
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
    public int getTopoSiteId() { return topoSiteId; }
    public void setTopoSiteId(Integer topoSiteId) { this.topoSiteId = topoSiteId; }
    public Integer getTopoUserId() { return topoUserId; }
    public void setTopoUserId(Integer topoUserId) { this.topoUserId = topoUserId; }
    public String getActionType() { return actionType; }
    public void setActionType(String actionType) { this.actionType = actionType; }

    @Override
    public String execute(){

        Topo topo = null;

        switch (actionType) {
            case "new":
                topo = new Topo();
                topo.setUser((User) session.get("user"));
                topo = setTopoAttributs(topo);
                break;

            case "update":
                topo = topoService.findById(getTopoId());
                topo = setTopoAttributs(topo);
                break;
        }

        topoService.merge(topo);

        return ActionSupport.SUCCESS;
    }

    private Topo setTopoAttributs(Topo topo){

        topo.setName(getTopoName());
        topo.setDescription(getTopoDescription());
        topo.setPublisher(getTopoPublisher());
        topo.setCover(getTopoCover());

        Site site = siteService.findById(getTopoSiteId());
        topo.setSite(site);

        topo.setAvailable(isTopoAvailable());
        if(isTopoLent()) {
            User user = userService.findById(getTopoUserLentId());
            topo.setLentToUser(user);
        }
        else topo.setLentToUser(null);

        return topo;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }
}
