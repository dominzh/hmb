package admin.admin.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.admin.domain.Admin;
import admin.admin.service.AdminService;
import cn.zhku.commons.CommonUtils;
import cn.zhku.servlet.BaseServlet;
public class AdminServlet extends BaseServlet {

	private AdminService adminService = new AdminService();
	/**
	 * 登录验证
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Admin form = CommonUtils.toBean(request.getParameterMap(), Admin.class);
		Admin admin = adminService.login(form);
		if(admin == null){
			request.setAttribute("msg", "用户名或密码错误");
			return "/jsp/admin/login.jsp";
		} 
		request.getSession().setAttribute("admin", admin);
		return "/admin/jsp/main.jsp";
		
	}
	
	/**
	 * 退出功能
	 */
	public String quit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().removeAttribute("admin");
		return "/jsp/admin/login.jsp";
	}

}
