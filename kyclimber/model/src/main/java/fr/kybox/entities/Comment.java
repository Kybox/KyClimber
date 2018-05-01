package fr.kybox.entities;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Timestamp;


/**
 * @author Kybox
 * @version 1.0
 */
@Entity
@Table(name = "comment", schema = "public")
@NamedQueries({
        @NamedQuery(name = Comment.FIND_BY_USER, query = "SELECT c FROM Comment c WHERE c.user = :user"),
        @NamedQuery(name = Comment.FIND_BY_SITE, query = "SELECT c FROM Comment c WHERE c.site = :site ORDER BY c.date DESC"),
})
public class Comment extends AbstractEntity {

    public static final String FIND_BY_USER = "Comment.findByUser";
    public static final String FIND_BY_SITE = "Comment.findBySite";

    @OneToOne
    @JoinColumn(name = "site_id")
    private Site site;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @Column(name = "post")
    private String post;

    @Column(name = "post_date")
    private Timestamp date;

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public Site getSite() { return site; }
    public void setSite(Site site) { this.site = site; }

    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }

    public String getPost() { return post; }
    public void setPost(String post) { this.post = post; }

    public Timestamp getDate() { return date; }
    public void setDate(Timestamp date) { this.date = date; }


}
