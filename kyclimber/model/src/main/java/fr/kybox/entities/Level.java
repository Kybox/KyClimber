package fr.kybox.entities;

import javax.persistence.*;

/**
 * @author Kybox
 * @version 1.0
 */
@Entity
@Table(name = "level", schema = "public")
@NamedQueries({
        @NamedQuery(name = Level.GET_LEVEL, query = "SELECT l FROM Level l WHERE l.label = :level")
})
public class Level extends AbstractEntity {

    public static final String GET_LEVEL = "Level.getLevel";
    public static final String ADMIN = "ADMIN";
    public static final String DEFAULT = "DEFAULT";

    @Column(name = "label")
    private String label;

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }
}
