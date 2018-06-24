<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%--设定页面的字符集--%>
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<title>主页导航栏</title>
<style>
* {
	margin: 0;
	padding: 0;
}

a {
	color: #fff;
	text-decoration: none;
}

span {
	float: left;
	color: #EAEAEA;
}

.center {
	background: #D1D1D1;
	opacity: 0.9;
}

.ct {
	width: 1066px;
	margin: 0 auto;
	position: relative;
}

.center ul {
	height: 30px;
	line-height: 30px;
	color: #fff;
	list-style: none;
	padding-left: 30px;
}

.center li {
	float: left;
	padding: 0px 10px;
	font: 14px/30px "微软雅黑";
}

.center .li_2 {
	float: right;
}

.center a:hover {
	color: #ef0516;
}

.center li#first {
	padding-right: 60px;
}

.center li#two {
	padding: 0 60px 0 60px;
}

.center li.three {
	padding-left: 60px;
}
</style>
</head>
<body>
	<%-- 根据用户是否登录，显示不同的链接 --%>
	<div class="center">
		<ul class="ct">
			<c:choose>
				<c:when test="${empty sessionScope.sessionBuyer }">
					<%--判断是否有用户正在登录中，如果是空的，则执行第一条when语句 --%>
					<li id="first"><a href="<c:url value='/jsp/buyer/login.jsp'/>"
						target="_parent">顾客登录</a></li>
					<span>|</span>
					<li id="two"><a href="<c:url value='/jsp/seller/login.jsp'/>"
						target="_parent">商家登录</a></li>
					<span>|</span>
					<li class="three"><a href="<c:url value='/jsp/buyer/register.jsp'/>" target="_parent">免费注册</a></li>

				</c:when>
				<c:otherwise>
					<li id="first">欢迎您，${sessionScope.sessionBuyer.loginname }</li>
					<li id="first"><a href="/takeoutFood/index.jsp"
						target="_parent">首页</a></li>
					<li class="li_2"><a
						href="<c:url value='/BuyerServlet?method=quit'/>" target="_parent">退出</a></li>
					<span class="li_2">|</span>
					<li class="li_2"><a
						href="<c:url value='/jsp/buyer/editPw.jsp'/>" target="_parent">修改密码</a></li>
					<span class="li_2">|</span>
					<li class="li_2"><a
						href="<c:url value='/OrderServlet?method=myOrders'/>"
						target="_parent">我的订单</a></li>
					<span class="li_2">|</span>
					<%-- <li class="li_2"><a href="javascript:;" onClick="window.open('<c:url value="/CartItemServlet?method=myCart"/>')">我的购物车</a></li> --%>
					<li class="li_2"><a
						href="<c:url value='/CartItemServlet?method=myCart'/>"
						target="_top">我的购物车</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</body>
</html>