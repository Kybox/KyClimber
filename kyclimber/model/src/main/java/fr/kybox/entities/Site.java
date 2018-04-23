package fr.kybox.entities;

import org.hibernate.search.annotations.*;
import org.hibernate.search.annotations.Index;

import javax.persistence.*;

/**
 * @author Kybox
 * @version 1.0
 *
 * Notes :
 *
 * - Hibernate Search :
 *      The @Field annotation includes the Index.YES, Analyze.YES, and Store.NO properties by default.
 *      So it's not necessary to indicate them but I put them to remember them.
 */
@Entity
@Indexed
@Table(name = "site", schema = "public")
@NamedQueries({
        @NamedQuery(name = Site.FIND_LASTEST_SITES, query = "SELECT s FROM Site s ORDER BY s.id DESC"),
        @NamedQuery(name = Site.FIND_BY_REGION, query = "SELECT s FROM Site s WHERE s.region = :region")
})
public class Site extends AbstractEntity {

    public static final String FIND_LASTEST_SITES = "Site.findLastestSites";
    public static final String FIND_BY_REGION = "Site.findByRegion";

    @JoinColumn(name = "region_id")
    @OneToOne
    private Region region;

    @Field(index = Index.YES, analyze = Analyze.YES, store = Store.NO)
    @Column(name = "name")
    private String name;

    @Field(index = Index.YES, analyze = Analyze.YES, store = Store.NO)
    @Column(name = "department")
    private String department;

    @Field(index = Index.YES, analyze = Analyze.YES, store = Store.NO)
    @Column(name = "type")
    private String type;

    @Column(name = "height")
    private String height;

    @Column(name = "orientation")
    private String orientation;

    @Column(name = "route")
    private String route;

    @Field(index = Index.YES, analyze = Analyze.YES, store = Store.NO)
    @Column(name = "quotation")
    private String quotation;

    @Field(index = Index.YES, analyze = Analyze.YES, store = Store.NO)
    @Column(name = "description")
    private String description;

    @Field(index = Index.YES, analyze = Analyze.YES, store = Store.NO)
    @Column(name = "type_description")
    private String typeDescription;

    @Field(index = Index.YES, analyze = Analyze.YES, store = Store.NO)
    @Column(name = "access")
    private String access;

    /**
     * Indexing of associated entities
     * The @IndexedEmbedded annotation is used to index associated entities,
     * like those normally defined via @ManyToMany, @OneToOne, @ManyToOne, @Embedded and @ElementCollection.
     */
    @IndexedEmbedded
    @Column(name = "topo")
    private String topo;

    @Column(name = "map")
    private String map;

    @Column(name = "picture")
    private String picture;

    public Region getRegion() { return region; }
    public void setRegion(Region region) { this.region = region; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDepartment() { return department; }
    public void setDepartment(String department) { this.department = department; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }

    public String getHeight() { return height; }
    public void setHeight(String height) { this.height = height; }

    public String getOrientation() { return orientation; }
    public void setOrientation(String orientation) { this.orientation = orientation; }

    public String getRoute() { return route; }
    public void setRoute(String route) { this.route = route; }

    public String getQuotation() { return quotation; }
    public void setQuotation(String quotation) { this.quotation = quotation; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getTypeDescription() { return typeDescription; }
    public void setTypeDescription(String typeDescription) { this.typeDescription = typeDescription; }

    public String getAccess() { return access; }
    public void setAccess(String access) { this.access = access; }

    public String getTopo() { return topo; }
    public void setTopo(String topo) { this.topo = topo; }

    public String getMap() { return map; }
    public void setMap(String map) { this.map = map; }

    public String getPicture() { return picture; }
    public void setPicture(String picture) { this.picture = picture; }
}
