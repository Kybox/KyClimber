package fr.kybox.action.manager;

import com.opensymphony.xwork2.ActionSupport;
import fr.kybox.entities.Comment;
import fr.kybox.entities.User;
import fr.kybox.impl.services.CommentPersistenceService;
import fr.kybox.impl.services.SitePersistenceService;
import org.apache.struts2.interceptor.SessionAware;

import javax.inject.Inject;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.List;
import java.util.Map;

/**
 * @author Kybox
 * @version 1.0
 */
public class CommentManagerAction extends ActionSupport implements SessionAware {

    @Inject
    private CommentPersistenceService commentService;

    @Inject
    private SitePersistenceService siteService;

    private Map<String, Object> session;

    // Manager
    private int commentId;
    private String comment;
    private Integer siteId;
    private List<Comment> commentList;

    public int getCommentId() { return commentId; }
    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public String getComment() { return comment; }
    public void setComment(String comment) { this.comment = comment; }

    public Integer getSiteId() { return siteId; }
    public void setSiteId(Integer siteId) { this.siteId = siteId; }

    public List<Comment> getCommentList() {
        if(getSiteId()!=null)
            return commentService.findBySite(siteService.findById(getSiteId()));
        else return null;
    }

    public String addNewAjaxComment(){

        String result = ActionSupport.SUCCESS;

        User user = (User) session.get("user");

        if(user != null){

            Comment comment = new Comment();
            comment.setUser(user);
            comment.setSite(siteService.findById(getSiteId()));
            comment.setPost(getComment());
            comment.setDate(Timestamp.from(Instant.now()));
            commentService.persist(comment);

        }
        else result = ActionSupport.ERROR;

        return result;
    }

    public String updateAjaxUserComment(){

        String result = ActionSupport.SUCCESS;

        try {
            Comment comment = commentService.findById(getCommentId());
            comment.setPost(getComment());
            commentService.merge(comment);
        }
        catch (Exception e){
            e.printStackTrace();
            result = ActionSupport.ERROR;
        }

        return result;
    }

    public String deleteAjaxUserComment(){

        String result = ActionSupport.SUCCESS;
        Comment comment = commentService.findById(getCommentId());
        if(!commentService.remove(comment)) result = ActionSupport.ERROR;
        return result;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }
}
