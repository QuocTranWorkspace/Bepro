package uni.yourUniversity.finalProject.services;

import org.springframework.stereotype.Service;
import uni.yourUniversity.finalProject.model.UsersRoles;

/**
 * The type Users roles service.
 */
@Service
public class UsersRolesService extends BaseService<UsersRoles> {

	@Override
	protected Class<UsersRoles> clazz() {
		// TODO Auto-generated method stub
		return UsersRoles.class;
	}

}
