package uni.yourUniversity.finalProject.services;

import org.springframework.stereotype.Service;
import uni.yourUniversity.finalProject.model.Categories;

/**
 * The type Category service.
 */
@Service
public class CategoryService extends BaseService<Categories> {

	@Override
	protected Class<Categories> clazz() {
		// TODO Auto-generated method stub
		return Categories.class;
	}

}
