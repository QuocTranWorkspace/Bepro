package uni.yourUniversity.finalProject.services;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import uni.yourUniversity.finalProject.conf.FileStorageConfig;
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

	@Autowired
	private FileStorageConfig fileStorageConfig;

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

		// Create directories if they don't exist
		createDirectoriesIfNeeded();

		// kiểm tra xem admin có đẩy avatar lên không ???
		if (isEmptyUploadFile(productAvatar)) { // có đẩy avatar lên.
			String fileName = getUniqueUploadFileName(Objects.requireNonNull(productAvatar.getOriginalFilename()));

			// Use configured path
			String pathToAvatar = fileStorageConfig.getProductAvatarPath() + fileName;

			// lưu avatar vào đường dẫn trên
			File avatarFile = new File(pathToAvatar);
			productAvatar.transferTo(avatarFile);

			product.setAvatar("product/avatar/" + fileName);
		}

		// có đẩy pictures(product_images) ???
		if (isEmptyUploadFile(productPictures)) { // có đẩy pictures lên.
			for (MultipartFile pic : productPictures) {
				String fileName = getUniqueUploadFileName(Objects.requireNonNull(pic.getOriginalFilename()));

				// Use configured path
				File pictureFile = new File(fileStorageConfig.getProductImagesPath() + fileName);
				pic.transferTo(pictureFile);

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

	// Create method to ensure directories exist
	private void createDirectoriesIfNeeded() {
		new File(fileStorageConfig.getProductAvatarPath()).mkdirs();
		new File(fileStorageConfig.getProductImagesPath()).mkdirs();
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
	// Update updateProduct method similarly
	@Transactional
	public void updateProduct(ProductEntity p, MultipartFile productAvatar, MultipartFile... productPictures)
			throws IllegalStateException, IOException {

		// Create directories if they don't exist
		createDirectoriesIfNeeded();

		// lấy thông tin cũ của product theo id đang có trong database
		ProductEntity productInDb = super.getById(p.getId());

		// có đẩy avartar ??? => xóa avatar cũ đi và thêm avatar mới
		if (isEmptyUploadFile(productAvatar)) {
			// xóa avatar cũ trong folder
			File oldAvatarFile = new File(fileStorageConfig.getUploadDir() + "/" + productInDb.getAvatar());
			boolean delete = oldAvatarFile.delete();

			// update avatar mới
			if (delete) {
				String fileName = getUniqueUploadFileName(Objects.requireNonNull(productAvatar.getOriginalFilename()));
				File newAvatarFile = new File(fileStorageConfig.getProductAvatarPath() + fileName);
				productAvatar.transferTo(newAvatarFile);
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
