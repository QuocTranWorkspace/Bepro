package uni.yourUniversity.finalProject.services;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import uni.yourUniversity.finalProject.dto.UserSearch;
import uni.yourUniversity.finalProject.model.Users;

/**
 * The type User service.
 */
@Service
public class UserService extends BaseService<Users> {

	@Override
	protected Class<Users> clazz() {
		return Users.class;
	}

	/**
	 * Load staff by staffname users.
	 *
	 * @param StaffName the staff name
	 * @return the users
	 */
	public Users loadStaffByStaffname(String StaffName) {
		String sql = "select * from tbl_users u where u.username = '" + StaffName + "' and status = 1";
		return this.getEntityByNativeSQL(sql);
	}

	/**
	 * Search user pager data.
	 *
	 * @param userSearch the user search
	 * @return the pager data
	 */
	public PagerData<Users> searchUser(UserSearch userSearch) {
		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_users u WHERE 1=1";

		if (userSearch != null) {

			// tìm kiếm theo title và description
			if (!StringUtils.isEmpty(userSearch.getKeyword())) {
				sql += " and (u.username like '%" + userSearch.getKeyword() + "%'" + " or u.email '%"
						+ userSearch.getKeyword() + "%'" + " or u.phone '%" + userSearch.getKeyword() + "%')";
			}
		}

		return super.getEntitiesByNativeSQL(sql, userSearch.getCurrentPage());
	}

}
