package uni.yourUniversity.finalProject.services;

import org.springframework.stereotype.Service;
import uni.yourUniversity.finalProject.model.Assesses;

/**
 * The type Comment service.
 */
@Service
public class CommentService extends BaseService<Assesses> {

	@Override
	protected Class<Assesses> clazz() {
		// TODO Auto-generated method stub
		return Assesses.class;
	}

}
