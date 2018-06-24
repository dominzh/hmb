<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>注册页面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/footer.css' />">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/buyer/register.css' />">
<script type="text/javascript"
	src="<c:url value='/jq/jquery-1.5.1.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/js/buyer/register.js'/>"></script>
<script type="text/javascript">
	var email = document.getElementById('email');
	var emailError = document.getElementsByClassName('emailError');
	function email(){
		var arr = email.value.split("");			
		for(var i = 0; i<arr.length; i++)
			if(arr[i]  == "@"){	
				emailError.innerText = "";			
				return true;
			}
			emailError.innerText="请输入正确格式";
		}	
</script>

</head>

<body>
<div class="header tp">
	<img src="<c:url value='/img/logo.jpg' />" /> <span>欢迎注册</span> 
		<span class="back">
		<a href="<c:url value='/jsp/buyer/login.jsp'/>" >返回登录界面</a>
	</span>
</div>
<!--中间-->
<div id="container">
			<form action="<c:url value='/BuyerServlet?method=regist'/>"  method="post" id="registForm" name="form1">
				<input type="hidden" name="method" value="regist"/>  
				<div class="user">
					<label for="loginname" >用户名：<img src="<c:url value='/img/user.jpg' />" /></label> 
					<input class="inputClass" type="text"
							name="loginname" id="loginname" value="" onblur='validateLoginname()' />
					<label class="errorClass"
							id="loginnameError"></label>					
				</div>
				<div class="pass">
					<label for="loginpass">密码：<img src="<c:url value='/img/pass.jpg' />" /></label> 
					<input class="inputClass" type="password"
							name="loginpass" id="loginpass" value="" onblur='validatePass()'/>
					<label class="errorClass" id="loginpassError"></label>
				</div>
				<div class="repass">
					<label for="reloginpass">确认密码：<img src="<c:url value='/img/pass.jpg' />" /></label> 
					<input class="inputClass" type="password"
							name="reloginpass" id="reloginpass" value="" onblur='confirmPass()' />
					<label class="errorClass" id="reloginpassError"></label>
				</div>
				<div class="Email">
					<label for="email">Email：<img class="big" src="<c:url value='/img/email.jpg' />" /></label> 
					<input class="inputClass" type="text" name="email"
							id="email" value="" id="email" onblur='checkEmail()'/>
					<label class="errorClass" id="emailError"></label>
				</div>
				<div class="phone">
					<label for="phone">手机号码：<img class="big" src="<c:url value='/img/phone.jpg' />" /></label> 
					<input class="inputClass" id="phone" name="phone" type="text" value="" onblur='validatePhone()' />
					<label class="errorClass" id="phoneError"></label>
				</div>
				<div class="address">
					<label for="address">地址：<img class="big" src="<c:url value='/img/address.jpg' />" /></label> 
					<input class="inputClass" id="address" name="address" type="text" value="" onblur='validateAddress()'/>
					<label class="errorClass" id="addressError"></label>
				</div>
				<div class="verifyCode">
					<label for="verifyCode">验证码：</label> 
					<input class="inputClass" type="text" name="verifyCode"
							id="verifyCode" value="" />
					<label class="errorClass" id="verifyCodeError"></label>
				</div>
				<div id="divVerifyCode">
					<img id="imgVerifyCode"
									src="<c:url value='/VerifyCodeServlet'/>" />
					<label id="changeVerifyCode"><a href="javascript:_hyz()">换一张</a></label>
				</div>
				<div class="submit">
					<input type="image"
							src="<c:url value='/img/regist1.jpg'/>" id="submitBtn" />
				</div>
			</form>
		</div>
<%@ include file="/jsp/footer.jsp"%>
</body>
</html>