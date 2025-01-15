package uni.yourUniversity.finalProject.model;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

/**
 * The type Sale order.
 */
@Entity
@Table(name = "tbl_saleorder")
public class SaleOrder extends BaseEntity {
	@Column(name = "code")
	private String code;

	@Column(name = "total", precision = 13, scale = 2, nullable = false)
	private BigDecimal total;

	@Column(name = "customer_name")
	private String customerName;

	@Column(name = "customer_address")
	private String customerAddress;

	@Column(name = "customer_phone")
	private String customerPhone;

	@Column(name = "customer_email")
	private String customerEmail;

	@Column(name = "seo")
	private String seo;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "saleOrder", fetch = FetchType.EAGER)
	private Set<SaleOrderProducts> saleOrderProducts = new HashSet<>();

	/**
	 * Add sale order products.
	 *
	 * @param _saleOrderProducts the sale order products
	 */
	public void addSaleOrderProducts(SaleOrderProducts _saleOrderProducts) {
		_saleOrderProducts.setSaleOrder(this);
		saleOrderProducts.add(_saleOrderProducts);
	}

	/**
	 * Remove sale order products.
	 *
	 * @param _saleOrderProducts the sale order products
	 */
	public void removeSaleOrderProducts(SaleOrderProducts _saleOrderProducts) {
		_saleOrderProducts.setSaleOrder(null);
		saleOrderProducts.remove(_saleOrderProducts);
	}

	@Column(name = "user_id")
	private Integer user;

	/**
	 * Gets code.
	 *
	 * @return the code
	 */
	public String getCode() {
		return code;
	}

	/**
	 * Sets code.
	 *
	 * @param code the code
	 */
	public void setCode(String code) {
		this.code = code;
	}

	/**
	 * Gets total.
	 *
	 * @return the total
	 */
	public BigDecimal getTotal() {
		return total;
	}

	/**
	 * Sets total.
	 *
	 * @param total the total
	 */
	public void setTotal(BigDecimal total) {
		this.total = total;
	}

	/**
	 * Gets customer name.
	 *
	 * @return the customer name
	 */
	public String getCustomerName() {
		return customerName;
	}

	/**
	 * Sets customer name.
	 *
	 * @param customerName the customer name
	 */
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	/**
	 * Gets customer address.
	 *
	 * @return the customer address
	 */
	public String getCustomerAddress() {
		return customerAddress;
	}

	/**
	 * Sets customer address.
	 *
	 * @param customerAddress the customer address
	 */
	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}

	/**
	 * Gets seo.
	 *
	 * @return the seo
	 */
	public String getSeo() {
		return seo;
	}

	/**
	 * Sets seo.
	 *
	 * @param seo the seo
	 */
	public void setSeo(String seo) {
		this.seo = seo;
	}

	/**
	 * Gets sale order products.
	 *
	 * @return the sale order products
	 */
	public Set<SaleOrderProducts> getSaleOrderProducts() {
		return saleOrderProducts;
	}

	/**
	 * Sets sale order products.
	 *
	 * @param saleOrderProducts the sale order products
	 */
	public void setSaleOrderProducts(Set<SaleOrderProducts> saleOrderProducts) {
		this.saleOrderProducts = saleOrderProducts;
	}

	/**
	 * Gets customer phone.
	 *
	 * @return the customer phone
	 */
	public String getCustomerPhone() {
		return customerPhone;
	}

	/**
	 * Sets customer phone.
	 *
	 * @param customerPhone the customer phone
	 */
	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}

	/**
	 * Gets customer email.
	 *
	 * @return the customer email
	 */
	public String getCustomerEmail() {
		return customerEmail;
	}

	/**
	 * Sets customer email.
	 *
	 * @param customerEmail the customer email
	 */
	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

	/**
	 * Gets user.
	 *
	 * @return the user
	 */
	public Integer getUser() {
		return user;
	}

	/**
	 * Sets user.
	 *
	 * @param user the user
	 */
	public void setUser(Integer user) {
		this.user = user;
	}

}
