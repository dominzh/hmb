package order.web.servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import buyer.domain.Buyer;
import cart.domain.CartItem;
import cart.service.CartItemService;
import cn.zhku.commons.CommonUtils;
import cn.zhku.servlet.BaseServlet;
import goods.service.GoodsService;
import order.domain.Order;
import order.domain.OrderItem;
import order.service.OrderService;
import paper.PageBean;
import seller.seller.service.SellerService;

public class OrderServlet extends BaseServlet {

	private OrderService orderService = new OrderService();
	private CartItemService cartItemService = new CartItemService();
	private SellerService sellerService = new SellerService();
	private GoodsService goodsService = new GoodsService();

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
	 * 评价订单
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String appraise(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/**
		 * 获取订单评价的信息
		 */
		OrderItem orderItem = CommonUtils.toBean(req.getParameterMap(),
				OrderItem.class);
		String gname=req.getParameter("gname");
		String loginname=req.getParameter("shopname");
		/**
		 * 更新订单条目
		 */
		orderService.updateAppraise(orderItem.getOrderItemId(),
				orderItem.getScore(), orderItem.getAppraise());
		
		/**
		 * 更新店铺信誉
		 */
		int honour = sellerService.getHonuer(loginname);
		int newhonour = honour + orderItem.getScore();
		sellerService.updateHonuer(newhonour,loginname);
		
		/**
		 * 更新商品平均评分
		 */
		float score = orderService.getAvgScore(gname);
		
		goodsService.updateScore(score, gname);
		return "r:/OrderServlet?method=myOrders";
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
		String orderItemId = req.getParameter("orderItemId");
		/*
		 * 校验订单状态
		 */
		int status = orderService.findStatus(orderItemId);
		if (status != 1) {
			req.setAttribute("code", "error");
			req.setAttribute("msg", "状态不对不能取消！");
			return myOrders(req, resp);
		}
		orderService.updateStatus(orderItemId, 5);// 设置状态为取消！
		req.setAttribute("code", "success");
		req.setAttribute("msg", "您的订单已取消！");
		return "r:/OrderServlet?method=myOrders";
	}

	/**
	 * 支付
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String pay(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String orderItemId = req.getParameter("orderItemId");
		/*
		 * 校验订单状态
		 */
		int status = orderService.findStatus(orderItemId);
		if (status != 1) {
			req.setAttribute("code", "error");
			req.setAttribute("msg", "状态不对不能付款！");
			return myOrders(req, resp);
		}
		orderService.updateStatus(orderItemId, 2);// 设置状态为已付款！
		req.setAttribute("code", "success");
		req.setAttribute("msg", "您的订单已付款成功！");
		return "r:/OrderServlet?method=myOrders";
	}

	/**
	 * 确认收货
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String confirm(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String orderItemId = req.getParameter("orderItemId");
		/*
		 * 校验订单状态
		 */
		int status = orderService.findStatus(orderItemId);
		if (status != 3) {
			req.setAttribute("code", "error");
			req.setAttribute("msg", "不能确认收货！");
			return myOrders(req, resp);
		}
		orderService.updateStatus(orderItemId, 4);// 设置状态为交易成功
		req.setAttribute("code", "success");
		req.setAttribute("msg", "交易成功！");
		return "r:/OrderServlet?method=myOrders";
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
		return "f:/jsp/order/desc.jsp";
	}
	 

	/**
	 * 生成订单
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String createOrder(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 获取所有购物车条目的id，查询之
		 */
		String cartItemIds = req.getParameter("cartItemIds");
		List<CartItem> cartItemList = cartItemService
				.loadCartItems(cartItemIds);
		/*
		 * 2. 创建Order
		 */
		Order order = new Order();
		order.setOid(CommonUtils.uuid());// 设置主键
		order.setOrdertime(String.format("%tF %<tT", new Date()));// 下单时间
		order.setAddress(req.getParameter("address"));// 设置收获地址
		order.setPhone(req.getParameter("phone"));// 设置手机 
		Buyer owner = (Buyer) req.getSession().getAttribute("sessionBuyer");
		order.setOwner(owner);// 设置订单所有者
		BigDecimal total = new BigDecimal("0");
		for (CartItem cartItem : cartItemList) {
			total = total.add(new BigDecimal(cartItem.getSubtotal() + ""));
		}
		order.setTotal(total.doubleValue());// 设置总计

		/*
		 * 3. 创建List<OrderItem> 一个CartItem对应一个OrderItem
		 */
		List<OrderItem> orderItemList = new ArrayList<OrderItem>();
		for (CartItem cartItem : cartItemList) {
			OrderItem orderItem = new OrderItem();
			orderItem.setOrderItemId(CommonUtils.uuid());// 设置主键
			orderItem.setQuantity(cartItem.getQuantity());
			orderItem.setSubtotal(cartItem.getSubtotal());
			orderItem.setGoods(cartItem.getGoods());
			orderItem.setStatus(1);// 设置状态，1表示未付款
			orderItem.setOrder(order);
			orderItem.setScore(1);
			orderItem.setAppraise(null);
			orderItemList.add(orderItem);
		}
		order.setOrderItemList(orderItemList);
		/*
		 * 4. 调用service完成添加
		 */
		orderService.createOrder(order);
		// 删除购物车条目
		cartItemService.batchDelete(cartItemIds);
		/*
		 * 5. 保存订单，转发到ordersucc.jsp
		 */
		req.setAttribute("order", order);
		return "r:/OrderServlet?method=myOrders";
	}

	/**
	 * 我的订单
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String myOrders(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 得到pc：如果页面传递，使用页面的，如果没传，pc=1
		 */
		int pc = getPc(req);
		/**
		 * 2.得到url：……
		 */
		String url = getUrl(req);
		/**
		 * 3.从当前session中获取
		 */
		Buyer buyer = (Buyer) req.getSession().getAttribute("sessionBuyer");

		/*
		 * 4. 使用pc和cid调用service#findByCategory得到PageBean
		 */
		PageBean<Order> pb = orderService.myOrders(buyer.getBid(), pc);
		/*
		 * 5. 给PageBean设置url，保存PageBean，转发到/jsps/book/list.jsp
		 */
		pb.setUrl(url);
		req.setAttribute("pb", pb);

		return "/jsp/order/list.jsp";
	}

}
