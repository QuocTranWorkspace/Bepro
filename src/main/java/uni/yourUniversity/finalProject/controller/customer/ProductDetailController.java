package uni.yourUniversity.finalProject.controller.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import uni.yourUniversity.finalProject.controller.BaseController;
import uni.yourUniversity.finalProject.model.Assesses;
import uni.yourUniversity.finalProject.model.ProductEntity;
import uni.yourUniversity.finalProject.services.CommentService;
import uni.yourUniversity.finalProject.services.ProductService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

/**
 * The type Product detail controller.
 */
@Controller
public class ProductDetailController extends BaseController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CommentService commentService;

	/**
	 * Admin product des string.
	 *
	 * @param model     the model
	 * @param request   the request
	 * @param response  the response
	 * @param productId the product id
	 * @return the string
	 * @throws IOException the io exception
	 */
	@GetMapping({ "/productDetail/{productId}/description" })
	public String adminProductDes(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("productId") int productId) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		// lấy product trong db theo ProductId
		ProductEntity productInDatabase = productService.getById(productId);
		model.addAttribute("product", productInDatabase);

		// đẩy danh sách categories xuống view(thêm mới sản phẩm) để hiển thị
		// selectbox cho phép chọn category
//		List<Categories> categories = categoryService.getEntitiesByNativeSQL("SELECT * FROM tbl_category");
//		model.addAttribute("categories", categories);

		return "customer/productDescription";

	}

//	@RequestMapping( value = {"/productDetail"}, method = RequestMethod.GET )
//	public String test(final Model model,
//			 		   final HttpServletRequest request,
//			 		   final HttpServletResponse response) throws IOException {
//
//		response.setContentType("text/html;charset=UTF-8");
//		request.setCharacterEncoding("utf-8");
//
//		return "customer/productDetail";
//}

	/**
	 * Admin product detail string.
	 *
	 * @param model     the model
	 * @param request   the request
	 * @param response  the response
	 * @param productId the product id
	 * @return the string
	 * @throws IOException the io exception
	 */
	@GetMapping({ "/productDetail/{productId}" })
	public String adminProductDetail(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("productId") int productId) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		// lấy product trong db theo ProductId
		ProductEntity productInDatabase = productService.getById(productId);
		model.addAttribute("product", productInDatabase);

		// lấy danh sách comment
		List<Assesses> commentInDatabase = commentService.findAll();

		List<Assesses> commentEachProduct = new ArrayList<>();

		int totalComment = 0;

		if (commentInDatabase.isEmpty()) {
			model.addAttribute("tolStar", 0);

			System.out.println(commentInDatabase.size());
			System.out.println(commentEachProduct.size());

			model.addAttribute("commentList", commentEachProduct);
			model.addAttribute("totalComment", 0);
		} else {
			for (Assesses cmt : commentInDatabase) {
				if (cmt.getProduct_comment() == productId) {
					commentEachProduct.add(cmt);
					totalComment += 1;
				}
			}

//		System.out.println(tolStar(commentEachProduct));

			System.out.println(commentInDatabase.size());
			System.out.println(commentEachProduct.size());

			model.addAttribute("tolStar", tolStar(commentEachProduct));

			model.addAttribute("commentList", commentEachProduct);
			model.addAttribute("totalComment", totalComment);
		}

		// đẩy danh sách categories xuống view(thêm mới sản phẩm) để hiển thị
		// selectbox cho phép chọn category
//		List<Categories> categories = categoryService.getEntitiesByNativeSQL("SELECT * FROM tbl_category");
//		model.addAttribute("categories", categories);

		return "customer/productDetail";
	}

	/**
	 * Ajax contact response entity.
	 *
	 * @param model     the model
	 * @param request   the request
	 * @param response  the response
	 * @param assesses  the assesses
	 * @param productId the product id
	 * @return the response entity
	 */
// addComment
	@PostMapping({ "/productDetail/addComment/{productId}" })
	public ResponseEntity<Map<String, Object>> ajaxContact(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody Assesses assesses,
			@PathVariable("productId") int productId) {
		Date date = new Date();
		assesses.setCreatedDate(date);

		commentService.saveOrUpdate(assesses);

		Map<String, Object> jsonResult = new HashMap<>();
		jsonResult.put("statusCode", 200); // 200: success; 404: not found; 500: error

		return ResponseEntity.ok(jsonResult);
	}

	// Hàm tính tổng star-rate
	private double tolStar(List<Assesses> commentEachProduct) {
		double tol = 0.0;
		double ssh = 0.0;
		double average = 0.0;

		for (Assesses a : commentEachProduct) {
			tol += a.getStarRate();
			ssh += 1;
		}
		average = tol / ssh;
		return average;
	}
}
