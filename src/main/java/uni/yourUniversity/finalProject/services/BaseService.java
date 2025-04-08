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
	@SuppressWarnings("unchecked")
	public PagerData<E> getEntitiesByNativeSQL(String sql, int page) {
		if (page <= 0) {
			throw new RuntimeException("page phải lớn hơn 0");
		}

		PagerData<E> result = new PagerData<>();

		try {
			Query query = entityManager.createNativeQuery(sql, clazz());

			// Modified version with more error handling
			if (page > 0) {
				try {
					result.setCurrentPage(page);

					// Count total items separately to avoid issues
					String countSql = "SELECT COUNT(*) FROM (" + sql + ") AS total";
					Query countQuery = entityManager.createNativeQuery(countSql);
					Number count = (Number) countQuery.getSingleResult();
					result.setTotalItems(count.intValue());

					result.setSizeOfPage(SIZE_OF_PAGE);

					// Add this check to prevent invalid pagination
					if (page > 1 && count.intValue() <= (page - 1) * SIZE_OF_PAGE) {
						page = 1; // Reset to first page if requested page exceeds total
					}

					query.setFirstResult((page - 1) * SIZE_OF_PAGE);
					query.setMaxResults(SIZE_OF_PAGE);
				} catch (Exception e) {
					// Log the specific pagination error
					System.err.println("Pagination error: " + e.getMessage());
					// Fall back to first page
					query.setFirstResult(0);
					query.setMaxResults(SIZE_OF_PAGE);
				}
			}

			result.setData(query.getResultList());
		} catch (Exception e) {
			// Print more detailed error information
			System.err.println("Error executing query: " + sql);
			System.err.println("Error message: " + e.getMessage());
			e.printStackTrace();

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
