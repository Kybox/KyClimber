package fr.kybox.bean.topo;

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

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public Integer getRegionId() { return regionId; }
    public void setRegionId(Integer regionId) { this.regionId = regionId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDepartment() { return department; }
    public void setDepartment(String department) { this.department = department; }
}
