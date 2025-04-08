package uni.yourUniversity.finalProject.services;

import org.springframework.stereotype.Service;
import uni.yourUniversity.finalProject.model.BaseEntity;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.Table;
import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * The type Base service.
 *
 * @param <E> the type parameter
 */
// Báo spring biết đây là 1 BEAN
@Service
public abstract class BaseService<E extends BaseEntity> {

	private static int SIZE_OF_PAGE = 8;
	/**
	 * The constant NO_PAGING.
	 */
	public static int NO_PAGING = 1;

	private static final Logger logger = LoggerFactory.getLogger(BaseService.class);

	/**
	 * The Entity manager.
	 */
// Inject EntityManager
	// EntityManager là 1 class để quản lí tất cả các Entity.
	// dùng để query entity, insert, delete entity
	@PersistenceContext
	protected EntityManager entityManager;

	/**
	 * Clazz class.
	 *
	 * @return the class
	 */
	protected abstract Class<E> clazz();

	/**
	 * Thực hiện lưu hoặc cập nhật bản ghi trong cơ sở dữ liệu.
	 *
	 * @param entity the entity
	 * @return e
	 */
	@Transactional
	public E saveOrUpdate(E entity) {
		if (entity.getId() == null || entity.getId() <= 0) {
			entity.setCreatedDate(new Date());
			entityManager.persist(entity); // thêm mới
			return entity;
		} else {
			return entityManager.merge(entity); // cập nhật
		}
	}

	/**
	 * xóa bản ghi trong cơ sở dữ liệu
	 *
	 * @param entity the entity
	 */
	@Transactional
	public void delete(E entity) {
		entityManager.remove(entity);
	}

	/**
	 * Lấy bản ghi trong cơ sở dữ liệu theo khóa chính id.
	 *
	 * @param primaryKey the primary key
	 * @return by id
	 */
	public E getById(int primaryKey) {
		return entityManager.find(clazz(), primaryKey);
	}

	/**
	 * Lấy tất cả bản ghi trong cơ sở dữ liệu.
	 *
	 * @return list
	 */
	@SuppressWarnings("unchecked")
	public List<E> findAll() {
		Table tbl = clazz().getAnnotation(Table.class);
		return entityManager.createNativeQuery("SELECT * FROM " + tbl.name(), clazz()).getResultList();
	}

	/**
	 * thực thi câu lệnh truy vấn cơ sở dữ liệu có phân trang
	 *
	 * @param sql  the sql
	 * @param page the page
	 * @return entities by native sql
	 */
	public PagerData<E> getEntitiesByNativeSQL(String sql, int page) {
		if (page <= 0) {
			throw new RuntimeException("page phải lớn hơn 0");
		}

		PagerData<E> result = new PagerData<>();

		try {
			// Get the total count - but be careful with the SQL construction
			// This approach may not work with all databases or complex queries
			// For a more robust solution, you might need to modify the original SQL

			String countSql;
			if (sql.toLowerCase().contains("group by")) {
				// For queries with GROUP BY, wrap the entire query
				countSql = "SELECT COUNT(*) FROM (" + sql + ") AS count_table";
			} else {
				// For simpler queries, try to extract just the FROM part
				int fromIndex = sql.toLowerCase().indexOf("from");
				if (fromIndex > 0) {
					countSql = "SELECT COUNT(*) " + sql.substring(fromIndex);

					// Remove any ORDER BY clause which isn't needed for counting
					int orderByIndex = countSql.toLowerCase().indexOf("order by");
					if (orderByIndex > 0) {
						countSql = countSql.substring(0, orderByIndex);
					}
				} else {
					// Fallback to the subquery approach
					countSql = "SELECT COUNT(*) FROM (" + sql + ") AS count_table";
				}
			}

			try {
				Query countQuery = entityManager.createNativeQuery(countSql);
				Number totalCount = (Number) countQuery.getSingleResult();
				result.setTotalItems(totalCount.intValue());
			} catch (Exception e) {
				logger.error("Error executing count query: {}", e.getMessage());
				// Fallback if count query fails
				result.setTotalItems(0);
			}

			// Set pagination metadata
			result.setCurrentPage(page);
			result.setSizeOfPage(SIZE_OF_PAGE);

			// Execute the main query with pagination
			Query dataQuery = entityManager.createNativeQuery(sql, clazz());

			if (page > 0 && result.getTotalItems() > 0) {
				int startPosition = (page - 1) * SIZE_OF_PAGE;
				if (startPosition < result.getTotalItems()) {
					dataQuery.setFirstResult(startPosition);
					dataQuery.setMaxResults(SIZE_OF_PAGE);
				} else {
					// Default to first page if requested page is out of range
					dataQuery.setFirstResult(0);
					dataQuery.setMaxResults(SIZE_OF_PAGE);
					result.setCurrentPage(1);
				}
			}

			List<E> pageData = dataQuery.getResultList();
			result.setData(pageData);

		} catch (Exception e) {
			logger.error("Error in pagination: {}", e.getMessage(), e);
			// Return empty result on error
			result.setData(new ArrayList<>());
		}

		return result;
	}

	/**
	 * Gets entity by native sql.
	 *
	 * @param sql the sql
	 * @return the entity by native sql
	 */
	public E getEntityByNativeSQL(String sql) {
		try {
			return getEntitiesByNativeSQL(sql).get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * Gets entities by native sql.
	 *
	 * @param sql the sql
	 * @return the entities by native sql
	 */
	@SuppressWarnings("unchecked")
	public List<E> getEntitiesByNativeSQL(String sql) {
		List<E> result = new ArrayList<>();

		try {
			Query query = entityManager.createNativeQuery(sql, clazz());
			result = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

}
