package uni.yourUniversity.finalProject.model;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import javax.validation.constraints.Email;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * The type Users.
 */
@Entity
@Table(name = "tbl_users")
public class Users extends BaseEntity implements UserDetails {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	@Column(name = "username", length = 45, nullable = false)
	private String username;

	@Column(name = "password", length = 100, nullable = false)
	private String password;

	/**
	 * Gets serialversionuid.
	 *
	 * @return the serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	/**
	 * Sets username.
	 *
	 * @param username the username
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "email", length = 45, nullable = false)
	@Email(message = "Email không hợp lệ")
	private String email;

	@Column(name = "phone", length = 100, nullable = true)
	private String phone;

	@Column(name = "shipping_address", length = 1000, nullable = true)
	private String shipping_address;

	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private Set<UsersRoles> userRoles = new HashSet<>();

	// Helper method to get roles
	public Set<Role> getRoles() {
		Set<Role> roles = new HashSet<>();
		for (UsersRoles ur : userRoles) {
			roles.add(ur.getRole());
		}
		return roles;
	}

	// Helper method to add a role
	public void addRole(Role role) {
		UsersRoles ur = new UsersRoles();
		ur.setUser(this);
		ur.setRole(role);
		ur.setCreatedDate(new Date());
		ur.setStatus(true);
		userRoles.add(ur);
	}

	/**
	 * Sets roles.
	 *
	 * @param roles the roles
	 */
	public void setRoles(Set<UsersRoles> roles) {
		this.userRoles = roles;
	}

	/**
	 * Gets name.
	 *
	 * @return the name
	 */
	public String getName() {
		return username;
	}

	/**
	 * Sets name.
	 *
	 * @param username the username
	 */
	public void setName(String username) {
		this.username = username;
	}

	@Override
	public String getPassword() {
		return password;
	}

	/**
	 * Sets password.
	 *
	 * @param password the password
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * Gets email.
	 *
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * Sets email.
	 *
	 * @param email the email
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * Gets phone.
	 *
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}

	/**
	 * Sets phone.
	 *
	 * @param phone the phone
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}

	/**
	 * Gets shipping address.
	 *
	 * @return the shipping address
	 */
	public String getShipping_address() {
		return shipping_address;
	}

	/**
	 * Sets shipping address.
	 *
	 * @param shipping_address the shipping address
	 */
	public void setShipping_address(String shipping_address) {
		this.shipping_address = shipping_address;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Set<Role> roles = new HashSet<>();
		for (UsersRoles ur : userRoles) {
			roles.add(ur.getRole());
		}
		return roles;
	}

	@Override
	public String getUsername() {
		return this.username;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}
}
