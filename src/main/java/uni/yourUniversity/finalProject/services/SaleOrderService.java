package uni.yourUniversity.finalProject.services;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import uni.yourUniversity.finalProject.dto.SaleOrderSearch;
import uni.yourUniversity.finalProject.model.SaleOrder;

/**
 * The type Sale order service.
 */
@Service
public class SaleOrderService extends BaseService<SaleOrder> {

	@Override
	protected Class<SaleOrder> clazz() {
		// TODO Auto-generated method stub
		return SaleOrder.class;
	}

	/**
	 * Page divider pager data.
	 *
	 * @param saleoOrderSearch the saleo order search
	 * @return the pager data
	 */
	public PagerData<SaleOrder> pageDivider(SaleOrderSearch saleoOrderSearch) {
		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_saleorder s WHERE 1=1";

		if (saleoOrderSearch != null) {

			// tìm kiếm theo id
			if (saleoOrderSearch.getId() != 0 && saleoOrderSearch.getId() > 0) {
				sql += " and id = " + saleoOrderSearch.getId();
			}

			// tìm kiếm theo title và description
			if (!StringUtils.isEmpty(saleoOrderSearch.getKeyword())) {
				sql += " and (s.title like '%" + saleoOrderSearch.getKeyword() + "%'" + " or s.customer_address like '%"
						+ saleoOrderSearch.getKeyword() + "%'" + " or s.customer_name like '%"
						+ saleoOrderSearch.getKeyword() + "%')";
			}
		}
		return super.getEntitiesByNativeSQL(sql, saleoOrderSearch.getCurrentPage());
	}

}
