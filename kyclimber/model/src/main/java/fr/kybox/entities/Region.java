package fr.kybox.entities;

import javax.persistence.*;

/**
 * @author Kybox
 * @version 1.0
 */
@Entity
@Table(name = "region", schema = "public")
@NamedQueries({
        @NamedQuery(name = Region.FIND_ALL_REGIONS, query = "SELECT r FROM Region r"),
        @NamedQuery(name = Region.FIND_ALL_REGIONS_AVAILABLE, query = "SELECT DISTINCT s.region FROM Site s"),
        @NamedQuery(name = Region.COUNT_SITES_BY_REGIONS, query = "SELECT COUNT(s) FROM Site s WHERE s.region.id = :id")

})
public class Region extends AbstractEntity {

    public static final String FIND_ALL_REGIONS = "Region.findAll";
    public static final String COUNT_SITES_BY_REGIONS = "Region.countSitesByRegions";
    public static final String FIND_ALL_REGIONS_AVAILABLE = "Region.findAllRegionsAvailable";

    @Column(name = "name", nullable = false)
    private String name;

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
}
