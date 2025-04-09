package uni.yourUniversity.finalProject.services;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import uni.yourUniversity.finalProject.controller.customer.RegisterController;
import uni.yourUniversity.finalProject.model.Users;

/**
 * The type User details service.
 */
@Service
public class UserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	private UserService userService;

	private static final Logger logger = LoggerFactory.getLogger(UserDetailsServiceImpl.class);

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// connect tới db và lấy user theo username
		Users user = userService.loadStaffByStaffname(username);
		logger.info("User: " + username + " has authorities:");
		for (GrantedAuthority auth : user.getAuthorities()) {
			logger.info(" - Authority: '" + auth.getAuthority() + "'");
		}

		return user;
	}

}
