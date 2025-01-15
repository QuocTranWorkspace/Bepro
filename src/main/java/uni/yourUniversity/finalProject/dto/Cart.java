package uni.yourUniversity.finalProject.dto;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * biểu thị cho giỏ hàng
 *
 * @author daing
 */
public class Cart {

	// tổng số tiền trong giỏ hàng
	private BigDecimal totalPrice = BigDecimal.ZERO;

	// tổng số lượng sản phẩm trong giỏ hàng
	private Integer totalProducts = 0;

	// danh sách sản phẩm trong giỏ hàng
	private List<CartItem> cartItems = new ArrayList<>();

    /**
     * Gets cart items.
     *
     * @return the cart items
     */
    public List<CartItem> getCartItems() {
		return cartItems;
	}

    /**
     * Sets cart items.
     *
     * @param cartItems the cart items
     */
    public void setCartItems(List<CartItem> cartItems) {
		this.cartItems = cartItems;
	}

    /**
     * Gets total price.
     *
     * @return the total price
     */
    public BigDecimal getTotalPrice() {
		return totalPrice;
	}

    /**
     * Sets total price.
     *
     * @param totalPrice the total price
     */
    public void setTotalPrice(BigDecimal totalPrice) {
		this.totalPrice = totalPrice;
	}

    /**
     * Gets total products.
     *
     * @return the total products
     */
    public Integer getTotalProducts() {
		return totalProducts;
	}

    /**
     * Sets total products.
     *
     * @param totalProducts the total products
     */
    public void setTotalProducts(Integer totalProducts) {
		this.totalProducts = totalProducts;
	}

}
