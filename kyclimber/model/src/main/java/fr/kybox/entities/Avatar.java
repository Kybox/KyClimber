package fr.kybox.entities;

import javax.persistence.*;

/**
 * @author Kybox
 * @version 1.0
 */
@Entity
@Table(name = "avatar", schema = "public")
@NamedQueries({
        @NamedQuery(name = Avatar.FIND_ALL_AVATAR, query = "SELECT a FROM Avatar a"),
        @NamedQuery(name = Avatar.FIND_BY_ID, query = "SELECT a FROM Avatar a WHERE a.id = :id")
})
public class Avatar extends AbstractEntity {

    public static final String FIND_ALL_AVATAR = "Avatar.findAllAvatar";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false)
    private Integer id;

    @Column(name = "url")
    private String url;

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getUrl() { return url; }
    public void setUrl(String url) { this.url = url; }
}
