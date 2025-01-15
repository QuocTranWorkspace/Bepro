package uni.yourUniversity.finalProject.dto;

/**
 * The type Sale order search.
 */
public class SaleOrderSearch {

	private String keyword;
	private Integer id;
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
     * Gets id.
     *
     * @return the id
     */
    public Integer getId() {
		return id;
	}

    /**
     * Sets id.
     *
     * @param id the id
     */
    public void setId(Integer id) {
		this.id = id;
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
     * @param currentPage the current page
     */
    public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

}
