package uni.yourUniversity.finalProject.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * The type Product entity.
 */
@Entity
@Table(name = "tbl_products")
public class ProductEntity extends BaseEntity {

	@Column(name = "title", length = 1000, nullable = false)
	private String title;

	@Column(name = "price", precision = 13, scale = 2, nullable = false)
	private java.math.BigDecimal price;

	@Column(name = "price_sale", precision = 13, scale = 2)
	private java.math.BigDecimal priceSale;

	@Column(name = "short_description", length = 3000)
	private String shortDes;

	@Lob
	@Column(name = "detail_description", nullable = false, columnDefinition = "LONGTEXT")
	private String detailDes;

	@Column(name = "avatar", nullable = true)
	private String avatar;

	@Column(name = "seo", length = 1000, nullable = true)
	private String seo;

	@Column(name = "is_hot", nullable = true)
	private Boolean isHot = Boolean.TRUE;

	// Many product thuộc One category
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id") // cột khóa ngoại
	private Categories category;
	// ------------

	//// One product có Many images
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "product")
	private Set<ProductImages> productList = new HashSet<>();

	/**
	 * Add product images.
	 *
	 * @param productImages the product images
	 */
	public void addProductImages(ProductImages productImages) {
		productImages.setProduct(this);
		productList.add(productImages);
	}

	/**
	 * Delete product images.
	 *
	 * @param productImages the product images
	 */
	public void deleteProductImages(ProductImages productImages) {
		productImages.setProduct(null);
		productList.remove(productImages);
	}

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
	 * Gets price.
	 *
	 * @return the price
	 */
	public java.math.BigDecimal getPrice() {
		return price;
	}

	/**
	 * Sets price.
	 *
	 * @param price the price
	 */
	public void setPrice(java.math.BigDecimal price) {
		this.price = price;
	}

	/**
	 * Gets price sale.
	 *
	 * @return the price sale
	 */
	public java.math.BigDecimal getPriceSale() {
		return priceSale;
	}

	/**
	 * Sets price sale.
	 *
	 * @param priceSale the price sale
	 */
	public void setPriceSale(java.math.BigDecimal priceSale) {
		this.priceSale = priceSale;
	}

	/**
	 * Gets short des.
	 *
	 * @return the short des
	 */
	public String getShortDes() {
		return shortDes;
	}

	/**
	 * Sets short des.
	 *
	 * @param shortDes the short des
	 */
	public void setShortDes(String shortDes) {
		this.shortDes = shortDes;
	}

	/**
	 * Gets detail des.
	 *
	 * @return the detail des
	 */
	public String getDetailDes() {
		return detailDes;
	}

	/**
	 * Sets detail des.
	 *
	 * @param detailDes the detail des
	 */
	public void setDetailDes(String detailDes) {
		this.detailDes = detailDes;
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
	 * Gets is hot.
	 *
	 * @return the is hot
	 */
	public Boolean getIsHot() {
		return isHot;
	}

	/**
	 * Sets is hot.
	 *
	 * @param isHot the is hot
	 */
	public void setIsHot(Boolean isHot) {
		this.isHot = isHot;
	}

	/**
	 * Gets category.
	 *
	 * @return the category
	 */
	public Categories getCategory() {
		return category;
	}

	/**
	 * Sets category.
	 *
	 * @param category the category
	 */
	public void setCategory(Categories category) {
		this.category = category;
	}

	/**
	 * Gets product list.
	 *
	 * @return the product list
	 */
	public Set<ProductImages> getProductList() {
		return productList;
	}

	/**
	 * Sets product list.
	 *
	 * @param productList the product list
	 */
	public void setProductList(Set<ProductImages> productList) {
		this.productList = productList;
	}

}
