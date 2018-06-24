<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>菜单列表</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/dishes/list.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/pager/pager.css'/>" />
<script type="text/javascript"
	src="<c:url value='/jq/jquery-1.11.1.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/js/dishes/list.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$(".sort a").on("click",function(){
			$(this).addClass("onclick").siblings().removeClass("onclick");
		});
	});
</script>
</head>

<body>

<c:if test="${title eq 1}">
<div class="top">
  	<div class="w">
  		<img class="logo" src="<c:url value='/img/logo.jpg'/>" />
  		<a href="/takeoutFood/index.jsp" >返回首页</a>
  	</div>
</div>
</c:if>
<c:choose>
		<c:when test="${empty pb.beanList }">
			<div class="emptyList w">
				<span class="spanEmpty">紧急备货上架中。。。 </span>
			</div>

		</c:when>
<c:otherwise>
<!-- GoodsServlet/findAllGoods/
		req.setAttribute("pb", pb);
		req.setAttribute("a", "1"); -->
<div class="w wg">
	<div class="sort">
	<c:if test="${a eq 1 }">
		<a href="<c:url value='/GoodsServlet?method=findAllGoods&status=3'/>" target="body" >评价从高到低</a>
		<a href="<c:url value='/GoodsServlet?method=findAllGoods&status=2'/>" target="body">价格从低到高</a>
		<a href="<c:url value='/GoodsServlet?method=findAllGoods&status=1'/>" target="body">价格从高到低</a>
	</c:if>
	<c:if test="${a eq 2 }">
		<a href="<c:url value='/GoodsServlet?method=findByCategory&status=3&cid=${cid }'/>" target="body" >评价从高到低</a>
		<a href="<c:url value='/GoodsServlet?method=findByCategory&status=2&cid=${cid }'/>" target="body">价格从低到高</a>
		<a href="<c:url value='/GoodsServlet?method=findByCategory&status=1&cid=${cid }'/>" target="body">价格从高到低</a>
	</c:if>
	<c:if test="${a eq 3 }">
		<a href="<c:url value='/GoodsServlet?method=findByGname&status=3&gname=${gname }'/>" target="body" >评价从高到低</a>
		<a href="<c:url value='/GoodsServlet?method=findByGname&status=2&gname=${gname }'/>" target="body">价格从低到高</a>
		<a href="<c:url value='/GoodsServlet?method=findByGname&status=1&gname=${gname }'/>" target="body">价格从高到低</a>
	</c:if>
	
	<c:if test="${a eq 4 }">
		<a href="<c:url value='/GoodsServlet?method=findByCombination&status=3&gname=${gname }&place=${place }&shopname=${shopname }'/>" target="body" >评价从高到低</a>
		<a href="<c:url value='/GoodsServlet?method=findByCombination&status=2&gname=${gname }&place=${place }&shopname=${shopname }'/>" target="body">价格从低到高</a>
		<a href="<c:url value='/GoodsServlet?method=findByCombination&status=1&gname=${gname }&place=${place }&shopname=${shopname }'/>" target="body">价格从高到低</a>
	</c:if>
	</div>
	<ul>
		<c:forEach items="${pb.beanList }" var="goods">
			<li>
				<div class="inner">
					<a class="pic"
						href="<c:url value='/GoodsServlet?method=load&gid=${goods.gid }'/>" target="_parent"><img
						src="<c:url value='/${goods.image_s }'/>" border="0" /></a>
					<p class="price">
						<span class="price_n">&yen;${goods.price }</span>
					</p>
					<p>
						<a id="goodsname" title="${goods.gname }"
							href="<c:url value='/GoodsServlet?method=load&gid=${goods.gid }'/>" target="_parent">${goods.gname }</a>
					</p>
					<p class="publishing">
						<span>店铺：</span><a
							href="<c:url value='/GoodsServlet?method=findByShop&shopname=${goods.shopname }'/>" target="_parent">${goods.shopname  }</a>
					</p>
					
				</div>
			</li>
		</c:forEach>
	</ul>
</div>
<div class="pager" >
	<%@include file="/jsp/pager/pager.jsp"%>
</div>
</c:otherwise>
</c:choose>
</body>
</html>

	