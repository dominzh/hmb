package goods.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.zhku.commons.CommonUtils;
import cn.zhku.servlet.BaseServlet;
import goods.domain.Goods;
import goods.service.GoodsService;
import paper.PageBean;
import seller.seller.domain.Seller;

public class GoodsServlet extends BaseServlet {

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
	 * @param req
	 * @return
	 */
	
	private String getUrl(HttpServletRequest req) {
		String url = req.getRequestURL() + "?" +req.getQueryString();
		/**
		 * 如果url中存在pc参数，截取掉，如果不存在就不用截取
		 */
		int index = url.lastIndexOf("&pc=");
		if(index != -1){
			url = url.substring(0, index);
		}
		return url;
	}
	
	/**
	 * 按gid查询
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String load(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String gid = req.getParameter("gid");
		Goods goods = goodsService.load(gid);
		req.setAttribute("goods", goods);
		return "f:/jsp/dishes/desc.jsp";
	}
	
	/**
	 * 1.按分类查询
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findByCategory(HttpServletRequest req, HttpServletResponse resp)
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
		 * 3.获取查询条件，本方法就是cid，即分类的id
		 */
		String cid = req.getParameter("cid");
		/*
		 * 4. 使用pc和cid调用service#findByCategory得到PageBean
		 */
		String status = req.getParameter("status");
		PageBean<Goods> pb =goodsService.findByCategory(cid,status, pc);
		/*
		 * 5. 给PageBean设置url，保存PageBean，转发到/jsps/book/list.jsp
		 */
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		req.setAttribute("cid", cid);
		req.setAttribute("a", "2");
		return "f:/jsp/dishes/list.jsp";
	}
	
	
	
	/**
	 * 2.按商品名查询
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findByGname(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		/*
		 * 1. 得到pc：如果页面传递，使用页面的，如果没传，pc=1
		 */
		int pc = getPc(req);
		/**
		 * 2.得到url：……
		 */
		String url = getUrl(req);
		/**
		 * 3.获取查询条件，本方法就是cid，即分类的id
		 */
		String gname = req.getParameter("gname");
		/*
		 * 4. 使用pc和cid调用service#findByCategory得到PageBean
		 */
		String status = req.getParameter("status");
		PageBean<Goods> pb =goodsService.findByGname(gname,status, pc);
		/*
		 * 5. 给PageBean设置url，保存PageBean，转发到/jsps/book/list.jsp
		 */
		pb.setUrl(url);
		req.setAttribute("gname", gname);
		req.setAttribute("pb", pb);
		req.setAttribute("a", "3");
		req.setAttribute("title", "1");
		return "jsp/dishes/list.jsp";
	}
	
	/**
	 * 查看所有商品
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findAllGoods(HttpServletRequest req, HttpServletResponse resp)
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
		 * 3.获取查询条件，本方法就是cid，即分类的id
		 */
		/*
		 * 4. 使用pc和cid调用service#findByCategory得到PageBean
		 */
		String status = req.getParameter("status");
		PageBean<Goods> pb =goodsService.findAllGoods(status,pc);
				
		/*
		 * 5. 给PageBean设置url，保存PageBean，转发到/jsp/book/list.jsp
		 */
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		req.setAttribute("a", "1");
		return "/jsp/dishes/list.jsp";
	}
	
	
	
	/**
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findByShop(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String shopname = req.getParameter("shopname");
		req.setAttribute("shopname", shopname);
		return "/jsp/seller/shop/main.jsp";
	}
	
	
	
	
	///////////////////////////////////////////////////////////////////////////////////////////////////
	/**
	 * 查看所有商品
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findAllGoodsByShopname(HttpServletRequest req, HttpServletResponse resp)
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
		 * 3.获取查询条件，本方法就是cid，即分类的id
		 */
		/*
		 * 4. 使用pc和cid调用service#findByCategory得到PageBean
		 */
		String shopname = req.getParameter("shopname");
		String status = req.getParameter("status");
		PageBean<Goods> pb =goodsService.findAllGoodsBySeller(shopname,status,pc);
				
		/*
		 * 5. 给PageBean设置url，保存PageBean，转发到/jsps/book/list.jsp
		 */
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		req.setAttribute("a", "1");
		req.setAttribute("shopname", shopname);
		return "/jsp/seller/shop/list.jsp";
	}
	

	/**
	 * 按商家和分类查询
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findByCategoryByShopname(HttpServletRequest req, HttpServletResponse resp)
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
		 * 3.获取查询条件，本方法就是cid，即分类的id
		 */
		String cid = req.getParameter("cid");
		
		String shopname = req.getParameter("shopname");
		/*
		 * 4. 使用pc和cid调用service#findByCategory得到PageBean
		 */
		String status = req.getParameter("status");
		PageBean<Goods> pb =goodsService.findByCategoryBySeller(shopname,status,cid, pc);
		/*
		 * 5. 给PageBean设置url，保存PageBean，转发到/jsps/book/list.jsp
		 */
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		req.setAttribute("cid", cid);
		req.setAttribute("shopname", shopname);
		req.setAttribute("a", "2");
		return "/jsp/seller/shop/list.jsp";
	}
	
}
