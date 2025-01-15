package uni.yourUniversity.finalProject.dto;

/**
 * The type User search.
 */
public class UserSearch {

	private String keyword;
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
