package seller.order.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.zhku.servlet.BaseServlet;
import order.domain.Order;
import order.domain.OrderItem;
import order.service.OrderService;
import paper.PageBean;
import seller.seller.domain.Seller;

public class SellerOrderServlet extends BaseServlet {

private OrderService orderService = new OrderService();
	
	/**
	 * 获取当前页码
	 * 
	 * @param req
	 * @return
	 */
	private int getPc(HttpServletRequest req) {
		int pc = 1;
		String param = req.getParameter("pc");
		if (param != null && !param.trim().isEmpty()) {
			try {
				pc = Integer.parseInt(param);
			} catch (RuntimeException e) {
			}
		}
		return pc;
	}

	/**
	 * 截取url，页面中的分页导航中需要使用它做为超链接的目标！
	 * 
	 * @param req
	 * @return
	 */
	/*
	 * http://localhost:8080/goods/BookServlet?methed=findByCategory&cid=xxx&pc=3
	 * /goods/BookServlet + methed=findByCategory&cid=xxx&pc=3
	 */
	private String getUrl(HttpServletRequest req) {
		String url = req.getRequestURL() + "?" + req.getQueryString();
		/**
		 * 如果url中存在pc参数，截取掉，如果不存在就不用截取
		 */
		int index = url.lastIndexOf("&pc=");
		if (index != -1) {
			url = url.substring(0, index);
		}
		return url;
	}
	
	/**
	 * 查询所有订单
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findAll(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		
		/*
		 * 1. 得到pc：如果页面传递，使用页面的，如果没传，pc=1
		 */
		int pc = getPc(req);
		/**
		 * 2.得到url：……
		 */
		String url = getUrl(req);
		
		Seller seller = (Seller)req.getSession().getAttribute("sessionSeller");
		String shopname = seller.getLoginname();
		/*
		 * 4. 使用pc和cid调用service#findByCategory得到PageBean
		 */
		PageBean<OrderItem> pb = orderService.findAll(shopname,pc);
		/*
		 * 5. 给PageBean设置url，保存PageBean，转发到/jsps/book/list.jsp
		 */
		pb.setUrl(url);
		req.setAttribute("pb", pb);

		return "f:/seller/jsp/order/list.jsp";
	}
	
	/**
	 * 按状态查询
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	
	public String findByStatus(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		
		/*
		 * 1. 得到pc：如果页面传递，使用页面的，如果没传，pc=1
		 */
		int pc = getPc(req);
		/**
		 * 2.得到url：……
		 */
		String url = getUrl(req);
		Seller seller = (Seller)req.getSession().getAttribute("sessionSeller");
		String shopname = seller.getLoginname();
		
		int status = Integer.parseInt(req.getParameter("status"));
		/*
		 * 4. 使用pc和cid调用service#findByCategory得到PageBean
		 */
		PageBean<OrderItem> pb = orderService.findByStatus(shopname,status, pc);
		/*
		 * 5. 给PageBean设置url，保存PageBean，转发到/jsps/book/list.jsp
		 */
		pb.setUrl(url);
		req.setAttribute("pb", pb);

		return "f:/seller/jsp/order/list.jsp";
	}

	/**
	 *查询订单详细信息////////////////////////////////////////////////////////
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String loadOrderItem(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String orderItemId = req.getParameter("orderItemId");
		OrderItem orderitem = orderService.loadOrderItem(orderItemId);
		req.setAttribute("orderItem",  orderitem);
		return "f:/seller/jsp/order/desc.jsp";
	}
	
	/**
	 * 取消订单
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String cancel(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String orderitemId = req.getParameter("orderItemId");
		/*
		 * 校验订单状态
		 */
		int status = orderService.findStatus(orderitemId);
		if (status != 1) {//statue=1未付款
			req.setAttribute("code", "error");
			req.setAttribute("msg", "状态不对不能取消！");
			return findAll(req, resp);
		}
		orderService.updateStatus(orderitemId, 5);// 设置状态为取消！
		req.setAttribute("code", "success");
		//req.setAttribute("msg", "订单已取消！");
		return "r:/seller/SellerOrderServlet?method=findAll";
	} 
	
	/**
	 * 发货
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String deliver(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String orderitemId = req.getParameter("orderItemId");
		/*
		 * 校验订单状态
		 */
		int status = orderService.findStatus(orderitemId);
		if (status != 2) {//status=2 已付款但未发货
			req.setAttribute("code", "error");
			req.setAttribute("msg", "状态不对不能发货！");
			return findAll(req, resp);
		}
		orderService.updateStatus(orderitemId, 3);// 设置状态为取消！
		req.setAttribute("code", "success");
		//req.setAttribute("msg", "您的订单已发货！");
		return "r:/seller/SellerOrderServlet?method=findAll";
	}

}
