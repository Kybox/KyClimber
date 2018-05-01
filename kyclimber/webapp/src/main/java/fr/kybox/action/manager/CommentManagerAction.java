package fr.kybox.action.manager;

import com.opensymphony.xwork2.ActionSupport;
import fr.kybox.entities.Comment;
import fr.kybox.entities.User;
import fr.kybox.impl.services.CommentPersistenceService;
import fr.kybox.impl.services.SitePersistenceService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
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

/**
 * Struts2 - CommentManagerAction class
 * Manage the C.R.U.D. user's comments
 */
public class CommentManagerAction extends ActionSupport implements SessionAware {

    /** Logger object **/
    private final static Logger log = LogManager.getLogger(CommentManagerAction.class);

    /** Injected services **/
    @Inject private CommentPersistenceService commentService;
    @Inject private SitePersistenceService siteService;

    /** Attributes **/
    private int commentId;
    private String comment;
    private Integer siteId;
    private List<Comment> commentList;
    private Map<String, Object> session;

    /** Getters / Setters **/
    public int getCommentId() { return commentId; }
    public void setCommentId(int commentId) { this.commentId = commentId; }
    public String getComment() { return comment; }
    public void setComment(String comment) { this.comment = comment; }
    public Integer getSiteId() { return siteId; }
    public void setSiteId(Integer siteId) { this.siteId = siteId; }
    public List<Comment> getCommentList() {
        if(getSiteId()!=null)
            return commentService.findBySite(siteService.findById(getSiteId()));
        else return null;
    }

    /**
     * Create and persist a new asynchronus comment
     * @return "success" if the creation is performed otherwise "error"
     */
    public String addNewAjaxComment(){

        if(log.isDebugEnabled()) log.debug("METHOD : addNewAjaxComment()");

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

    /**
     * Update an existing comment
     * @return "success" if the update is performed otherwise "error"
     */
    public String updateAjaxUserComment(){

        if(log.isDebugEnabled()) log.debug("METHOD : updateAjaxUserComment()");

        String result = ActionSupport.SUCCESS;

        try {

            Comment comment = commentService.findById(getCommentId());
            comment.setPost(getComment());
            commentService.merge(comment);
        }
        catch (Exception e){

            log.error(e);
            result = ActionSupport.ERROR;
        }

        return result;
    }

    /**
     * Delete an existing comment
     * @return "success"
     */
    public String deleteAjaxUserComment(){

        if(log.isDebugEnabled()) log.debug("METHOD : deleteAjaxUserComment()");

        Comment comment = commentService.findById(getCommentId());
        commentService.remove(comment);

        return ActionSupport.SUCCESS;
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
