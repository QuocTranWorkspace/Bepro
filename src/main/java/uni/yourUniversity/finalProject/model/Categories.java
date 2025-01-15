package uni.yourUniversity.finalProject.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * The type Categories.
 */
@Entity
@Table(name = "tbl_category")
public class Categories extends BaseEntity {

	@Column(name = "name", length = 100, nullable = false)
	private String name;

	@Column(name = "description", length = 100, nullable = false)
	private String description;

	@Column(name = "seo", length = 1000, nullable = false)
	private String seo;

	// One category có Many products
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY,
			// = cascade trong database
			// on update, on delete = cascade
			mappedBy = "category") // phải trùng với tên property của @ManyToOne
	private Set<ProductEntity> products = new HashSet<>();
	// Nếu có OneToMany thì cần 2 hàm update + delete

	/**
	 * Add product.
	 *
	 * @param product the product
	 */
	public void addProduct(ProductEntity product) {
		products.add(product);
		product.setCategory(this);
	}

	/**
	 * Delete product.
	 *
	 * @param product the product
	 */
	public void deleteProduct(ProductEntity product) {
		products.remove(product);
		product.setCategory(null);
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "parent_id")
	private Categories parent;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "parent")
	private Set<Categories> childs = new HashSet<>();

	/**
	 * Add child.
	 *
	 * @param category the category
	 */
	public void addChild(Categories category) {
		this.childs.add(category);
		category.setParent(this);
	}

	/**
	 * Delete child.
	 *
	 * @param category the category
	 */
	public void deleteChild(Categories category) {
		this.childs.remove(category);
		category.setParent(null);
	}

	/**
	 * Gets name.
	 *
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * Sets name.
	 *
	 * @param name the name
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * Gets description.
	 *
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * Sets description.
	 *
	 * @param description the description
	 */
	public void setDescription(String description) {
		this.description = description;
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
	 * Gets products.
	 *
	 * @return the products
	 */
	public Set<ProductEntity> getProducts() {
		return products;
	}

	/**
	 * Sets products.
	 *
	 * @param products the products
	 */
	public void setProducts(Set<ProductEntity> products) {
		this.products = products;
	}

	/**
	 * Gets parent.
	 *
	 * @return the parent
	 */
	public Categories getParent() {
		return parent;
	}

	/**
	 * Sets parent.
	 *
	 * @param parent the parent
	 */
	public void setParent(Categories parent) {
		this.parent = parent;
	}

	/**
	 * Gets childs.
	 *
	 * @return the childs
	 */
	public Set<Categories> getChilds() {
		return childs;
	}

	/**
	 * Sets childs.
	 *
	 * @param childs the childs
	 */
	public void setChilds(Set<Categories> childs) {
		this.childs = childs;
	}

}
