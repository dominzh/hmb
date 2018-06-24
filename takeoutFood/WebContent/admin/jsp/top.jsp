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
.wm .logo{
	width:200px;
	height:80px;
}
.top{
	height: 40px;
	padding: 3px 0;
	
}
.baihuo{
	height:30px;
}
div span.title{
	position: absolute;
    top: 15px;
    left: 370px;
    font: 25px "微软雅黑";
    color: #000;
    font-weight: 900;
    box-shadow:5px 5px 5px #D8BFD8;
}
.top .exit{
	display:block;
	position: absolute;
    bottom: 0;
    right: 20px;
	text-decoration:none;
	color:#AA0F7E;
}
.top span,.top a{
	font:14px/30px "微软雅黑";
	/* color:#FFF; */
}
.admin{
	margin-top:3px;
	border-bottom:2px solid #d7b6b1;
	position:relative;
}
div.topBtn{
    height: 60px;
    position:relative;
}
div.btn{
	position:relative;
	border-bottom: 2px solid #AA0F7E;
    height: 43px;
}
.goodsBtn,.orderBtn,.addBtn,.searchBtn{
	display: block;
    background-color:#EEAEEE;    
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
			<span class="title">还没饱点餐平台后台管理</span> 
			<span>管理员：${sessionScope.admin.adminname }</span>
			<a target="_top" href="<c:url value='/AdminServlet?method=quit'/>" class="exit">退出</a>
		</div>
		<div class="topBtn">
			<div class="btn wm">
				<a class="goodsBtn" href="<c:url value='/admin/AdminCategoryServlet?method=findAll'/>" target="body">分类管理</a>
				<a class="goodsBtn" href="<c:url value='/admin/AdminSellerServlet?method=loginAll'/>" target="body">店铺管理</a>
			</div>
	</div>
	</div>
  </body>
</html>
