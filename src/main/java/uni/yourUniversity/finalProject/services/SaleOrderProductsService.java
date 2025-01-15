package uni.yourUniversity.finalProject.services;

import org.springframework.stereotype.Service;
import uni.yourUniversity.finalProject.model.SaleOrderProducts;

/**
 * The type Sale order products service.
 */
@Service
public class SaleOrderProductsService extends BaseService<SaleOrderProducts> {
	@Override
	protected Class<SaleOrderProducts> clazz() {
		// TODO Auto-generated method stub
		return SaleOrderProducts.class;
	}
}
