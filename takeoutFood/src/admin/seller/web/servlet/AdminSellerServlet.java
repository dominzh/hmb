package admin.seller.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.zhku.servlet.BaseServlet;
import seller.seller.domain.Seller;
import seller.seller.service.SellerService;

public class AdminSellerServlet extends BaseServlet {

	private SellerService sellerService = new SellerService();
	
	public String loginAll(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<Seller> sellers = sellerService.loginAll();
		req.setAttribute("sellers", sellers);
		return "/admin/jsp/seller/seller.jsp";
	}
	
	public String open(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String sid = req.getParameter("sid");
		sellerService.open(sid);
		return loginAll(req,resp);
	}
	
	public String close(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String sid = req.getParameter("sid");
		sellerService.close(sid);
		return loginAll(req,resp);
	}

}
