<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>goods_main.jsp</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style type="text/css">
* {
	border: 0;
	margin: 0;
}

iframe {
	height: 100%;
	width: 100%;
}

.bigBox {
	position: relative;
}

.left {
	position: relative;
	height: 68px;
	width: 1000px;
	margin: 0 auto;
}

.right {
	position: relative;
	top: 16px;
	height: 710px;
	width: 1000px;
}

div.top {
	height: 96px;
}
.center .li_2 {
	float: right;
}
.center li {
	float: left;
	padding: 0px 10px;
	font: 14px/30px "微软雅黑";
}
</style>
</head>

<body>
	<div class="bigBox">
		<div class="left">
			<iframe frameborder="0" scrolling="no"
				src="<c:url value='/seller/SellerGoodsServlet?method=findCategoryAll'/>"
				name="left"></iframe>
		</div>
		<div class="right">
			<iframe frameborder="0" scrolling="no"
				src="<c:url value='/seller/SellerGoodsServlet?method=findAllGoodsBySeller&status'/>"
				name="body"></iframe>
		</div>
	</div>
</body>
</html>
