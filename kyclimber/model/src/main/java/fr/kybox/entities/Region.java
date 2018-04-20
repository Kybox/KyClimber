package fr.kybox.entities;

import javax.persistence.*;

/**
 * @author Kybox
 * @version 1.0
 */
@Entity
@Table(name = "region", schema = "public")
@NamedQueries({
        @NamedQuery(name = Region.FIND_ALL, query = "SELECT r FROM Region r")
})
public class Region extends AbstractEntity {

    @Column(name = "name", nullable = false)
    private String name;

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
}
