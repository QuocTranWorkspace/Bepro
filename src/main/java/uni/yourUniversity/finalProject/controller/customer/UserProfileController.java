package uni.yourUniversity.finalProject.controller.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import uni.yourUniversity.finalProject.controller.BaseController;
import uni.yourUniversity.finalProject.model.SaleOrder;
import uni.yourUniversity.finalProject.model.Users;
import uni.yourUniversity.finalProject.services.SaleOrderService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * The type User profile controller.
 */
@Controller
public class UserProfileController extends BaseController {

	@Autowired
	private SaleOrderService sOService;

	@RequestMapping(value = { "/logedIn/profile" }, method = RequestMethod.GET)
	private String adminProfile(final Model model, final HttpServletResponse response, final HttpServletRequest request)
			throws IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		Users userLogined = (Users) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		List<SaleOrder> saleOrderList = sOService.findAll();
		model.addAttribute("saleOrderList", userSale(saleOrderList, userLogined.getId()));

		return "customer/userProfile";
	}

	private List<SaleOrder> userSale(List<SaleOrder> saleOrderList, Integer userId) {
		List<SaleOrder> detSOD = new ArrayList<>();
		for (SaleOrder s : saleOrderList) {
			if (s.getUser() != null && s.getUser() == userId) {
				detSOD.add(s);
			}
		}
		return detSOD;
	}
}
