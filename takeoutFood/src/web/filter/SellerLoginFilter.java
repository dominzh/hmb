package web.filter;

import java.io.File;
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;


public class SellerLoginFilter implements Filter {
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		Object seller = req.getSession().getAttribute("sessionSeller");
		if(seller == null) {
			request.setAttribute("msg", "需要有美食店权限！请您登陆！");
			request.getRequestDispatcher("/jsp/seller/login.jsp").forward(request, response);
		} else {
			chain.doFilter(request, response);
		}
	}  

	public void init(FilterConfig fConfig) throws ServletException {
	} 

	public void destroy() {
	}

	public boolean accept(File pathname) {
		// TODO Auto-generated method stub
		return false;
	}
}
