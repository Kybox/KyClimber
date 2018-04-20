package fr.kybox.entities;

import javax.persistence.*;

/**
 * @author Kybox
 * @version 1.0
 */
@Entity
@Table(name = "topo", schema = "public")
@NamedQueries({
        @NamedQuery(name = Topo.FIND_ALL_TOPO, query = "SELECT t FROM Topo t"),
        @NamedQuery(name = Topo.FIND_BY_USER, query = "SELECT t FROM Topo t WHERE t.user = :user")
})
public class Topo extends AbstractEntity {

    public static final String FIND_BY_USER = "Topo.findByUser";
    public static final String FIND_ALL_TOPO = "Topo.findAllTopo";

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer id;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "publisher")
    private String publisher;

    @Column(name = "cover")
    private String cover;

    @Column(name = "available")
    private boolean available;

    @OneToOne
    @JoinColumn(name = "lent_to")
    private User lentToUser;

    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;

    @OneToOne
    @JoinColumn(name = "region_id")
    private Region region;

    @OneToOne
    @JoinColumn(name = "borrowed_from")
    private User borrowedFromUser;

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getPublisher() { return publisher; }
    public void setPublisher(String publisher) { this.publisher = publisher; }

    public String getCover() { return cover; }
    public void setCover(String cover) { this.cover = cover; }

    public boolean isAvailable() { return available; }
    public void setAvailable(boolean available) { this.available = available; }

    public User getLentToUser() { return lentToUser; }
    public void setLentToUser(User lentToUser) { this.lentToUser = lentToUser; }

    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }

    public Region getRegion() { return region; }
    public void setRegion(Region region) { this.region = region; }

    public User getBorrowedFromUser() { return borrowedFromUser; }
    public void setBorrowedFromUser(User borrowedFromUser) { this.borrowedFromUser = borrowedFromUser; }
}
