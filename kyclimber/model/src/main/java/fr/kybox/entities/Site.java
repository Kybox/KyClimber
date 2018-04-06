package fr.kybox.entities;

import javax.persistence.*;

/**
 * @author Kybox
 * @version 1.0
 */
@Entity
@Table(name = "site", schema = "public")
public class Site {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "region_id")
    private Integer regionId;

    @Column(name = "name")
    private String name;

    @Column(name = "department")
    private String department;

    @Column(name = "type")
    private String type;

    @Column(name = "height")
    private String height;

    @Column(name = "orientation")
    private String orientation;

    @Column(name = "route")
    private String route;

    @Column(name = "quotation")
    private String quotation;

    @Column(name = "description")
    private String description;

    @Column(name = "type_description")
    private String typeDescription;

    @Column(name = "access")
    private String access;

    @Column(name = "topo")
    private String topo;

    @Column(name = "map")
    private String map;

    @Column(name = "picture")
    private String picture;

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public Integer getRegionId() { return regionId; }
    public void setRegionId(Integer regionId) { this.regionId = regionId; }

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
