package uni.yourUniversity.finalProject.conf;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Configuration
public class FileStorageConfig {

    @Value("${app.upload.dir:uploads}")
    private String uploadDir;

    public String getUploadDir() {
        return uploadDir;
    }

    public String getProductAvatarPath() {
        return uploadDir + "/product/avatar/";
    }

    public String getProductImagesPath() {
        return uploadDir + "/product/images/";
    }
}