<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>百货-修改密码</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/footer.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/buyer/editPw.css' />">

<script type="text/javascript"
	src="<c:url value='/jq/jquery-1.11.1.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/js/buyer/editPw.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		function changeFrameHeight() {
			var ifms = document.getElementsByTagName("iframe");
			for(var i=0; i<ifms.length; i++){
				ifms.height = document.documentElement.clientHeight;
			}
		}
		window.onresize = function() {
			changeFrameHeight();
		};
	
		if(typeof $("#msg").val() != 'undefined' && $("#msg").val()!=null && $("#msg").val()!=""){
			alert($("#msg").val());
		}
		
	});
</script>
  </head>
  
  <body>
  	<input type="hidden" value="${msg }" id="msg"/>
    <!--头部导航  -->
  	<div class="top ">
		<div class="divTop">
			<iframe frameborder="0" scrolling="no"
				src="<c:url value='/jsp/top.jsp'/>" name="top"></iframe>
		</div>
	</div>
	<div class="pwBox wp">
		<div class="">
			<img class="logo" src="<c:url value='/img/logo.jpg'/>" />
			<span class="pw">修改密码</span> 
		</div>
	</div>
	 <!--表单-->
	<div class="wp form">
			<div class="fromBox">
				<form id="editPwForm" action="<c:url value='/BuyerServlet'/>" method="post" target="_top">
					<input type="hidden" name="method" value="updatePassword"/>
					<div class="divbox loginpass">
						<span>原密码:</span>
						<input class="input" type="password" name="loginpass" id="loginpass" value="${user.loginpass }"/>
						<label id="loginpassError" class="errorClass">${msg }</label>
					</div>
					<div class="divbox newpass">
						<span>新密码:</span>
						<input class="input" type="password" name="newpass" id="newpass" value="${user.newpass }"/>
						<label id="newpassError" class="errorClass"></label>
					</div>
					<div class="divbox reloginpass">
						<span>确认密码:</span>
						<input class="input" type="password" name="reloginpass" id="reloginpass" value="${user.reloginpass }""/>
						<label id="reloginpassError" class="errorClass"></label>
					</div>
					<div class="divbox vCode">
						   <img id="imgVerifyCode" src="<c:url value='/VerifyCodeServlet'/>" border="1"/>
				    	  <a href="javascript:_hyz()">看不清，换一张</a>

					</div>
					<div class="divbox verifyCode">
						<span>验证码:</span>
						 	<input class="input" type="text" name="verifyCode" id="verifyCode" value="${user.verifyCode }"/>
							<label id="verifyCodeError" class="errorClass"></label>
					</div>
					<div class="divbox submit">
						<input id="submit" type="submit" value="修改密码"/>
						<input class="reset" type="reset" value="重置"/>
					</div>
			</form>
		</div>
	</div>
<%@ include file="/jsp/footer.jsp"%>
