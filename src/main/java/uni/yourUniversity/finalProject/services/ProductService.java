package uni.yourUniversity.finalProject.services;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import uni.yourUniversity.finalProject.dto.ProductSearch;
import uni.yourUniversity.finalProject.model.ProductEntity;
import uni.yourUniversity.finalProject.model.ProductImages;

import javax.transaction.Transactional;
import java.io.File;
import java.io.IOException;
import java.util.Objects;

/**
 * The type Product service.
 */
@Service
public class ProductService extends BaseService<ProductEntity> {

	@Autowired
	private ProductImagesService productImagesService;

	@Override
	protected Class<ProductEntity> clazz() {
		return ProductEntity.class;
	}

	private boolean isEmptyUploadFile(MultipartFile[] images) {
        return images != null && images.length > 0 && (images.length != 1 || !Objects.requireNonNull(images[0].getOriginalFilename()).isEmpty());
    }


	private boolean isEmptyUploadFile(MultipartFile image) {
		return image != null && !Objects.requireNonNull(image.getOriginalFilename()).isEmpty();
	}

	private String getUniqueUploadFileName(String fileName) {
		String[] splitFileName = fileName.split("\\.");
		return splitFileName[0] + System.currentTimeMillis() + "." + splitFileName[1];
	}

	/**
	 * Save product.
	 *
	 * @param product         the product
	 * @param productAvatar   the product avatar
	 * @param productPictures the product pictures
	 * @throws IllegalStateException the illegal state exception
	 * @throws IOException           the io exception
	 */
	@Transactional
	public void saveProduct(ProductEntity product, MultipartFile productAvatar,
							MultipartFile[] productPictures) throws IllegalStateException, IOException {

		// kiểm tra xem admin có đẩy avatar lên không ???
		if (isEmptyUploadFile(productAvatar)) { // có đẩy avatar lên.

			String fileName;
            fileName = getUniqueUploadFileName(Objects.requireNonNull(productAvatar.getOriginalFilename()));

            // tạo đường dẫn tới folder chứa avatar
			String pathToAvatar = "D:/CAGL/Future/JavaWeb22/Upload/product/avatar/" + fileName;

			// lưu avatar vào đường dẫn trên
			productAvatar.transferTo(new File(pathToAvatar));

			product.setAvatar("product/avatar/" + fileName);
		}

		// có đẩy pictures(product_images) ???
		if (isEmptyUploadFile(productPictures)) { // có đẩy pictures lên.

			// nếu admin đẩy lên thì duyệt tất cả file đẩy lên và lưu trên server
			for (MultipartFile pic : productPictures) {
				String fileName = getUniqueUploadFileName(Objects.requireNonNull(pic.getOriginalFilename()));

				// lưu ảnh admin đẩy lên vào server
				pic.transferTo(new File("D:/CAGL/Future/JavaWeb22/Upload/product/images/" + fileName));

				// tạo mới 1 bản ghi product_images
				ProductImages productImages = new ProductImages();
				productImages.setPath("product/images/" + fileName);
				productImages.setTitle(fileName);

				product.addProductImages(productImages);
			}
		}
		// lưu vào database
		super.saveOrUpdate(product);

	}

	/**
	 * Update product.
	 *
	 * @param p               the p
	 * @param productAvatar   the product avatar
	 * @param productPictures the product pictures
	 * @throws IllegalStateException the illegal state exception
	 * @throws IOException           the io exception
	 */
	@Transactional
	public void updateProduct(ProductEntity p, MultipartFile productAvatar, MultipartFile... productPictures)
			throws IllegalStateException, IOException {

		// lấy thông tin cũ của product theo id đang có trong database
		ProductEntity productInDb = super.getById(p.getId());

		// có đẩy avartar ??? => xóa avatar cũ đi và thêm avatar mới
		if (isEmptyUploadFile(productAvatar)) {
			// xóa avatar cũ trong folder
			boolean delete = new File("D:/Future/JavaWeb/Upload/" + productInDb.getAvatar()).delete();

			// update avatar mới
			if (delete) {
				String fileName = getUniqueUploadFileName(Objects.requireNonNull(productAvatar.getOriginalFilename()));
				productAvatar.transferTo(new File("D:/Future/JavaWeb/Upload/product/avatar/" + fileName));
				p.setAvatar("product/avatar/" + fileName);
			}
		} else {
			// sử dụng lại avartar cũ
			p.setAvatar(productInDb.getAvatar());
		}

		// có đẩy pictures ???
		if (isEmptyUploadFile(productPictures)) {

			// xóa pictures cũ
			if (productInDb.getProductList() != null && !productInDb.getProductList().isEmpty()) {
				for (ProductImages opi : productInDb.getProductList()) {
					// xóa avatar trong folder lên
                    boolean delete = new File("D:/CAGL/Future/JavaWeb22/Upload/" + opi.getPath()).delete();

                    // xóa dữ liệu của image cho sản phẩm đang sửa trong database
					if (delete) productImagesService.delete(opi);
				}
			}

			// update pictures mới
			for (MultipartFile pic : productPictures) {
				String fileName = getUniqueUploadFileName(Objects.requireNonNull(pic.getOriginalFilename()));

				pic.transferTo(new File("D:/Future/JavaWeb/Upload/product/images/" + fileName));

				ProductImages pi = new ProductImages();
				pi.setPath("product/images/" + fileName);
				pi.setTitle(fileName);

				p.addProductImages(pi);
			}
		}

		// lưu vào database
		super.saveOrUpdate(p);
	}

	/**
	 * Search product pager data.
	 *
	 * @param productSearch the product search
	 * @return the pager data
	 */
	public PagerData<ProductEntity> searchProduct(ProductSearch productSearch) {
		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_products p WHERE 1=1";

		if (productSearch != null) {

			// tìm kiếm theo category
			if (productSearch.getCategoryId() != 0 && productSearch.getCategoryId() > 0) {
				sql += " and category_id = " + productSearch.getCategoryId();
			}

			// tìm kiếm theo title và description
			if (!StringUtils.isEmpty(productSearch.getKeyword())) {
				sql += " and (p.title like '%" + productSearch.getKeyword() + "%'" + " or p.detail_description like '%"
						+ productSearch.getKeyword() + "%'" + " or p.short_description like '%"
						+ productSearch.getKeyword() + "%')";
			}
		}

        if (productSearch == null) throw new AssertionError();
        return super.getEntitiesByNativeSQL(sql, productSearch.getCurrentPage());
	}

}
