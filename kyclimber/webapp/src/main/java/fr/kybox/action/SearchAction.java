package fr.kybox.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.kybox.entities.Site;
import fr.kybox.entities.Topo;
import fr.kybox.entities.User;
import fr.kybox.impl.services.SitePersistenceService;
import fr.kybox.impl.services.TopoPersistenceService;
import fr.kybox.impl.services.UserPersistenceService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Kybox
 * @version 1.0
 */

/**
 * Struts2 - SearchAction class
 * Get the entities sought according to the keywords entered
 */
public class SearchAction extends ActionSupport {

    /** Logger object **/
    private final static Logger log = LogManager.getLogger(SearchAction.class);

    /** Search options labels **/
    private final String TOPO_CHECKED = "Rechercher un topo";
    private final String USER_CHECKED = "Rechercher un utilisateur";
    private final String SITE_CHECKED = "Rechercher un site d'escalade";

    /** Injected services **/
    @Inject private UserPersistenceService userService;
    @Inject private SitePersistenceService siteService;
    @Inject private TopoPersistenceService topoService;

    /** Attributes **/
    private String keywords;
    private List<String> searchOptions;
    private String selectedSearchOption;
    private List<User> usersSearchedList;
    private List<Site> sitesSearchedList;
    private List<Topo> toposSearchedList;

    /**
     * Default constructor
     */
    public SearchAction(){

        if(log.isDebugEnabled()) log.debug("METHOD : SearchAction()");

        searchOptions = new ArrayList<>();
        searchOptions.add(SITE_CHECKED);
        searchOptions.add(TOPO_CHECKED);
        searchOptions.add(USER_CHECKED);
    }

    /** Getters **/
    public String getKeywords() { return keywords; }
    public List<String> getSearchOptions() { return searchOptions; }
    public String getDefaultOptionValue(){ return SITE_CHECKED; }
    public String getSelectedSearchOption() { return selectedSearchOption; }

    /** Setters **/
    public void setKeywords(String keywords) { this.keywords = keywords; }
    public void setSearchOptions(List<String> searchOptions) { this.searchOptions = searchOptions; }
    public void setSelectedSearchOption(String selectedSearchOption) { this.selectedSearchOption = selectedSearchOption; }

    /**
     * Get the Site entities instance list resulting from the search
     * @return Sitelist
     */
    public List<Site> getSitesSearchedList() {

        if(log.isDebugEnabled()) log.debug("METHOD : getSitesSearchedList()");

        return sitesSearchedList;
    }

    /**
     * Get the User entities instance list resulting from the search
     * @return Userlist
     */
    public List<User> getUsersSearchedList() {

        if(log.isDebugEnabled()) log.debug("METHOD : getUsersSearchedList()");

        return usersSearchedList;
    }

    /**
     * Get the Topo entities instance list resulting from the search
     * @return Topolist
     */
    public List<Topo> getToposSearchedList() {

        if(log.isDebugEnabled()) log.debug("METHOD : getToposSearchedList()");

        return toposSearchedList;
    }

    /**
     * Overrided default execute method
     * Search selected entities by keywords
     * @return "success"
     */
    @Override
    public String execute(){

        if(selectedSearchOption != null){

            switch (selectedSearchOption){

                case USER_CHECKED:
                    usersSearchedList = userService.findUserByKeyword(getKeywords());
                    break;

                case TOPO_CHECKED:
                    toposSearchedList = topoService.findByKeywords(getKeywords());
                    break;

                case SITE_CHECKED:
                    sitesSearchedList = siteService.findSiteByKeyword(getKeywords());
                    break;
            }
        }

        return ActionSupport.SUCCESS;
    }
}
