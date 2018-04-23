package fr.kybox.action;

import com.opensymphony.xwork2.ActionSupport;

/**
 * @author Kybox
 * @version 1.0
 */
public class SearchAction extends ActionSupport {

    private String userQuery;

    public String getUserQuery() { return userQuery; }
    public void setUserQuery(String userQuery) { this.userQuery = userQuery; }

    @Override
    public String execute(){

        return ActionSupport.SUCCESS;
    }
}
