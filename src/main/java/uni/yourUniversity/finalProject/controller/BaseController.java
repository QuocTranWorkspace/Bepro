package uni.yourUniversity.finalProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ModelAttribute;
import uni.yourUniversity.finalProject.model.Categories;
import uni.yourUniversity.finalProject.model.Users;
import uni.yourUniversity.finalProject.services.CategoryService;

import java.util.List;

/**
 * The type Base controller.
 */
public abstract class BaseController {

	@Autowired
	private CategoryService categoryService;

	/**
	 * Gets all categories.
	 *
	 * @return the all categories
	 */
	@ModelAttribute("categories")
	public List<Categories> getAllCategories() {
		return categoryService.findAll();
	}

	/**
	 * Gets user logined.
	 *
	 * @return the user logined
	 */
	/*
	 * trả về user đang login User logined có thể truy cập thông qua class
	 * SecurityContextHolder
	 *
	 * @return
	 */
	@ModelAttribute("userLogined")
	public Users getUserLogined() {
		Object userLogined = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (userLogined != null && userLogined instanceof UserDetails) {
			return (Users) userLogined;
		}
		return new Users();
	}

}
