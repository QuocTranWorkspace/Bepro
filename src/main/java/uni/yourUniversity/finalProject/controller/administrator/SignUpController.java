package uni.yourUniversity.finalProject.controller.administrator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import uni.yourUniversity.finalProject.controller.BaseController;
import uni.yourUniversity.finalProject.model.Users;
import uni.yourUniversity.finalProject.services.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


/**
 * The type Sign up controller.
 */
@Controller
public class SignUpController extends BaseController {
	
	@Autowired
	private UserService staffService;

	@RequestMapping(value = {"/administrator/signUp"}, method = RequestMethod.GET)
	private String adminProfile(final Model model,
							  final HttpServletResponse response,
							  final HttpServletRequest request) 
		throws IOException{
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		model.addAttribute("staffModel", new Users());
		
		return "administrator/signUp";
	}
	
	@RequestMapping(value = {"/administrator/signUp"}, method = RequestMethod.POST)
	private String adminProfile(final Model model,
								final HttpServletRequest request,
								final HttpServletResponse response,
								final @ModelAttribute("staffModel") Users staff) {
		
		System.out.println(staff.getEmail());
		
		staffService.saveOrUpdate(staff);
		
		return "administrator/signUp";
	}
	
}
