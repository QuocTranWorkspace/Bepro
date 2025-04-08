package uni.yourUniversity.finalProject.model;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_users_roles")
public class UsersRoles extends BaseEntity {

	@ManyToOne
	@JoinColumn(name = "user_id", nullable = false)
	private Users user;

	@ManyToOne
	@JoinColumn(name = "role_id", nullable = false)
	private Role role;

	// Getters and setters
	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}
}