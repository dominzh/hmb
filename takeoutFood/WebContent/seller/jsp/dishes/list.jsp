<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">

<link rel="stylesheet" type="text/css" href="<c:url value='/seller/css/list.css'/>">
<script type="text/javascript" src="<c:url value='/jq/jquery-1.5.1.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/pager/pager.css'/>" />
<script type="text/javascript" src="<c:url value='/js/pager/pager.js'/>"></script>

<script type="text/javascript" src="<c:url value='/seller/js/list.js'/>"></script>
  </head>
  
  <body>
  <c:choose>
	<c:when test="${empty pb.beanList }">	
	<div class="emptyList">
		<span class="spanEmpty">店家正在准备新品，请等待~~~
		</span>
	</div>

</c:when>
	<c:otherwise>
  
  
<div class="divGoods">
<div class="sort">
	<c:if test="${a eq 1 }">
		<a href="<c:url value='/seller/SellerGoodsServlet?method=findAllGoodsBySeller&status=3'/>" target="body" >评价从高到低</a>
		<a href="<c:url value='/seller/SellerGoodsServlet?method=findAllGoodsBySeller&status=2'/>" target="body">价格从低到高</a>
		<a href="<c:url value='/seller/SellerGoodsServlet?method=findAllGoodsBySeller&status=1'/>" target="body">价格从高到低</a>
	</c:if>
	<c:if test="${a eq 2 }">
		<a href="<c:url value='/seller/SellerGoodsServlet?method=findByCategoryBySeller&status=3&cid=${cid }'/>" target="body" >评价从高到低</a>
		<a href="<c:url value='/seller/SellerGoodsServlet?method=findByCategoryBySeller&status=2&cid=${cid }'/>" target="body">价格从低到高</a>
		<a href="<c:url value='/seller/SellerGoodsServlet?method=findByCategoryBySeller&status=1&cid=${cid }'/>" target="body">价格从高到低</a>
	</c:if>
</div>
<ul>
<c:forEach items="${pb.beanList }" var="goods">
 <li>
  <div class="inner">
    <a class="pic" href="<c:url value='/seller/SellerGoodsServlet?method=load&gid=${goods.gid }'/>" target="body"><img src="<c:url value='/${goods.image_s }'/>" border="0"/></a>
    <p class="price" >
		<span class="price_n">&yen;${goods.price } </span>
	</p>	
	<p><a id="goodsname" title="${goods.gname }" href="<c:url value='/seller/SellerGoodsServlet?method=load&gid=${goods.gid }'/>" target="body">${goods.gname }</a></p>
	<p class="place">
		<span>产地：</span>${goods.place }
	</p>
	<p class="score">
		<span>评分：</span>${goods.score }
	</p>
  </div>
 </li>
</c:forEach>


 


</ul>
</div>
<div class="pagerBox">
		<div class="pager">
			<%@include file="/jsp/pager/pager.jsp" %>
		</div>
</div>
	</c:otherwise>
</c:choose>
  </body>
 
</html>

