package uni.yourUniversity.finalProject.dto;

import java.math.BigDecimal;

/**
 * Biểu thị cho 1 sản phẩm trong giỏ hàng.
 *
 * @author daing
 */
public class CartItem {
	// mã sản phẩm
	private int productId;

	// tên sản phẩme
	private String productName;

	// số lương sản phẩm
	private int quanlity;

	// đơn giá sản phẩm
	private BigDecimal priceUnit;

	// avatar
	private String avatar;

	// category
	private String category;

    /**
     * Gets category.
     *
     * @return the category
     */
    public String getCategory() {
		return category;
	}

    /**
     * Sets category.
     *
     * @param category the category
     */
    public void setCategory(String category) {
		this.category = category;
	}

    /**
     * Gets avatar.
     *
     * @return the avatar
     */
    public String getAvatar() {
		return avatar;
	}

    /**
     * Sets avatar.
     *
     * @param avatar the avatar
     */
    public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

    /**
     * Gets product id.
     *
     * @return the product id
     */
    public int getProductId() {
		return productId;
	}

    /**
     * Sets product id.
     *
     * @param productId the product id
     */
    public void setProductId(int productId) {
		this.productId = productId;
	}

    /**
     * Gets product name.
     *
     * @return the product name
     */
    public String getProductName() {
		return productName;
	}

    /**
     * Sets product name.
     *
     * @param productName the product name
     */
    public void setProductName(String productName) {
		this.productName = productName;
	}

    /**
     * Gets quanlity.
     *
     * @return the quanlity
     */
    public int getQuanlity() {
		return quanlity;
	}

    /**
     * Sets quanlity.
     *
     * @param quanlity the quanlity
     */
    public void setQuanlity(int quanlity) {
		this.quanlity = quanlity;
	}

    /**
     * Gets price unit.
     *
     * @return the price unit
     */
    public BigDecimal getPriceUnit() {
		return priceUnit;
	}

    /**
     * Sets price unit.
     *
     * @param priceUnit the price unit
     */
    public void setPriceUnit(BigDecimal priceUnit) {
		this.priceUnit = priceUnit;
	}

}
