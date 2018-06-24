<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>My JSP 'left.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript"
	src="<c:url value='/jq/jquery-1.5.1.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/menu/mymenu.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/css/menu/mymenu.css'/>"
	type="text/css" media="all">
<style type="text/css">
.menuContent {
	background-color: #fff;
}


</style>
<script language="javascript">
	/*
	 * 1. 对象名必须与第一个参数相同！
	 2. 第二个参数是显示在菜单上的大标题
	 */
	var bar = new Q6MenuBar("bar", "百货商品");
	$(function() {
		bar.colorStyle = 1;//指定配色样式
		bar.config.imgDir = "<c:url value='/img/'/>";//小工具所需图片的路径
		bar.config.radioButton = true;//是否排斥，多个一级分类是否排斥

		<c:forEach items="${parents}" var="parent">
		<c:forEach items="${parent.children}" var="child">
		bar.add(
						"${parent.cname}",
						"${child.cname}",
						"/takeoutFood/GoodsServlet?method=findByCategoryByShopname&cid=${child.cid}&shopname=${shopname}&status",
						"body");
		</c:forEach>
		</c:forEach>

		$("#menu").html(bar.toString());
		bar.showoload($(".menuContent")[0]);

	});
</script>
</head>

<body onload="load()">

	<div id="menu"></div>
</body>
</html>
