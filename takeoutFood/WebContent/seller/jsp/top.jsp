<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>top</title>
    <base target="body">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
*{
	margin:0;
	padding:0;
}
.wm{
	width:1000px;
	margin:0 auto;
	position:relative;
}

.top{
	padding: 3px 0;
    color: #fff;
}
.top .logo{
	width:200px;
	height:80px;
}
div span.title{
	position: absolute;
    bottom: 15px;
    left: 350px;
    font-size: 20px;
    color: #aa0f7e;
    font-weight: 900;
}
.top a{
	color:#FFF;
	display:block;
	position: absolute;
    bottom: 0;
    right: 20px;
	text-decoration:none;
}
.top span,.top a{
	font:14px/30px "微软雅黑";
	/* color:#FFF; */
}
.admin{
	margin-top:3px;
	position:relative;
	color:#aa0f7e;
	
}
div.topBtn{    
    height: 60px;
    
}
div.btn{
	position:relative;
	border-bottom: 2px solid #636363;
    height: 43px;
}
.goodsBtn,.orderBtn,.addBtn,.searchBtn{
	display: block;
    background-color: #aa0f7e;
    height: 30px;
    width: 119px;
    font: 14px/30px "微软雅黑";
    margin: 13px 0 0 10px;
    text-align: center;
    text-decoration: none;
    color: #fff;
    float: left;
    border-top-left-radius: 20px;
}
</style>
  </head>
  <body>
	<div class="top">
		<div class="wm">
			<img class="logo" src="<c:url value='/img/logo.jpg'/>" />
			<span class="title">${sessionScope.sessionSeller.loginname }</span> 
			<span class="admin">掌柜：${sessionScope.sessionSeller.name }</span>
		</div>
	</div>
	<div class="topBtn">
		<div class="btn wm">
			<a class="goodsBtn" href="<c:url value='/seller/jsp/dishes/main.jsp'/>" target="body">菜品管理</a>
			<a class="orderBtn" href="<c:url value='/seller/SellerOrderServlet?method=findAll'/>" target="body">订单管理</a>
			<a class="addBtn" href="<c:url value='/seller/SellerGoodsServlet?method=addPre'/>" target="body">添加菜品</a>
		</div>
	</div>
  </body>
</html>
