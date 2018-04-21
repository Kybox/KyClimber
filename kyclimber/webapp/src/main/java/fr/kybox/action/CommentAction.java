package fr.kybox.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.kybox.entities.Comment;
import fr.kybox.entities.User;
import fr.kybox.exception.NotFoundException;
import fr.kybox.impl.services.CommentPersistenceService;

import javax.inject.Inject;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.Calendar;
import java.util.List;

/**
 * @author Kybox
 * @version 1.0
 */
public class CommentAction extends ActionSupport {

    @Inject
    private CommentPersistenceService commentService;

    private int siteId;
    private int userId;
    private String post;
    private List<Comment> commentList;

    // Update profil
    private String comment;
    private int commentId;

    public int getSiteId() { return siteId; }
    public void setSiteId(int siteId) { this.siteId = siteId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getPost() { return post; }
    public void setPost(String post) { this.post = post; }

    public String getComment() { return comment; }
    public void setComment(String comment) { this.comment = comment; }
    public int getCommentId() { return commentId; }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public List<Comment> getCommentList() {
        //commentList = commentService.findBySite()
        //commentList = managerFactory.getCommentManager().getComments(getSiteId());
        return commentList;
    }
    public void setCommentList(List<Comment> commentList) { this.commentList = commentList; }

    public String addNewAjaxComment(){

        System.out.println("Add new ajax comment !");

        User user = getUser(getUserId());

        Comment comment = new Comment();
        comment.setSite(null); /// <---------------------------------TODO
        comment.setUser(user);
        comment.setPost(getPost());
        comment.setDate(Timestamp.from(Instant.now()));

        //managerFactory.getCommentManager().addNewComment(comment);

        System.out.println("siteId=" + getSiteId());
        System.out.println("userId=" + getUserId());
        System.out.println("post=" + getPost());
        System.out.println("Success");

        return ActionSupport.SUCCESS;
    }

    private User getUser(int userId){

        User user = null;
        //try { user = managerFactory.getUserManager().getUser(userId); }
        //catch (NotFoundException e) { e.printStackTrace(); }
        return user;
    }

    public String updateAjaxUserComment(){

        String result = ActionSupport.SUCCESS;

        try {
            Comment comment = commentService.findById(getCommentId());
            comment.setPost(getComment());
            commentService.save(comment);
        }
        catch (Exception e){
            e.printStackTrace();
            result = ActionSupport.ERROR;
        }

        return result;
    }

    public String deleteAjaxUserComment(){

        String result = ActionSupport.SUCCESS;

        System.out.println("DELETE COMMENT ID " + getCommentId());

        Comment comment = commentService.findById(getCommentId());

        if(commentService.remove(comment) == false)
            result = ActionSupport.ERROR;

        return result;
    }
}
