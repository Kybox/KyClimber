package fr.kybox.action.manager;

import com.opensymphony.xwork2.ActionSupport;
import fr.kybox.entities.Site;
import fr.kybox.entities.Topo;
import fr.kybox.entities.User;
import fr.kybox.impl.services.SitePersistenceService;
import fr.kybox.impl.services.TopoPersistenceService;
import fr.kybox.impl.services.UserPersistenceService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.interceptor.SessionAware;

import javax.inject.Inject;
import java.util.Map;

/**
 * @author Kybox
 * @version 1.0
 */

/**
 * Struts2 - TopoManagerAction class
 * Manage the user's topos
 */
public class TopoManagerAction extends ActionSupport implements SessionAware {

    /** Logger object **/
    private final static Logger log = LogManager.getLogger(TopoManagerAction.class);

    /** Injected services **/
    @Inject private UserPersistenceService userService;
    @Inject private TopoPersistenceService topoService;
    @Inject private SitePersistenceService siteService;

    /** Attributes **/
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

    /** Getters **/
    public Integer getTopoId() { return topoId; }
    public boolean isTopoLent() { return topoLent; }
    public String getTopoName() { return topoName; }
    public int getTopoSiteId() { return topoSiteId; }
    public String getTopoCover() { return topoCover; }
    public String getActionType() { return actionType; }
    public Integer getTopoUserId() { return topoUserId; }
    public String getTopoPublisher() { return topoPublisher; }
    public boolean isTopoAvailable() { return topoAvailable; }
    public Integer getTopoUserLentId() { return topoUserLentId; }
    public String getTopoDescription() { return topoDescription; }

    /** Setters **/
    public void setTopoId(Integer topoId) { this.topoId = topoId; }
    public void setTopoName(String topoName) { this.topoName = topoName; }
    public void setTopoLent(boolean topoLent) { this.topoLent = topoLent; }
    public void setTopoCover(String topoCover) { this.topoCover = topoCover; }
    public void setActionType(String actionType) { this.actionType = actionType; }
    public void setTopoSiteId(Integer topoSiteId) { this.topoSiteId = topoSiteId; }
    public void setTopoUserId(Integer topoUserId) { this.topoUserId = topoUserId; }
    public void setTopoPublisher(String topoPublisher) { this.topoPublisher = topoPublisher; }
    public void setTopoAvailable(boolean topoAvailable) { this.topoAvailable = topoAvailable; }
    public void setTopoUserLentId(Integer topoUserLentId) { this.topoUserLentId = topoUserLentId; }
    public void setTopoDescription(String topoDescription) { this.topoDescription = topoDescription; }

    /**
     * Overrided default execute method
     * Create and persist a new Topo entity or update existing one
     * @return "success"
     */
    @Override
    public String execute(){

        if(log.isDebugEnabled()) log.debug("METHOD : execute()");

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

    /**
     * Set all Topo entity attributs
     * @param topo The current Topo entity
     * @return The Topo entity with new attributs
     */
    private Topo setTopoAttributs(Topo topo){

        if(log.isDebugEnabled()) log.debug("METHOD : setTopoAttributs(" + topo + ")");

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

    /**
     * Overrided setSession method
     * @param session The current session
     */
    @Override
    public void setSession(Map<String, Object> session) {

        if(log.isDebugEnabled()) log.debug("METHOD : setSession()");

        this.session = session;
    }
}
