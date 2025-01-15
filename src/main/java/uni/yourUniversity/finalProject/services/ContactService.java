package uni.yourUniversity.finalProject.services;

import org.springframework.stereotype.Service;
import uni.yourUniversity.finalProject.model.Contact;

/**
 * The type Contact service.
 */
@Service
public class ContactService extends BaseService<Contact> {

	@Override
	protected Class<Contact> clazz() {
		// TODO Auto-generated method stub
		return Contact.class;
	}

}
