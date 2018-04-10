package fr.kybox.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.kybox.entities.Comment;
import fr.kybox.entities.User;
import fr.kybox.exception.NotFoundException;
import fr.kybox.interfaces.ManagerFactory;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import java.util.Calendar;
import java.util.List;

/**
 * @author Kybox
 * @version 1.0
 */
public class CommentAction extends ActionSupport {

    @Inject
    ManagerFactory managerFactory;

    private int siteId;
    private int userId;
    private String post;
    private List<Comment> commentList;

    public int getSiteId() { return siteId; }
    public void setSiteId(int siteId) { this.siteId = siteId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getPost() { return post; }
    public void setPost(String post) { this.post = post; }

    public List<Comment> getCommentList() {
        commentList = managerFactory.getCommentManager().getComments(getSiteId());
        return commentList;
    }
    public void setCommentList(List<Comment> commentList) { this.commentList = commentList; }

    public String addNewAjaxComment(){

        System.out.println("Add new ajax comment !");

        User user = getUser(getUserId());

        Comment comment = new Comment();
        comment.setSiteId(getSiteId());
        comment.setUser(user);
        comment.setPost(getPost());
        Calendar calendar = Calendar.getInstance();
        java.sql.Date date = new java.sql.Date(calendar.getTime().getTime());
        comment.setDate(date);

        managerFactory.getCommentManager().addNewComment(comment);

        System.out.println("siteId=" + getSiteId());
        System.out.println("userId=" + getUserId());
        System.out.println("post=" + getPost());
        System.out.println("Success");

        return ActionSupport.SUCCESS;
    }

    private User getUser(int userId){

        User user = null;
        try { user = managerFactory.getUserManager().getUser(userId); }
        catch (NotFoundException e) { e.printStackTrace(); }
        return user;
    }
}
