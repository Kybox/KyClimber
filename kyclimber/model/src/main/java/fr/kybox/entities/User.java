package fr.kybox.entities;

import javax.persistence.*;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;


/**
 * @author Kybox
 * @version 1.0
 */

/**
 * The User entity class
 */
@Entity
@Table(name= "users", schema = "public")
@NamedQueries({
        @NamedQuery(name = User.FIND_USER_BY_KEYWORD, query = "SELECT u FROM User u WHERE UPPER(u.firstName) LIKE UPPER(:keyword)"),
        @NamedQuery(name = User.FIND_USER_BY_LOGIN, query = "SELECT u FROM User u WHERE u.email = :email AND u.password = :pass"),
        @NamedQuery(name = User.FIND_USER_AVATAR, query = "SELECT u FROM User u WHERE u = :user"),
        @NamedQuery(name = User.FIND_ALL_USERS, query = "SELECT u FROM User u")
})
public class User extends AbstractEntity {

    public static final String FIND_ALL_USERS = "User.findAllUsers";
    public static final String FIND_USER_AVATAR = "User.findUserAvatar";
    public static final String FIND_USER_BY_LOGIN = "User.findUserByLogin";
    public static final String FIND_USER_BY_KEYWORD = "User.findUserByKeyword";

    @Column(name = "first_name", nullable = false)
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "email", nullable = false)
    private String email;

    @Column(name = "password", nullable = false)
    private String password;

    @OneToOne
    @JoinColumn(name = "avatar_id")
    private Avatar avatar;

    @Column(name = "road")
    private String road;

    @Column(name = "postal_code")
    private String postalCode;

    @Column(name = "city")
    private String city;

    @Column(name = "country")
    private String country;

    @OneToOne
    @JoinColumn(name = "level_id")
    private Level level;

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }

    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public Avatar getAvatar() { return avatar; }
    public void setAvatar(Avatar avatar) { this.avatar = avatar; }

    public String getRoad() { return road; }
    public void setRoad(String road) { this.road = road; }

    public String getPostalCode() { return postalCode; }
    public void setPostalCode(String postalCode) { this.postalCode = postalCode; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }

    public String getCountry() { return country; }
    public void setCountry(String country) { this.country = country; }

    public Level getLevel() { return level; }
    public void setLevel(Level level) { this.level = level; }
}
