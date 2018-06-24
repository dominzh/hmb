package category.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import category.domain.Category;
import category.service.CategoryService;
import cn.zhku.servlet.BaseServlet;

/**
 * 分类模块的WEB层
 * @author bx
 *
 */
public class CategoryServlet extends BaseServlet {
	
	private CategoryService categoryService = new CategoryService();

	/**
	 * 查询所有分类
	 */
	public String findAll(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 通过service得到所有的分类
		 * 2. 保存到request中，转发到left.jsp
		 */		
		List<Category> parents = categoryService.findAll();
		req.setAttribute("parents", parents);
		
		return "/jsp/left.jsp";
	}
	
	/**
	 * 查询所有分类
	 */
	public String findAll2(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 通过service得到所有的分类
		 * 2. 保存到request中，转发到left.jsp
		 */
		String shopname = req.getParameter("shopname");
		List<Category> parents = categoryService.findAll();
		req.setAttribute("parents", parents);
		req.setAttribute("shopname", shopname);
		return "f:/jsp/seller/shop/left.jsp";
	}
}
