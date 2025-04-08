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

	private static final long serialVersionUID = 1L;

	@Column(name = "name", length = 45, nullable = false)
	private String name;

	@Column(name = "description", length = 45, nullable = false)
	private String description;

	// This is the correct relationship for using UsersRoles entity
	@OneToMany(mappedBy = "role")
	private Set<UsersRoles> userRoles = new HashSet<>();

	// Getter and setter for userRoles
	public Set<UsersRoles> getUserRoles() {
		return userRoles;
	}

	public void setUserRoles(Set<UsersRoles> userRoles) {
		this.userRoles = userRoles;
	}

	// Helper method to get associated users
	public Set<Users> getUsers() {
		Set<Users> users = new HashSet<>();
		for (UsersRoles ur : userRoles) {
			users.add(ur.getUser());
		}
		return users;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String getAuthority() {
		return this.name;
	}
}