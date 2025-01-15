package uni.yourUniversity.finalProject.controller.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import uni.yourUniversity.finalProject.controller.BaseController;
import uni.yourUniversity.finalProject.dto.Cart;
import uni.yourUniversity.finalProject.dto.CartItem;
import uni.yourUniversity.finalProject.model.ProductEntity;
import uni.yourUniversity.finalProject.model.SaleOrder;
import uni.yourUniversity.finalProject.model.SaleOrderProducts;
import uni.yourUniversity.finalProject.services.ProductService;
import uni.yourUniversity.finalProject.services.SaleOrderProductsService;
import uni.yourUniversity.finalProject.services.SaleOrderService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * The type Cart controller.
 */
@Controller
public class CartController extends BaseController {

	@Autowired
	private SaleOrderService saleOrderService;

	@Autowired
	private ProductService productService;

	@Autowired
	private SaleOrderProductsService sopService;

	/**
	 * Cart checkout string.
	 *
	 * @param model    the model
	 * @param request  the request
	 * @param response the response
	 * @return the string
	 * @throws IOException the io exception
	 */
	@RequestMapping(value = { "/cart/checkout" }, method = RequestMethod.GET)
	public String cartCheckout(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		Object userLogined = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (userLogined != null) {
			HttpSession session = request.getSession();

			session.setAttribute("totalItems", getTotalItems(request));
			session.setAttribute("totalPrice", calculateTotalPrice(request));

			return "customer/shoppingCart"; // -> đường dẫn tới View.
		} else {
			return "redirect:/login";
		}
	}

//	@RequestMapping(value = { "/cart/checkout" }, method = RequestMethod.GET)
//	public String cartCheckout1(final Model model,
//							   final HttpServletRequest request,
//							   final HttpServletResponse response) throws IOException {
//		return "customer/shoppingCart"; // -> đường dẫn tới View.
//	}

	/**
	 * Cart finished string.
	 *
	 * @param model    the model
	 * @param request  the request
	 * @param response the response
	 * @return the string
	 * @throws IOException the io exception
	 */
	@RequestMapping(value = { "/cart/checkout" }, method = RequestMethod.POST)
	public String cartFinished(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		List<ProductEntity> productList = productService.findAll();
		model.addAttribute("productList", productList);

		// Lấy thông tin khách hàng
		String customerFullName = request.getParameter("customerFullName");
		String customerEmail = request.getParameter("customerEmail");
		String customerPhone = request.getParameter("customerPhone");
		String customerAddress = request.getParameter("customerAddress");

		// tạo hóa đơn + với thông tin khách hàng lấy được
		SaleOrder saleOrder = new SaleOrder();
		saleOrder.setCustomerName(customerFullName);
		saleOrder.setCustomerEmail(customerEmail);
		saleOrder.setCustomerAddress(customerAddress);
		saleOrder.setCustomerPhone(customerPhone);
		saleOrder.setCode(String.valueOf(System.currentTimeMillis())); // mã hóa đơn
		saleOrder.setTotal(calculateTotalPrice(request));

		// lấy giỏ hàng
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		BigDecimal tol = cart.getTotalPrice();

		session.setAttribute("totalItems", getTotalItems(request));
		session.setAttribute("totalPrice", calculateTotalPrice(request));

		// lấy sản phẩm trong giỏ hàng
		for (CartItem cartItem : cart.getCartItems()) {
			tol = tol.add(cartItem.getPriceUnit());
			SaleOrderProducts saleOrderProducts = new SaleOrderProducts();
			saleOrderProducts.setProduct(productService.getById(cartItem.getProductId()));
			saleOrderProducts.setQuality(cartItem.getQuanlity());
			saleOrderProducts.setCreatedDate(new Date());

			// sử dụng hàm tiện ích add hoặc remove đới với các quan hệ one-to-many
			saleOrder.addSaleOrderProducts(saleOrderProducts);
		}

		// lưu vào database
		saleOrderService.saveOrUpdate(saleOrder);

		// thực hiện reset lại giỏ hàng của Session hiện tại
		session.setAttribute("cart", null);
		session.setAttribute("totalItems", 0);

		return "customer/cart_success"; // -> đường dẫn tới View.

	}

	/**
	 * Ajax add to cart response entity.
	 *
	 * @param model    the model
	 * @param request  the request
	 * @param response the response
	 * @param cartItem the cart item
	 * @return the response entity
	 * @throws UnsupportedEncodingException the unsupported encoding exception
	 */
	@RequestMapping(value = { "/ajax/addToCart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_AddToCart(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody CartItem cartItem)
			throws UnsupportedEncodingException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng. Đầu tiên giả sử giỏ hàng là null(chưa có giỏ hàng)
		Cart cart = null;

		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
		if (session.getAttribute("cart") != null) { // tồn tại 1 giỏ hàng trên session
			cart = (Cart) session.getAttribute("cart");
		} else {// chưa có giỏ hàng nào trên session
			cart = new Cart(); // khởi tạo giỏ hàng mới
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm đang có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		// kiểm tra nếu sản phẩm muốn bổ sung vào giỏ hàng có trong giỏ hàng nếu có thì
		// tăng số lượng
		boolean isExists = false;
		for (CartItem item : cartItems) {
			if (item.getProductId() == cartItem.getProductId()) {
				isExists = true;
				// tăng số lượng sản phẩm lên
				item.setQuanlity(item.getQuanlity() + cartItem.getQuanlity());
			}
		}

		// nếu sản phẩm chưa có trong giỏ hàng thì thực hiện add sản phẩm đó vào giỏ
		// hàng
		if (!isExists) {
			// trước khi thêm mới thì lấy sản phẩm trong db
			// và thiết lập tên + đơn giá cho cartitem
			ProductEntity productInDb = productService.getById(cartItem.getProductId());

			cartItem.setProductName(productInDb.getTitle());
			cartItem.setPriceUnit(productInDb.getPriceSale());
			cartItem.setAvatar(productInDb.getAvatar());
			cartItem.setCategory(productInDb.getCategory().getName());

			cart.getCartItems().add(cartItem); // thêm mới sản phẩm vào giỏ hàng
		}

		session.setAttribute("totalPrice", calculateTotalPrice(request));

		// tính tổng tiền
//		this.calculateTotalPrice(request);

		// set giá trị avatar cho cartItem
//		List<ProductEntity> productList = productService.findAll();
//		getAvatar(cartItem, request, productList);
//
//		//set giá trị category cho cartItem
//		getCategory(cartItem, request, productList);

		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));

		// lưu totalItems vào session
		// tất cả các giá trị lưu trên session đều có thể truy cập được từ View
		session.setAttribute("totalItems", getTotalItems(request));
		// lưu totalPrice vào session
		session.setAttribute("totalPrice", calculateTotalPrice(request));

		return ResponseEntity.ok(jsonResult);
	}

	// Tính tổng tiền
	private BigDecimal calculateTotalPrice(HttpServletRequest request) {
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("cart") == null) {
			return BigDecimal.ZERO;
		}

		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		BigDecimal total = BigDecimal.ZERO;

		for (CartItem item : cartItems) {
			int ii = item.getQuanlity();
			BigDecimal tpi = item.getPriceUnit().multiply(BigDecimal.valueOf(ii));
			total = total.add(tpi);
		}

		return total;

	}

	/**
	 * hàm trả về số lượng sản phẩm có trong giỏ hàng
	 *
	 * @param request
	 * @return
	 */
	private int getTotalItems(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("cart") == null) {
			return 0;
		}

		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		int total = 0;
		for (CartItem item : cartItems) {
			total += item.getQuanlity();
		}

		return total;
	}

	// lấy avatar từ dtb
//	private void getAvatar(final CartItem cartItem, HttpServletRequest request, List<ProductEntity> productList) {
//
//		HttpSession httpSession = request.getSession();
//
//		Cart cart = (Cart) httpSession.getAttribute("cart");
//		List<CartItem> cartItems = cart.getCartItems();
//
//		var size = cartItems.size();
//		for (var i = 0; i<size; i++) {
//			if (cartItem.getProductId()==cartItems.get(i).getProductId()) {
//				for (ProductEntity p:productList) {
//					if (p.getId()==cartItem.getProductId()) {
//						cartItem.setAvatar(p.getAvatar());
//					}
//				}
//		}
//	}
//	}

	// lấy category từ dtb
//		private void getCategory(final CartItem cartItem, HttpServletRequest request, List<ProductEntity> productList) {
//
//			HttpSession httpSession = request.getSession();
//
//			Cart cart = (Cart) httpSession.getAttribute("cart");
//			List<CartItem> cartItems = cart.getCartItems();
//
//			var size = cartItems.size();
//			for (var i = 0; i<size; i++) {
//				if (cartItem.getProductId()==cartItems.get(i).getProductId()) {
//					for (ProductEntity p:productList) {
//						if (p.getId()==cartItem.getProductId()) {
//							cartItem.setCategory(p.getCategory().getName());
//						}
//					}
//			}
//		}
//		}

	/**
	 * Ajax update cart item response entity.
	 *
	 * @param model    the model
	 * @param request  the request
	 * @param response the response
	 * @param cartItem the cart item
	 * @return the response entity
	 * @throws UnsupportedEncodingException the unsupported encoding exception
	 */
	@RequestMapping(value = { "/ajax/updateQuantity" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_UpdateCartItem(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody CartItem cartItem)
			throws UnsupportedEncodingException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng. Đầu tiên giả sử giỏ hàng là null(chưa có giỏ hàng)

		Cart cart = (Cart) session.getAttribute("cart");

		// Lấy danh sách sản phẩm đang có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		setCurrenyQuantity(cartItem, request);

		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		jsonResult.put("cartItems", cartItems);

		// lưu totalItems vào session
		// tất cả các giá trị lưu trên session đều có thể truy cập được từ View
		session.setAttribute("totalItems", getTotalItems(request));
		// lưu totalPrice vào session
		session.setAttribute("totalPrice", calculateTotalPrice(request));

		return ResponseEntity.ok(jsonResult);
	}

	// Hàm nhận cartItem, request để set số lượng hiện tại của item trên data của
	// session
	private void setCurrenyQuantity(final CartItem cartItem, HttpServletRequest request) {
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng. Đầu tiên giả sử giỏ hàng là null(chưa có giỏ hàng)

		Cart cart = (Cart) session.getAttribute("cart");

		// Lấy danh sách sản phẩm đang có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		int currentQuantity = 0;

		// lặp qua tất cả item trong cart
		// nếu giá trị id của item hiện tại trùng với item có trong giỏ hàng
		// thì lấy giá trị hiện tại của item trong giỏ hàng rồi + giá trị update (1 ||
		// -1)
		// nếu bằng 0 thì xóa khỏi cart
		var size = cartItems.size();
		for (var i = 0; i < size; i++) {
			if (cartItem.getProductId() == cartItems.get(i).getProductId()) {
				currentQuantity = cartItems.get(i).getQuanlity() + cartItem.getQuanlity();
				cartItems.get(i).setQuanlity(currentQuantity);
				if (cartItems.get(i).getQuanlity() <= 0) {
					cartItems.remove(cartItems.get(i));
				}
			}
		}
	}

	/**
	 * Ajax delete cart item response entity.
	 *
	 * @param model    the model
	 * @param request  the request
	 * @param response the response
	 * @param cartItem the cart item
	 * @return the response entity
	 * @throws UnsupportedEncodingException the unsupported encoding exception
	 */
	@RequestMapping(value = { "/ajax/deleteItems" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_DeleteCartItem(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody CartItem cartItem)
			throws UnsupportedEncodingException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng. Đầu tiên giả sử giỏ hàng là null(chưa có giỏ hàng)

		Cart cart = (Cart) session.getAttribute("cart");

		// Lấy danh sách sản phẩm đang có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		DeleteItem(cartItem, request);

		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));

		return ResponseEntity.ok(jsonResult);
	}

	// Hàm nhận cartItem và request để xóa item khỏi data trên session
	private void DeleteItem(final CartItem cartItem, HttpServletRequest request) {
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng. Đầu tiên giả sử giỏ hàng là null(chưa có giỏ hàng)

		Cart cart = (Cart) session.getAttribute("cart");

		// Lấy danh sách sản phẩm đang có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		// lặp qua tất cả item trong cart
		// nếu giá trị id của item hiện tại trùng với item có trong giỏ hàng
		// thì xóa khỏi cart
		var size = cartItems.size();
		for (var i = 0; i < size; i++) {
			if (cartItem.getProductId() == cartItems.get(i).getProductId()) {
				cartItems.remove(cartItems.get(i));
			}
		}
	}
}
