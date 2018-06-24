<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>商家登录页面</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/buyer/login.css' />">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/footer.css' />">
<script type="text/javascript"
	src="<c:url value='/jq/jquery-1.5.1.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/buyer/login.js'/>"></script>
<script type="text/javascript">
$(function() {/*Map<String(Cookie名称),Cookie(Cookie本身)>*/
	// 获取cookie中的用户名
	var loginname = window.decodeURI("${cookie.loginname.value}");
	if("${requestScope.buyer.loginname}") {
		loginname = "${requestScope.buyer.loginname}";
	}
	$("#loginname").val(loginname);
});
</script>
</head>
<body>
<div class="header">
		<img src="<c:url value='/img/logo.jpg' />"/>
		<span>欢迎登录</span>
</div>
<div class="login1">
	<div class="login2">
		<div class="login">
		<div id="tm">
			<form target="_top" action="<c:url value='/BuyerServlet?method=login1'/>" method="post" id="loginForm">
				<!--<input type="hidden" name="method" value="login" />  -->				
				<div class="log-title"><span>商家登录</span></div>
				<label class="error" id="msg">${msg}</label>
				<div class="log-ct">
					<div class="user">
						<label for="loginname">
							<img  src="<c:url value='/img/user.jpg' />">
						</label>
						<input type="text" name="loginname" id="loginname" class="input">
						<label id="loginnameError" class="error"></label>
					</div>
					<div class="pass">
							<label for="loginpass"><img src="<c:url value='/img/pass.jpg' />"  /></label> 
							<input id="loginpass" name="loginpass" type="password" class="input" value="${buyer.loginpass }" />
							<label id="loginpassError" class="error"></label>
					</div>
					<div class="verifyCode">
							 <input class="input yzm" type="text" name="verifyCode" id="verifyCode" value="${user.verifyCode }"/>
							 <img id="imgVerifyCode" src="<c:url value='/VerifyCodeServlet'/>"/>
                       	 	 <a href="javascript:_hyz()"  id="verifyCode">换张图</a>
							<label id="verifyCodeError" class="error"></label>
					</div>
					<input type="submit" name="" value="登&nbsp;&nbsp;录" id="submit"  class="loginBtn">
				</div>
				<div class="log-ft">
						<a href="<c:url value='/jsp/buyer/register.jsp'/>" class="registBtn">立即注册</a>
				</div>
			</form>
		</div>
	</div>
	</div>
</div>
<%@ include file="/jsp/footer.jsp"%>
</body>
</html>