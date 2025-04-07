package uni.yourUniversity.finalProject.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

/**
 * The type Mvc conf.
 */
//Bước số 2 khi tích hợp một spring module vào sping-boot project đó là cấu hình module đó
//1. Báo cho spring biết đây là 1 file cấu hình
//2. Tạo ra 1 Bean và dc quản lý bởi spring-container
@Configuration
public class MVCConf implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/**").addResourceLocations("classpath:/css/");
		registry.addResourceHandler("/js/**").addResourceLocations("classpath:/js/");
		registry.addResourceHandler("/img/**").addResourceLocations("classpath:/img/");

		// Use environment variable for upload path
		String uploadPath = System.getenv("UPLOAD_PATH") != null ?
				System.getenv("UPLOAD_PATH") : "uploads";
		registry.addResourceHandler("/upload/**").addResourceLocations("file:" + uploadPath + "/");
	}

	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		bean.setViewClass(JstlView.class);
		bean.setPrefix("/WEB-INF/views/");
		bean.setSuffix(".jsp");
		return bean;
	}

}
