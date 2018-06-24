package admin.category.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import category.domain.Category;
import category.service.CategoryService;
import cn.zhku.commons.CommonUtils;
import cn.zhku.servlet.BaseServlet;
import goods.service.GoodsService;
//import paper.PageBean;
//import seller.seller.domain.Seller;
//import seller.seller.service.SellerService;

public class AdminCategoryServlet extends BaseServlet {	
	private CategoryService categoryService = new CategoryService();
	private GoodsService goodsService = new GoodsService();
	
	
	/**
	 * 查询所有分类
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Category> parents = categoryService.findAll();
		request.setAttribute("num", categoryService.getNum());
		request.setAttribute("parents", parents);
		return "/admin/jsp/dishes/list.jsp";
	}
	//
	public String findnum(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("num", categoryService.getNum());
		return "/admin/jsp/main.jsp";
	}
	
	
	
	/**
	 * 添加一级分类
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String addParent(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1. 封装表单数据到Category中
		 * 2. 调用service的add()方法完成添加
		 * 3. 调用findAll()，返回list.jsp显示所有分类
		 */
		Category parent = CommonUtils.toBean(request.getParameterMap(), Category.class);
		parent.setCid(CommonUtils.uuid());//设置cid
		categoryService.add(parent);
		return findAll(request, response);
	}
	
	/**
	 * 添加第二分类：第一步
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String addChildPre(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String pid = req.getParameter("pid");//当前点击的父分类id
		List<Category> parents = categoryService.findParents();
		req.setAttribute("pid", pid);
		req.setAttribute("parents", parents);
		
		return "/admin/jsp/dishes/add2.jsp";
	}
	
	/**
	 * 添加第二分类：第二步
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String addChild(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 封装表单数据到Category中
		 * 2. 需要手动的把表单中的pid映射到child对象中
		 * 2. 调用service的add()方法完成添加
		 * 3. 调用findAll()，返回list.jsp显示所有分类
		 */
		Category child = CommonUtils.toBean(req.getParameterMap(), Category.class);
		child.setCid(CommonUtils.uuid());
		
		//手动映射pid
		Category parent = new Category();
		parent.setCid(req.getParameter("pid"));
		child.setParent(parent);
		
		categoryService.add(child);
		return findAll(req, resp);
	}
	
	/**
	 * 修改一级分类：第一步
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String editParentPre(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 获取链接中的cid
		 * 2. 使用cid加载Category
		 * 3. 保存Category
		 * 4. 转发到edit.jsp页面显示Category
		 */
		String cid = req.getParameter("cid");
		Category parent = categoryService.load(cid);
		req.setAttribute("parent", parent);
		return "/admin/jsp/dishes/edit1.jsp";
	}
	
	/**
	 * 修改一级分类：第二步
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String editParent(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 封装表单数据到Category中
		 * 2. 调用service方法完成修改
		 * 3. 转发到list.jsp显示所有分类（return findAll();）
		 */
		Category category = CommonUtils.toBean(req.getParameterMap(), Category.class);
		categoryService.edit(category);
		return findAll(req, resp);
	}
	
	/**
	 * 修改二级分类：第一步
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String editChildPre(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 获取链接参数cid，通过cid加载Category，保存之
		 * 2. 查询出所有1级分类，保存之
		 * 3. 转发到edit2.jsp
		 */
		String cid = req.getParameter("cid");
		Category child = categoryService.load(cid);
		req.setAttribute("child", child);
		req.setAttribute("parents", categoryService.findParents());
		return "/admin/jsp/dishes/edit2.jsp";
	}
		
	/**
	 * 修改二级分类：第二步
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String editChild(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 封装表单参数到Category child
		 * 2. 把表单中的pid封装到child, ...
		 * 3. 调用service.edit()完成修改
		 * 4. 返回到list.jsp
		 */
		Category child = CommonUtils.toBean(req.getParameterMap(),Category.class);
		Category parent = new Category();
		String pid = req.getParameter("pid");
		parent.setCid(pid);
		child.setParent(parent);
		
		categoryService.edit(child);
		return findAll(req, resp);
	}
	
	/**
	 * 删除一级分类
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String deleteParent(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 获取链接参数cid，它是一个1级分类的id
		 * 2. 通过cid，查看该父分类下子分类的个数
		 * 3. 如果大于零，说明还有子分类，不能删除。保存错误信息，转发到msg.jsp
		 * 4. 如果等于零，删除之，返回到list.jsp
		 */
		String cid = req.getParameter("cid");
		int cnt = categoryService.findChildrenCountByParent(cid);
		
		if(cnt > 0){
			req.setAttribute("msg", "该分类下还有子分类，不能删除！");
			req.setAttribute("parents", categoryService.findAll());
			return "/admin/jsp/dishes/list.jsp";
		}else{
			categoryService.delete(cid);
			return findAll(req, resp);
		}
	}
	
	/**
	 * 删除2级分类
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String deleteChild(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 获取cid，即2级分类id
		 * 2. 获取该分类下的图书个数
		 * 3. 如果大于零，保存错误信息，转发到msg.jsp
		 * 4. 如果等于零，删除之，返回到list.jsp
		 */
		String cid = req.getParameter("cid");
		int cnt = goodsService.findGoodsCountByCategory(cid);
		if(cnt > 0 ){
			req.setAttribute("msg", "该分类下还存在商品，不能删除！");
			req.setAttribute("parents", categoryService.findAll());
			return "/admin/jsp/dishes/list.jsp";
		}else{
			categoryService.delete(cid);
			return findAll(req, resp);
		}
	}

	
}
