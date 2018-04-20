package fr.kybox.entities;

import javax.persistence.*;
import java.io.Serializable;

/**
 * @author Kybox
 * @version 1.0
 */
@MappedSuperclass
@Inheritance(strategy = InheritanceType.JOINED)
public abstract class AbstractEntity implements Serializable {

    public static final String FIND_BY_ID = "Entity.findById";
    public static final String FIND_ALL = "Entity.findAll";

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    protected Integer id;

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
}
