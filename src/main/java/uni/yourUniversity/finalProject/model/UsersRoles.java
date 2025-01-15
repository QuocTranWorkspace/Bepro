package uni.yourUniversity.finalProject.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * The type Users roles.
 */
@Entity
@Table(name = "tbl_users_roles")
public class UsersRoles extends BaseEntity {

	@Column(name = "user_id", nullable = false)
	private Integer user_id;

	@Column(name = "role_id", nullable = false)
	private Integer role_id;

    /**
     * Gets user id.
     *
     * @return the user id
     */
    public Integer getUser_id() {
		return user_id;
	}

    /**
     * Sets user id.
     *
     * @param user_id the user id
     */
    public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

    /**
     * Gets role id.
     *
     * @return the role id
     */
    public Integer getRole_id() {
		return role_id;
	}

    /**
     * Sets role id.
     *
     * @param role_id the role id
     */
    public void setRole_id(Integer role_id) {
		this.role_id = role_id;
	}
}
