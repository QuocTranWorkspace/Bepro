package uni.yourUniversity.finalProject.model;

import javax.persistence.*;

/**
 * The type Product images.
 */
@Entity
@Table(name = "tbl_products_images")
public class ProductImages extends BaseEntity {

	@Column(name = "title", nullable = false)
	private String title;

	@Column(name = "path", nullable = false)
	private String path;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "product_id")
	private ProductEntity product;

	/**
	 * Gets title.
	 *
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * Sets title.
	 *
	 * @param title the title
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * Gets path.
	 *
	 * @return the path
	 */
	public String getPath() {
		return path;
	}

	/**
	 * Sets path.
	 *
	 * @param path the path
	 */
	public void setPath(String path) {
		this.path = path;
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

}