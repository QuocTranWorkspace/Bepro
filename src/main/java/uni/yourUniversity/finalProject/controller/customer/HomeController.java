package uni.yourUniversity.finalProject.controller.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import uni.yourUniversity.finalProject.controller.BaseController;
import uni.yourUniversity.finalProject.dto.ProductSearch;
import uni.yourUniversity.finalProject.model.ProductEntity;
import uni.yourUniversity.finalProject.services.BaseService;
import uni.yourUniversity.finalProject.services.PagerData;
import uni.yourUniversity.finalProject.services.ProductService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * The type Home controller.
 */
@Controller
public class HomeController extends BaseController {

	@Autowired
	private ProductService productService;

	/**
	 * Home string.
	 *
	 * @param model    the model
	 * @param request  the request
	 * @param response the response
	 * @return the string
	 * @throws IOException the io exception
	 */
	@RequestMapping(value = { "/home" }, method = RequestMethod.GET)
	public String home(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		// Lấy dữ liệu
		String keyword = request.getParameter("keyword");
		Integer categoryId = 0;
		try {
			categoryId = Integer.parseInt(request.getParameter("categoryId"));
		} catch (Exception e) {
		}
		Integer currentPage = BaseService.NO_PAGING;
		try {
			currentPage = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
		}

		// Lưu dữ liệu
		ProductSearch productSearch = new ProductSearch();
		productSearch.setKeyword(keyword);
		productSearch.setCategoryId(categoryId);
		productSearch.setCurrentPage(currentPage);

//				PagerData<ProductEntity> prodList = productService.searchProduct(productSearch);
		PagerData<ProductEntity> productList = productService.searchProduct(productSearch);
		model.addAttribute("productList", productList);

		return "customer/home";
	}

}
