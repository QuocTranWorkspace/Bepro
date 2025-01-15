package uni.yourUniversity.finalProject.controller.customer;

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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * The type Register controller.
 */
@Controller
public class RegisterController extends BaseController {
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
	@RequestMapping(value = { "/register" }, method = RequestMethod.POST)
	public String contact2(final Model model, final HttpServletRequest request, final HttpServletResponse response,
			final @ModelAttribute("userModel") Users user) throws IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		List<Users> userList = userService.findAll();
		for (int i = 0; i< userList.size();i++) {
			if (user.getName().equals(userList.get(i).getName())) {
				model.addAttribute("invalidUN", "Tên tài khỏa đã tồn tại");
				model.addAttribute("userModel", new Users());
				return "customer/register";
			}
		}

		Integer defaultRole = 17;
		user.setPassword(new BCryptPasswordEncoder(4).encode(user.getPassword()));
		userService.saveOrUpdate(user);
		// set users_roles
		UsersRoles ur = new UsersRoles();
		ur.setRole_id(defaultRole);
		ur.setUser_id(user.getId());
		urService.saveOrUpdate(ur);
		return "redirect:/login";
	}
}
