package fr.kybox.entities;

import javax.persistence.*;
import java.util.List;

/**
 * @author Kybox
 * @version 1.0
 */
@Entity
@Table(name = "topo", schema = "public")
public class Topo {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer id;

    @Column(name = "name")
    private String name;

    @Column(name = "region_id")
    private Integer region;

    public Topo() {}


}
