package uni.yourUniversity.finalProject.model;

import javax.persistence.*;

/**
 * The type Sale order products.
 */
@Entity
@Table(name = "tbl_saleorder_products")
public class SaleOrderProducts extends BaseEntity {

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "product_id")
	private ProductEntity product;

	@Column(name = "quality")
	private Integer quality;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "saleorder_id")
	private SaleOrder saleOrder;

	/**
	 * Gets sale order.
	 *
	 * @return the sale order
	 */
	public SaleOrder getSaleOrder() {
		return saleOrder;
	}

	/**
	 * Sets sale order.
	 *
	 * @param saleOrder the sale order
	 */
	public void setSaleOrder(SaleOrder saleOrder) {
		this.saleOrder = saleOrder;
	}

	/**
	 * Gets product.
	 *
	 * @return the product
	 */
	public ProductEntity getProduct() {
		return product;
	}

	/**
	 * Sets product.
	 *
	 * @param product the product
	 */
	public void setProduct(ProductEntity product) {
		this.product = product;
	}

	/**
	 * Gets quality.
	 *
	 * @return the quality
	 */
	public Integer getQuality() {
		return quality;
	}

	/**
	 * Sets quality.
	 *
	 * @param quality the quality
	 */
	public void setQuality(Integer quality) {
		this.quality = quality;
	}

}
