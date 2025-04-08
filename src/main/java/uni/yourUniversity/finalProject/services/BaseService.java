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
			// Create a count query to get total items
			String countSql = "SELECT COUNT(*) FROM (" + sql + ") AS countTable";
			Query countQuery = entityManager.createNativeQuery(countSql);
			Number totalItems = (Number) countQuery.getSingleResult();

			// Set pager properties
			result.setCurrentPage(page);
			result.setTotalItems(totalItems.intValue());
			result.setSizeOfPage(SIZE_OF_PAGE);

			// Create main query
			Query query = entityManager.createNativeQuery(sql, clazz());

			// Apply pagination only if needed
			if (page > 0 && SIZE_OF_PAGE > 0) {
				int firstResult = (page - 1) * SIZE_OF_PAGE;
				// Ensure firstResult doesn't exceed total items
				if (firstResult < totalItems.intValue()) {
					query.setFirstResult(firstResult);
					query.setMaxResults(SIZE_OF_PAGE);
				} else {
					// If requested page exceeds available data, go to first page
					query.setFirstResult(0);
					query.setMaxResults(SIZE_OF_PAGE);
					result.setCurrentPage(1);
				}
			}

			result.setData(query.getResultList());
		} catch (Exception e) {
			System.err.println("Error in pagination: " + e.getMessage());
			e.printStackTrace();
			// Return empty result on error
			result.setData(new ArrayList<>());
//			result.setErrorMessage("Lỗi truy vấn dữ liệu: " + e.getMessage());
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
