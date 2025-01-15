package uni.yourUniversity.finalProject.model;

import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * The type Role.
 */
@Entity
@Table(name = "tbl_roles")
public class Role extends BaseEntity implements GrantedAuthority {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	@Column(name = "name", length = 45, nullable = false)
	private String name;

	@Column(name = "description", length = 45, nullable = false)
	private String description;

	/**
	 * The Users.
	 */
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "roles")
	Set<Users> users = new HashSet<>();

	/**
	 * Add staff.
	 *
	 * @param user the user
	 */
	public void addStaff(Users user) {
		users.add(user);
		user.getRoles().add(this);
	}

	/**
	 * Delete staff.
	 *
	 * @param user the user
	 */
	public void deleteStaff(Users user) {
		users.remove(user);
		user.getRoles().remove(this);
	}

	/**
	 * Gets staff.
	 *
	 * @return the staff
	 */
	public Set<Users> getStaff() {
		return users;
	}

	/**
	 * Sets staff.
	 *
	 * @param users the users
	 */
	public void setStaff(Set<Users> users) {
		this.users = users;
	}

	/**
	 * Gets name.
	 *
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * Sets name.
	 *
	 * @param name the name
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * Gets description.
	 *
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * Sets description.
	 *
	 * @param description the description
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String getAuthority() {
		return this.name;
	}

}
