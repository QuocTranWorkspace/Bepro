
package uni.yourUniversity.finalProject.controller.administrator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import uni.yourUniversity.finalProject.controller.BaseController;
import uni.yourUniversity.finalProject.dto.ProductSearch;
import uni.yourUniversity.finalProject.model.Categories;
import uni.yourUniversity.finalProject.model.ProductEntity;
import uni.yourUniversity.finalProject.services.BaseService;
import uni.yourUniversity.finalProject.services.CategoryService;
import uni.yourUniversity.finalProject.services.PagerData;
import uni.yourUniversity.finalProject.services.ProductService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * The type Product controller.
 */
@Controller
public class ProductController extends BaseController {
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ProductService productService;

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
//ex: /admin/product/management/144 (thông tin sản phẩm có id = 144) <=> Path Variable
		//ex: /admin/product/management?productId=144						 <=> request param
		@RequestMapping(value = { "/administrator/product/{productId}" }, method = RequestMethod.GET)
		public String adminProductDetail(final Model model, 
								   		 final HttpServletRequest request,
									   	 final HttpServletResponse response, 
									   	 @PathVariable("productId") int productId) throws IOException {
			response.setContentType("text/html;charset=UTF-8");
			request.setCharacterEncoding("utf-8");

			// lấy product trong db theo ProductId
			ProductEntity productInDatabase = productService.getById(productId);
			model.addAttribute("addProductModel", productInDatabase);
			
			// đẩy danh sách categories xuống view(thêm mới sản phẩm) để hiển thị
			// selectbox cho phép chọn category
			List<Categories> categories = categoryService.getEntitiesByNativeSQL("SELECT * FROM tbl_category");
			model.addAttribute("categories", categories);
			
			return "administrator/product";
			
		}
	
	//Trang hiển thị phần thêm/ sửa sp
	@RequestMapping(value = {"/administrator/product"}, method = RequestMethod.GET)
	private String product(final Model model,
							  final HttpServletResponse response,
							  final HttpServletRequest request) 
		throws IOException{
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		List<Categories> categories = categoryService.getEntitiesByNativeSQL("SELECT * FROM tbl_category");
		model.addAttribute("categories", categories);
		
		List<ProductEntity> productList = productService.findAll();
		model.addAttribute("productList", productList);
		
		model.addAttribute("addProductModel", new ProductEntity());
		
		return "administrator/product";
	}

	/**
	 * Contact 3 string.
	 *
	 * @param model           the model
	 * @param request         the request
	 * @param response        the response
	 * @param product         the product
	 * @param productAvatar   the product avatar
	 * @param productPictures the product pictures
	 * @return the string
	 * @throws IOException the io exception
	 */
//Thêm/Sửa
	@RequestMapping(value = {"/administrator/product/addProduct"}, method = RequestMethod.POST) 
	public String contact3(final Model model,
						  final HttpServletRequest request,
						  final HttpServletResponse response,
						  @ModelAttribute("addProductModel") ProductEntity product, //spring-form binding
						  @RequestAttribute("productAvatar")MultipartFile productAvatar,
						  @RequestParam("productPictures") MultipartFile[] productPictures)
		throws IOException {
		
		System.out.println(productAvatar.getOriginalFilename());
		
		List<Categories> categories = categoryService.getEntitiesByNativeSQL("SELECT * FROM tbl_category");
		model.addAttribute("categories", categories);
		
		System.out.println(product.getDetailDes());
		
		// kiểm tra xem thông tin product đẩy lên khi click submit nên là tạo mới hay chỉnh sửa
				if(product.getId() != null && product.getId() > 0) { //chỉnh sửa sản phẩm
					productService.updateProduct(product, productAvatar, productPictures);
				} else { //thêm mới
					productService.saveProduct(product, productAvatar, productPictures);	
				}
		
		model.addAttribute("addProductModel", new ProductEntity());
		
		return "administrator/product";
	}
	
	//Trang hiển thị danh sách sp
	@RequestMapping(value = {"administrator/productList"}, method = RequestMethod.GET)
	private String findProduct(final Model model,
							  final HttpServletResponse response,
							  final HttpServletRequest request) 
		throws IOException{
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		List<Categories> categories = categoryService.getEntitiesByNativeSQL("SELECT * FROM tbl_category");
		model.addAttribute("categories", categories);
		
		//Lấy dữ liệu
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
		
		//Lưu dữ liệu
		ProductSearch productSearch = new ProductSearch();
		productSearch.setKeyword(keyword);
		productSearch.setCategoryId(categoryId);
		productSearch.setCurrentPage(currentPage);
		
		PagerData<ProductEntity> prodList = productService.searchProduct(productSearch);
		model.addAttribute("prodList", prodList);
		
		model.addAttribute("productSearch", productSearch);
		
		model.addAttribute("addProductModel", new ProductEntity());
	
		return "administrator/productList";
	}
	
	//Xóa
	@RequestMapping(value = {"administrator/productList/deleteProduct/{productId}"}, method = RequestMethod.GET)
	private String deleteProduct(final Model model,
							  final HttpServletResponse response,
							  final HttpServletRequest request,
							  @PathVariable("productId") int productId) 
		throws IOException{
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		String sql = "SELECT * FROM tbl_products WHERE id = " + productId ;
		ProductEntity product = productService.getEntityByNativeSQL(sql);
		product.setStatus(false);
		
		productService.saveOrUpdate(product);
	
		return "redirect:/administrator/productList";
	}
	
}
