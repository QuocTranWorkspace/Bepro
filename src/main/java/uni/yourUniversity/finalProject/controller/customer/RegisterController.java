package uni.yourUniversity.finalProject.controller.customer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import uni.yourUniversity.finalProject.controller.BaseController;
import uni.yourUniversity.finalProject.model.Role;
import uni.yourUniversity.finalProject.model.Users;
import uni.yourUniversity.finalProject.model.UsersRoles;
import uni.yourUniversity.finalProject.services.RoleService;
import uni.yourUniversity.finalProject.services.UserService;
import uni.yourUniversity.finalProject.services.UsersRolesService;

import javax.persistence.TypedQuery;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * The type Register controller.
 */
@Controller
public class RegisterController extends BaseController {
	private static final Logger logger = LoggerFactory.getLogger(RegisterController.class);
	/**
	 * Register string.
	 *
	 * @param model    the model
	 * @param response the response
	 * @param request  the request
	 * @return the string
	 * @throws IOException the io exception
	 */
	@RequestMapping(value = { "/register" }, method = RequestMethod.GET)
	public String register(final Model model, final HttpServletResponse response, final HttpServletRequest request)
			throws IOException {
		Role role = roleService.getById(17);
		model.addAttribute("guestRole", role);

		model.addAttribute("userModel", new Users());

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		return "customer/register";
	}

	@Autowired
	private RoleService roleService;

	@Autowired
	private UserService userService;

	@Autowired
	private UsersRolesService urService;
	/**
	 * Contact 2 string.
	 *
	 * @param model    the model
	 * @param request  the request
	 * @param response the response
	 * @param user     the user
	 * @return the string
	 * @throws IOException the io exception
	 */
	@Transactional
	@RequestMapping(value = { "/register" }, method = RequestMethod.POST)
	public String contact2(final Model model, final HttpServletRequest request,
						   final HttpServletResponse response,
						   final @ModelAttribute("userModel") Users user) throws IOException {
		try {
			response.setContentType("text/html;charset=UTF-8");
			request.setCharacterEncoding("utf-8");

			// Use the service method instead of direct entityManager access
			if (userService.usernameExists(user.getUsername())) {
				model.addAttribute("invalidUN", "Tên tài khỏa đã tồn tại");
				model.addAttribute("userModel", new Users());
				return "customer/register";
			}

			logger.info("User registered successfully: {}", user.getUsername() + user.getPassword());

			// Set basic user properties
			user.setPassword(new BCryptPasswordEncoder(4).encode(user.getPassword()));
			user.setCreatedDate(new Date());
			user.setStatus(true);

			// Save the user first to get an ID
			userService.saveOrUpdate(user);

			// Now add the role using the entity relationship
			Role defaultRole = roleService.getById(2);
			if (defaultRole != null) {
				// Create the UsersRoles entity directly
				UsersRoles ur = new UsersRoles();
				ur.setUser(user);
				ur.setRole(defaultRole);
				ur.setCreatedDate(new Date());
				ur.setStatus(true);
				urService.saveOrUpdate(ur);
			} else {
				logger.error("Default role with ID 2 not found");
			}

			logger.info("User registered successfully: {}", user.getUsername() + user.getPassword());
			return "redirect:/login";

		} catch (Exception e) {
			logger.error("Registration error: {}", e.getMessage(), e);
			model.addAttribute("errorMessage", "Đã xảy ra lỗi trong quá trình đăng ký");
			model.addAttribute("userModel", user);
			return "customer/register";
		}
	}
}
