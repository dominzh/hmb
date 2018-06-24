<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>left</title>
<base target="body" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<script type="text/javascript"
	src="<c:url value='/jq/jquery-1.11.1.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/menu/mymenu.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/css/menu/mymenu.css'/>"
	type="text/css" media="all">
<script language="javascript">
	var bar = new Q6MenuBar("bar", "");
	$(function() {
		bar.colorStyle = 1;
		bar.config.imgDir = "<c:url value='/img/'/>";
		bar.config.radioButton = true;

		<c:forEach items="${parents}" var="parent">
		<c:forEach items="${parent.children}" var="child">
		bar.add("${parent.cname}", "${child.cname}",
				"/takeoutFood/GoodsServlet?method=findByCategory&cid=${child.cid}&status",
				"body");
		</c:forEach>
		</c:forEach>

		$("#menu").html(bar.toString());		
		bar.showoload($(".menuContent")[0]);//初始状态显示第一列菜单
	});
</script>
</head>

<body>
	<div id="menu"></div>
</body>
</html>
