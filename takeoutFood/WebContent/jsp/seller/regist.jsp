<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page contentType="text/html;charSet=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="<c:url value='/css/footer.css' />">
<link rel="stylesheet" type="text/css" href="<c:url value='/jsp/seller/regist.css' />">

<script type="text/javascript"
	src="<c:url value='/jq/jquery-1.5.1.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/jsp/seller/regist.js'/>"></script>

</head>

<body>

<div class="header w">
	<img src="<c:url value='/img/logo.jpg' />" /> <span>欢迎开店</span> 
		<span class="s_right">
	</span>
</div>
<!--中间-->
		<div id="divBody">
			<form action="<c:url value='/SellerServlet'/>"  method="post" id="registForm">
				<input type="hidden" name="method" value="regist"/>  
				<div class="user">
					<label for="loginname" >店铺名：<img src="<c:url value='/img/user.jpg' />" /></label> 
					<input class="inputClass" type="text"
							name="loginname" id="loginname" value="${form.loginname }"  />
					<label class="errorClass"
							id="loginnameError">${errors.loginname }</label>					
				</div>
				<div class="name">
					<label for="name">真实姓名：<img src="<c:url value='/img/pass.jpg' />" /></label> 
					<input class="inputClass" id="name" name="name" type="text" value="${form.name }" />
					<label class="errorClass" id="nameError">${errors.name}</label>
				</div>
				<div class="id_card">
					<label for="id_card">身份证号：<img src="<c:url value='/img/pass.jpg' />" /></label> 
					<input class="inputClass" id="id_card" name="id_card" type="text" value="${form.id_card }" />
					<label class="errorClass" id="id_cardError">${errors.id_card}</label>
				</div>
				
				<div class="submit">
					<input type="image"
							src="<c:url value='/img/regist1.jpg'/>" id="submitBtn" />
				</div>
			</form>
		</div>

</body>
</html>
