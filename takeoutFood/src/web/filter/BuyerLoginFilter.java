package web.filter;

import java.io.IOException;
import java.io.File;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;


public class BuyerLoginFilter implements Filter {

	public void destroy() {
	
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		/*
		 * 1. 获取session中的user
		 * 2. 判断是否为null
		 *   > 如果为null：保存错误信息，转发到msg.jsp
		 *   > 如果不为null：放行
		 */
		HttpServletRequest req = (HttpServletRequest) request;
		Object buyer = req.getSession().getAttribute("sessionBuyer");
		if( buyer == null){
			req.setAttribute("code", "error");
			req.setAttribute("msg", "您还没登录，无权访问");
			req.getRequestDispatcher("/jsp/buyer/login.jsp").forward(req, response);
		}else{
			chain.doFilter(request, response);
		}
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
