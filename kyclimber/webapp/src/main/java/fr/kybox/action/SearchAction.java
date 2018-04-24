package fr.kybox.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.kybox.entities.Site;
import fr.kybox.entities.User;
import fr.kybox.impl.services.SitePersistenceService;
import fr.kybox.impl.services.UserPersistenceService;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Kybox
 * @version 1.0
 */
public class SearchAction extends ActionSupport {

    private final String TOPO_CHECKED = "Rechercher un topo";
    private final String USER_CHECKED = "Rechercher un utilisateur";
    private final String SITE_CHECKED = "Rechercher un site d'escalade";

    @Inject UserPersistenceService userService;
    @Inject SitePersistenceService siteService;

    // Attributs
    private String keywords;
    private String selectedSearchOption;
    private List<String> searchOptions;
    private List<User> usersSearchedList;
    private List<Site> sitesSearchedList;

    // Getters / Setters
    public String getKeywords() { return keywords; }
    public void setKeywords(String keywords) { this.keywords = keywords; }
    public List<String> getSearchOptions() { return searchOptions; }
    public void setSearchOptions(List<String> searchOptions) { this.searchOptions = searchOptions; }
    public String getDefaultOptionValue(){ return SITE_CHECKED; }
    public String getSelectedSearchOption() { return selectedSearchOption; }
    public void setSelectedSearchOption(String selectedSearchOption) { this.selectedSearchOption = selectedSearchOption; }
    public List<Site> getSitesSearchedList() { return sitesSearchedList; }
    public void setSitesSearchedList(List<Site> sitesSearchedList) { this.sitesSearchedList = sitesSearchedList; }

    public List<User> getUsersSearchedList() { return usersSearchedList; }

    public SearchAction(){

        searchOptions = new ArrayList<>();
        searchOptions.add(SITE_CHECKED);
        searchOptions.add(TOPO_CHECKED);
        searchOptions.add(USER_CHECKED);
    }


    @Override
    public String execute(){

        if(selectedSearchOption != null){

            System.out.println("========== > SELECTED OPTION = " + selectedSearchOption);

            switch (selectedSearchOption){
                case USER_CHECKED:
                    usersSearchedList = userService.findUserByKeyword(getKeywords());
                    if(usersSearchedList != null) {
                        System.out.println("Userlist not null - Size :" + usersSearchedList.size());
                        for (User user : usersSearchedList)
                            System.out.println("User : " + user.getFirstName());
                    }
                    break;

                case TOPO_CHECKED:

                    break;

                case SITE_CHECKED:
                    sitesSearchedList = siteService.findSiteByKeyword(getKeywords());
                    break;
            }
        }


        return ActionSupport.SUCCESS;
    }
}
