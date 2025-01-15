package uni.yourUniversity.finalProject.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * The type Assesses.
 */
@Entity
@Table(name = "tbl_assesses")
public class Assesses extends BaseEntity {

	@Column(name = "content", length = 1000, nullable = false)
	private String content;

	@Column(name = "author", nullable = true)
	private String author;

	@Column(name = "star_rate", nullable = false)
	private Double starRate;

	@Column(name = "user_id", nullable = false)
	private Integer user_id;

    /**
     * Gets user id.
     *
     * @return the user id
     */
    public Integer getUser_id() {
		return user_id;
	}

    /**
     * Sets user id.
     *
     * @param user_id the user id
     */
    public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

    /**
     * Gets star rate.
     *
     * @return the star rate
     */
    public Double getStarRate() {
		return starRate;
	}

    /**
     * Sets star rate.
     *
     * @param starRate the star rate
     */
    public void setStarRate(Double starRate) {
		this.starRate = starRate;
	}

    /**
     * Gets author.
     *
     * @return the author
     */
    public String getAuthor() {
		return author;
	}

    /**
     * Sets author.
     *
     * @param author the author
     */
    public void setAuthor(String author) {
		this.author = author;
	}

	@Column(name = "product_id") // cột khóa ngoại
	private Integer product_comment;

    /**
     * Gets product comment.
     *
     * @return the product comment
     */
    public Integer getProduct_comment() {
		return product_comment;
	}

    /**
     * Sets product comment.
     *
     * @param product_comment the product comment
     */
    public void setProduct_comment(Integer product_comment) {
		this.product_comment = product_comment;
	}

    /**
     * Gets content.
     *
     * @return the content
     */
    public String getContent() {
		return content;
	}

    /**
     * Sets content.
     *
     * @param content the content
     */
    public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Comment [content=" + content + "]";
	}

}
