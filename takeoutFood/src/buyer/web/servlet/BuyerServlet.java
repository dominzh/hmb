package buyer.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import buyer.domain.Buyer;
import buyer.service.BuyerService;
import buyer.service.exception.BuyerException;
import cn.zhku.commons.CommonUtils;
import cn.zhku.servlet.BaseServlet;
/**
 * 买家模块控制层
 * @author bx
 *
 */
public class BuyerServlet extends BaseServlet {

	private BuyerService buyerService = new BuyerService();
	
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
		boolean b = buyerService.ajaxValidateLoginname(loginname);
		/**
		 * 3.发给客户端
		 */
		response.getWriter().print(b);
		return null;

	}

	/**
	 * ajax Email是否注册校验
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String ajaxValidateEmail(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		/**
		 * 1.获取Email
		 */
		String email = request.getParameter("email");
		/**
		 * 2.通过service得到校验结果
		 */
		boolean b = buyerService.ajaxValidateEmail(email);
		/**
		 * 3.发送给客户端
		 */
		response.getWriter().print(b);
		return null;

	}
	
	/**
	 * ajax 手机是否注册校验
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String ajaxValidatePhone(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		/**
		 * 1.获取手机号码
		 */
		String phone = request.getParameter("phone");
		/**
		 * 2.通过service得到校验结果
		 */
		boolean b = buyerService.ajaxValidatePhone(phone);
		/**
		 * 3.发送给客户端
		 */
		response.getWriter().print(b);
		return null;

	}
	
	/**
	 * ajax 验证码是否正确校验
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String ajaxValidateVerifyCode(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		/**
		 * 1.获取输入框中的验证码
		 */
		String verifyCode = request.getParameter("verifyCode");
		/**
		 * 2.获取图片中真实的校验码
		 */
		String vcode = (String) request.getSession().getAttribute("vCode");
		/**
		 * 3.忽略大小写比较，得到结果
		 */
		boolean b = verifyCode.equalsIgnoreCase(vcode);
		/**
		 * 4.发送给客户端
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
		Buyer formBuyer = CommonUtils.toBean(request.getParameterMap(),
				Buyer.class);
		/**
		 * 2.校验，如果校验失败，保存错误信息，返回regist.jsp显示
		 */
		Map<String, String> errors = validateRegist(formBuyer,
				request.getSession());
		if (errors.size() > 0) {
			request.setAttribute("errors", errors);
			request.setAttribute("form", formBuyer);
			return "/jsp/buyer/register.jsp";
		}
//		/**
//		 * 3.使用service完成业务
//		 */
		buyerService.regist(formBuyer);
//		/*
//		 * 4.保存成功信息，转发到msg.jsp显示
//		 */
		request.setAttribute("code", "success");
		request.setAttribute("msg", "注册成功");
		return "/jsp/buyer/login.jsp";
	}
	
	/**
	 * 注册校验 对表单的字段进行逐个校验，如果有错误，使用当前字段名称为key，错误信息为value，保存到map
	 * 
	 * @param formBuyer
	 * @param session
	 * @return
	 */

	private Map<String, String> validateRegist(Buyer formBuyer,
			HttpSession session) {
		Map<String, String> errors = new HashMap<String, String>();
		/**
		 * 1.校验登录名
		 */
		String loginname = formBuyer.getLoginname();
		if (loginname == null || loginname.trim().isEmpty()) {// 去掉空格之后还是为空
			errors.put("loginname", "用户名不能为空");
		} else if (loginname.length() < 3 || loginname.length() > 20) {
			errors.put("loginname", "用户名长度必须在3~20之间");
		} else if (!buyerService.ajaxValidateLoginname(loginname)) {
			errors.put("loginname", "用户名已被注册");
		}

		/**
		 * 2.校验登录密码
		 */
		String loginpass = formBuyer.getLoginpass();
		if (loginpass == null || loginpass.trim().isEmpty()) {// 去掉空格之后还是为空
			errors.put("loginpass", "密码不能为空");
		} else if (loginpass.length() < 3 || loginpass.length() > 20) {
			errors.put("loginpass", "密码长度必须在3~20之间");
		}

		/**
		 * 3.确认密码校验
		 */
		String reloginpass = formBuyer.getReloginpass();
		if (reloginpass == null || reloginpass.trim().isEmpty()) {// 去掉空格之后还是为空
			errors.put("reloginpass", "确认密码不能为空");
		} else if (!reloginpass.equals(loginpass)) {
			errors.put("reloginpass", "两次输入不一致");
		}

		/**
		 * 4.校验Email
		 */
		String email = formBuyer.getEmail();
		if (email == null || email.trim().isEmpty()) {// 去掉空格之后还是为空
			errors.put("email", "email不能为空");
		} else if (!buyerService.ajaxValidateEmail(email)) {
			errors.put("email", "email已被注册");
		} else if (!email
				.matches("^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\\.[a-zA-Z0-9_-]{2,3}){1,2})$")) {
			errors.put("email", "email格式错误");
		}
		
		/**
		 * 5.校验手机
		 */
		String phone = formBuyer.getPhone();
		if (phone == null || phone.trim().isEmpty()) {// 去掉空格之后还是为空
			errors.put("phone", "手机号码不能为空");
		} else if(phone.length() != 11){
			errors.put("phone", "手机号码必须为11位");
		}else if (!buyerService.ajaxValidatePhone(phone)) {
			errors.put("phone", "手机号码已被注册");
		} 
		
		/**
		 * 6.校验收货地址
		 */
		String address = formBuyer.getAddress();
		if (address == null || address.trim().isEmpty()) {// 去掉空格之后还是为空
			errors.put("address", "收货地址不能为空");
		}
		

		/**
		 * 7.校验验证码
		 */
		String verifyCode = formBuyer.getVerifyCode();
		String vcode = (String) session.getAttribute("vCode");
		if (verifyCode == null || verifyCode.trim().isEmpty()) {// 去掉空格之后还是为空
			errors.put("verifyCode", "验证码不能为空");
		} else if (!verifyCode.equalsIgnoreCase(vcode)) {
			errors.put("verifyCode", "验证码错误");
		}
		return errors;
	}
//	
//	/**
//	 * 激活功能
//	 * 
//	 * @param request
//	 * @param response
//	 * @return
//	 * @throws ServletException
//	 * @throws IOException
//	 */
//	public String activation(HttpServletRequest request,
//			HttpServletResponse response) throws ServletException, IOException {
//		/**
//		 * 1.获取参数激活码
//		 * 2.用激活码调用service方法完成激活
//		 * >service方法有可能抛出异常，把异常信息拿来，保存到request中，转发到msg.jsp显示
//		 * 3.保存成功信息到request，转发到msg.jsp
//		 * 
//		 */
//		String code = request.getParameter("activationCode");
//		try {
//			buyerService.activation(code);
//			request.setAttribute("code", "success");// 通知msg.jsp显示对
//			request.setAttribute("msg", "恭喜，激活成功");
//		} catch (BuyerException e) {
//			// 说明service抛出异常
//			request.setAttribute("msg", e.getMessage());
//			request.setAttribute("code", "error");// 通知msg.jsp显示错
//		}
//		return "/takeoutFood/jsp/msg.jsp";
//	}

	/**
	 * 修改密码
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String updatePassword(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		/*
		 * 1. 封装表单数据到buyer中 
		 * 2. 从session中获取bid 
		 * 3.使用bid和表单中的oldPass和newPass来调用service方法 
		 *  >如果出现异常，保存异常信息到request中，转发到pwd.jsp 
		 * 4. 保存成功信息到rquest中 
		 * 5. 转发到msg.jsp
		 */
		Buyer formBuyer = CommonUtils.toBean(req.getParameterMap(), Buyer.class);
		Buyer buyer = (Buyer) req.getSession().getAttribute("sessionBuyer");
		// 如果用户没有登录，返回到登录页面，显示错误信息
		if (buyer == null) {
			req.setAttribute("msg", "您还没有登录！");
			return "/jsp/buyer/login.jsp";
		}

		try {
			buyerService.updatePassword(buyer.getBid(),
					formBuyer.getNewpass(), formBuyer.getLoginpass());
			req.setAttribute("msg", "修改密码成功");
			req.setAttribute("code", "success");
			return "/jsp/buyer/editPw.jsp";
		} catch (BuyerException e) {
			req.setAttribute("msg", e.getMessage());// 保存异常信息到request
			req.setAttribute("buyer", formBuyer);// 为了回显
			return "/jsp/buyer/editPw.jsp";
		}
	}

	/**
	 * 退出功能
	 */
	public String quit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().removeAttribute("sessionBuyer");
		request.getSession().removeAttribute("sessionSeller");
		return "/jsp/main.jsp";
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
		/**
		 * 1.封装表单数据到Buyer 
		 * 2.校验表单数据
		 * 3.使用service查询，得到Buyer 
		 * 4.查看用户是否存在，如果不存在；
		 * *保存错误信息：用户名或密码错误 
		 * *保存用户数据：为了回显 
		 * *转发login.jsp 
		 * 5.如果存在，查看状态，如果状态为false：
		 * *保存错误信息：你没有激活 
		 * *保存用户数据：为了回显 
		 * *转发到login.jsp 
		 * 6.登录成功
		 * *保存当前查询出的buyer到session中 
		 * *保存当前用户的名称到cookie中，注意中文需要编码处理
		 */
		/**
		 * 1.封装表单数据到buyer
		 * 把Map转换成指定类型的Bean对象,
		 * 通常用来获取表单数据（request.getParameterMap()）封装到JavaBean中
		 */
		Buyer formBuyer = CommonUtils.toBean(request.getParameterMap(),
				Buyer.class);
		
		/**
		 * 2.校验，如果校验失败，保存错误信息，返回regist.jsp显示
		 */
		Map<String, String> errors = validateLogin(formBuyer,
				request.getSession());		
		if (errors.size() > 0) {			
			request.setAttribute("form", formBuyer);
			request.setAttribute("errors", errors);
			return "/jsp/buyer/login.jsp";
		}

		/**
		 * 3.调用userService#login()方法
		 */
		Buyer buyer = buyerService.login(formBuyer);
		/**
		 * 4.开始判断
		 */

		if (buyer == null) {
			request.setAttribute("msg", "用户名或密码错误！");
			request.setAttribute("buyer", formBuyer);
			return "/jsp/buyer/login.jsp";
		} else/* {
			if (!buyer.isStatus()) {
				request.setAttribute("msg", "用户尚未激活");
				request.setAttribute("buyer", formBuyer);
				return "/jsp/buyer/login.jsp";
			} else */{
				// 保存用户到session
				request.getSession().setAttribute("sessionBuyer", buyer);
//				System.out.println(buyer.getLoginname());
				// 获取用户名保存到cookie中
				String loginname = buyer.getLoginname();
				loginname = URLEncoder.encode(loginname, "utf-8");// cookie不能保存中文，故转换成utf-8编码格式
				Cookie cookie = new Cookie("loginname", loginname);
				cookie.setMaxAge(60 * 60 * 24 * 1);// 保存1天
				response.addCookie(cookie);
				return "/index.jsp";
			}
		}
	
	public String login1(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/**
		 * 1.封装表单数据到Buyer 
		 * 2.校验表单数据
		 * 3.使用service查询，得到Buyer 
		 * 4.查看用户是否存在，如果不存在；
		 * *保存错误信息：用户名或密码错误 
		 * *保存用户数据：为了回显 
		 * *转发login.jsp 
		 * 5.如果存在，查看状态，如果状态为false：
		 * *保存错误信息：你没有激活 
		 * *保存用户数据：为了回显 
		 * *转发到login.jsp 
		 * 6.登录成功
		 * *保存当前查询出的buyer到session中 
		 * *保存当前用户的名称到cookie中，注意中文需要编码处理
		 */

		/**
		 * 1.封装表单数据到buyer
		 */
		Buyer formBuyer = CommonUtils.toBean(request.getParameterMap(),
				Buyer.class);

		/**
		 * 2.校验，如果校验失败，保存错误信息，返回regist.jsp显示
		 */
		Map<String, String> errors = validateLogin(formBuyer,
				request.getSession());
		if (errors.size() > 0) {
			request.setAttribute("form", formBuyer);
			request.setAttribute("errors", errors);
			return "f:/jsp/buyer/login.jsp";
		}

		/**
		 * 3.调用userService#login()方法
		 */
		Buyer buyer = buyerService.login(formBuyer);
		/**
		 * 4.开始判断
		 */

		if (buyer == null) {
			request.setAttribute("msg", "用户名或密码错误！");
			request.setAttribute("buyer", formBuyer);
			return "f:/jsp/buyer/login.jsp";
		} else {
			if (!buyer.isStatus()) {
				request.setAttribute("msg", "用户尚未激活");
				request.setAttribute("buyer", formBuyer);
				return "f:/jsp/buyer/login.jsp";
			} else {
				// 保存用户到session
				request.getSession().setAttribute("sessionBuyer", buyer);
				// 获取用户名保存到cookie中
				String loginname = buyer.getLoginname();
				loginname = URLEncoder.encode(loginname, "utf-8");// cookie不能保存中文，故转换成utf-8编码格式
				Cookie cookie = new Cookie("loginname", loginname);
				cookie.setMaxAge(60 * 60 * 24 * 1);// 保存1天
				response.addCookie(cookie);
				return "f:/jsp/main1.jsp";
			}
		}

	}

	

	private Map<String, String> validateLogin(Buyer formBuyer, HttpSession session) {
		Map<String, String> errors = new HashMap<String, String>();
		return errors;
	}
}
