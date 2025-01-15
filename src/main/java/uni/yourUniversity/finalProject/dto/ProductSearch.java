package uni.yourUniversity.finalProject.dto;

/**
 * The type Product search.
 */
public class ProductSearch {

	private String keyword;
	private Integer categoryId;
	private Integer currentPage;

	/**
	 * Gets keyword.
	 *
	 * @return the keyword
	 */
	public String getKeyword() {
		return keyword;
	}

	/**
	 * Sets keyword.
	 *
	 * @param keyword the keyword
	 */
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	/**
	 * Gets category id.
	 *
	 * @return the category id
	 */
	public Integer getCategoryId() {
		return categoryId;
	}

	/**
	 * Sets category id.
	 *
	 * @param categoryId the category id
	 */
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	/**
	 * Gets current page.
	 *
	 * @return the current page
	 */
	public Integer getCurrentPage() {
		return currentPage;
	}

	/**
	 * Sets current page.
	 *
	 * @param curentPage the curent page
	 */
	public void setCurrentPage(Integer curentPage) {
		this.currentPage = curentPage;
	}

}
