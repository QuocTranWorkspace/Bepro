package uni.yourUniversity.finalProject.conf;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import uni.yourUniversity.finalProject.services.UserDetailsServiceImpl;

/**
 * The type Security conf.
 */
@Configuration
@EnableWebSecurity
public class SecurityConf extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(final HttpSecurity http) throws Exception {
		http.csrf().disable().authorizeRequests() // bắt đầu cấu hình: tất cả các requests từ
				// trình duyệt đều được bắt trong hàm này

				// cho phép các request static resources không bị ràng buộc(permitAll)
				.antMatchers("/css/**", "/js/**", "/upload/**", "/img/**", "/login", "/logout", "/api/health", "/").permitAll()

				// các request kiểu: "/admin/" là phải đăng nhập (authenticated)
				.antMatchers("/administrator/**").hasAnyAuthority("ADMIN") // authenticated()
				.antMatchers("/productDetail/**", "/logedIn/**").authenticated()

				.and()

				// cấu hình trang đăng nhập
				// /login: một request trong LoginController
				.formLogin().loginPage("/login").loginProcessingUrl("/login_processing_url")
				.defaultSuccessUrl("/home", true) // login thành công thì luôn trở về trang người dùng
				.failureUrl("/login?login_error=true")

				.and()

				// cấu hình request mapping cho phần logout
				.logout().logoutUrl("/logout").logoutSuccessUrl("/home").invalidateHttpSession(true)
				.deleteCookies("JSESSIONID").and().rememberMe().key("uniqueAndSecret").tokenValiditySeconds(86400);
	}

	/**
	 * cấu hình service và thuật toán mã hóa mật khẩu
	 *
	 * @param auth
	 * @throws Exception
	 */
	@Autowired
	private UserDetailsServiceImpl userDetailsService;

	/**
	 * Configure global.
	 *
	 * @param auth the auth
	 * @throws Exception the exception
	 */
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(new BCryptPasswordEncoder(4));
	}

	/**
	 * The entry point of application.
	 *
	 * @param args the input arguments
	 */
	public static void main(String[] args) {
		System.out.println(new BCryptPasswordEncoder(4).encode("admin"));

		System.out.println(new BCryptPasswordEncoder(4).encode("guest"));

	}

}
