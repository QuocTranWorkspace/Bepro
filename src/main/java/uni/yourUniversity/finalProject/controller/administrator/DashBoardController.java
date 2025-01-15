package uni.yourUniversity.finalProject.controller.administrator;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import uni.yourUniversity.finalProject.controller.BaseController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


/**
 * The type Dash board controller.
 */
@Controller
public class DashBoardController extends BaseController {
	
	@RequestMapping(value = {"/administrator/dashBoard"}, method = RequestMethod.GET)
	private String adminProfile(final Model model,
							  final HttpServletResponse response,
							  final HttpServletRequest request) 
		throws IOException{
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		return "administrator/dashBoard";
	}
	
}

