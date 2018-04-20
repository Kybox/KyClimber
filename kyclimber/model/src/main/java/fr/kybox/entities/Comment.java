package fr.kybox.entities;

import javax.persistence.*;
import java.sql.Date;


/**
 * @author Kybox
 * @version 1.0
 */
@Entity
@Table(name = "comment", schema = "public")
@NamedQueries({
        @NamedQuery(name = Comment.FIND_BY_USER, query = "SELECT c FROM Comment c WHERE c.user = :user"),
        @NamedQuery(name = Comment.FIND_BY_SITE, query = "SELECT c FROM Comment c WHERE c.site = :site"),
})
public class Comment extends AbstractEntity {

    public static final String FIND_BY_USER = "Comment.findByUser";
    public static final String FIND_BY_SITE = "Comment.findBySite";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false)
    private int id;

    @OneToOne
    @JoinColumn(name = "site_id")
    private Site site;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @Column(name = "post")
    private String post;

    @Column(name = "post_date")
    private Date date;

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public Site getSite() { return site; }
    public void setSite(Site site) { this.site = site; }

    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }

    public String getPost() { return post; }
    public void setPost(String post) { this.post = post; }

    public Date getDate() { return date; }
    public void setDate(Date date) { this.date = date; }


}
