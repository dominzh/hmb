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

<script type="text/javascript"
	src="<c:url value='/jq/jquery-1.5.1.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/menu/mymenu.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/css/menu/mymenu.css'/>"
	type="text/css" media="all">
	<style type="text/css">
		.menuContent{
			background-color:#fff;
		}
	</style>
<script language="javascript">

var bar = new Q6MenuBar("bar");
$(function() {
	bar.colorStyle = 0;//指定配色样式
	bar.config.imgDir = "<c:url value='/img/'/>";//图片的路径
	bar.config.radioButton=true;//是否排斥，多个一级分类是否排斥


<c:forEach items="${parents}" var="parent">
  <c:forEach items="${parent.children}" var="child">
	bar.add("${parent.cname}", "${child.cname}", "/takeoutFood/seller/SellerGoodsServlet?method=findByCategoryBySeller&cid=${child.cid}&status", "body");
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
