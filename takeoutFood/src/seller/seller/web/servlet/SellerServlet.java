package seller.seller.web.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import buyer.domain.Buyer;
import cn.zhku.commons.CommonUtils;
import cn.zhku.servlet.BaseServlet;
import seller.seller.domain.Seller;
import seller.seller.service.SellerService;
/**
 * 卖家控制层
 * @author bx
 *
 */
public class SellerServlet extends BaseServlet {

	private SellerService sellerService = new SellerService();
	/**
	 * ajax 用户名是否注册校验
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String ajaxValidateLoginname(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		/**
		 * 获取用户名
		 */
		String loginname = request.getParameter("loginname");
		/**
		 * 2.通过service得到校验结果
		 */
		boolean b = sellerService.ajaxValidateLoginname(loginname);
		/**
		 * 3.发给客户端
		 */
		response.getWriter().print(b);
		return null;

	}

	
	
	/**
	 * ajax 身份证是否注册
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String ajaxValidateId_card(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		/**
		 * 1.获取手机号码
		 */
		String id_card = request.getParameter("id_card");
		/**
		 * 2.通过service得到校验结果
		 */
		boolean b = sellerService.ajaxValidateId_card(id_card);
		/**
		 * 3.发送给客户端
		 */
		response.getWriter().print(b);
		return null;

	}
	
	
	/**
	 * 注册功能
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String regist(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		/**
		 * 1.封装表单数据到user对象
		 */
		Seller formSeller = CommonUtils.toBean(request.getParameterMap(),
				Seller.class);
		
		Buyer formBuyer = (Buyer) request.getSession().getAttribute("sessionBuyer");
		/**
		 * 2.校验，如果校验失败，保存错误信息，返回regist.jsp显示
		 */
		Map<String, String> errors = validateRegist(formSeller,
				request.getSession());
		if (errors.size() > 0) {
			request.setAttribute("errors", errors);
			request.setAttribute("form", formSeller);
			return "/jsp/seller/regist.jsp";
		}
		/**
		 * 3.使用service完成业务
		 */
		sellerService.regist(formSeller,formBuyer);
		/*
		 * 4.保存成功信息，转发到msg.jsp显示
		 */
		request.setAttribute("msg", "注册成功，请重新登录！");
		request.getSession().invalidate();
		return "/jsp/seller/login.jsp";
	}
	
	/**
	 * 注册校验 对表单的字段进行逐个校验，如果有错误，使用当前字段名称为key，错误信息为value，保存到map
	 * 
	 * @param formSeller
	 * @param session
	 * @return
	 */

	private Map<String, String> validateRegist(Seller formSeller,
			HttpSession session) {
		Map<String, String> errors = new HashMap<String, String>();
		/**
		 * 1.校验登录名
		 */
		String loginname = formSeller.getLoginname();
		if (loginname == null || loginname.trim().isEmpty()) {// 去掉空格之后还是为空
			errors.put("loginname", "用户名不能为空");
		} else if (loginname.length() < 3 || loginname.length() > 20) {
			errors.put("loginname", "用户名长度必须在3~20之间");
		} else if (!sellerService.ajaxValidateLoginname(loginname)) {
			errors.put("loginname", "用户名已被注册");
		}
				
		/**
		 * 2.校验身份证
		 */
		String id_card = formSeller.getId_card();
		if (id_card == null || id_card.trim().isEmpty()) {// 去掉空格之后还是为空
			errors.put("id_card", "身份证");
		} else if(id_card.length() != 18){
			errors.put("id_card", "身份证必须为18位");
		}else if (!sellerService.ajaxValidateId_card(id_card)) {
			errors.put("id_card", "身份证已被注册");
		} 
		
		/**
		 * 3.校验姓名
		 */
		String name = formSeller.getName();
		if (name == null || name.trim().isEmpty()) {// 去掉空格之后还是为空
			errors.put("name", "姓名不能为空");
		}
		
		return errors;
	}
	
	
	
	/**
	 * 登录功能
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	
	public String login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {	
		Seller seller = sellerService.login((Buyer)request.getSession().getAttribute("sessionBuyer"));
		request.getSession().setAttribute("sessionSeller", seller);
		return "/seller/jsp/main.jsp";
	}
	
}
