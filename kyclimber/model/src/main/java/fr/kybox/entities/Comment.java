package fr.kybox.entities;

import javax.persistence.*;
import java.util.Date;

/**
 * @author Kybox
 * @version 1.0
 */
@Entity
@Table(name = "comment", schema = "public")
public class Comment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false)
    private int id;

    @Column(name = "site_id")
    private int siteId;

    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;

    @Column(name = "post")
    private String post;

    @Column(name = "post_date")
    private Date date;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getSiteId() { return siteId; }
    public void setSiteId(int siteId) { this.siteId = siteId; }

    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }

    public String getPost() { return post; }
    public void setPost(String post) { this.post = post; }

    public Date getDate() { return date; }
    public void setDate(Date date) { this.date = date; }


}
