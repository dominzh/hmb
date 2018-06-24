<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%--访问者无法脱机浏览页面 --%>
<meta http-equiv="pragma" content="no-cache">
<%--清除缓存--%>
<meta http-equiv="cache-control" content="no-cache">
<%--设置一个网页的到期时间--%>
<meta http-equiv="expires" content="0">
<%--关键字--%>
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<%--描述--%>
<meta http-equiv="description" content="This is my page">
<%--设定页面的字符集--%>
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css'/>">

<script type="text/javascript" 	src="<c:url value='/jq/jquery-1.5.1.js'/>"></script>
<title>还没饱首页</title>
</head>
<body>
	<!-- 头部导航 -->	
	<div class="navtop">
	<div class="divTop">
		<iframe frameborder="0" scrolling="no" src="<c:url value='/jsp/top.jsp'/>" name="top" width="1366" height="30"></iframe>
	</div>
	</div>
	<!--搜索框  -->
	<div class="divSearch">
		<iframe frameborder="0" scrolling="no" src="<c:url value='/jsp/search1.jsp'/>" name="search" width="1066" height="80"></iframe>
	</div>
	<div class="bg">
		<div class="divCenter ct">
		<!--轮播图 -->
			<div class="divCenterBox">
				<iframe  frameborder="0" scrolling="no"
					src="<c:url value='/jsp/body.jsp'/>" width="1066" height="450"></iframe>
			</div>
		</div>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>
