<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>搜索栏</title>
<style type="text/css">
body {
	margin-bottom: 0px;
	margin: 0 auto;
	color: #404040;
}

.ct{
	width: 1010px;
	height: 80px;
	margin: 0 auto;
	position: relative;
	
}
.logo{
	float: left;	
	width: 200px;
	height: 80px;	
}

input {
    width: 263px;
	height: 20px;
	border-style: solid;
	margin: 0px;
	padding: 5px;
	outline: none;
	color: #888;
	border-color: #AA0F7E;
	position: absolute;
	top: 30px;
	left: 331px;
}

.doSearch {
	display: block;
	background-color: #AA0F7E;	
	text-decoration: none;	
	color: #fff;
    width: 60px;
    height: 34px;
    text-align: center;
	font: 16px/30px "微软雅黑";
	position: absolute;
	top: 30px;
	left: 594px;
}


.logo,.divForm {
	float: left;
}
.shop{
	position: absolute;
    right: 0;
    top: 21px;
    background-color: #aa0f7e;
    border: 1px solid #d7b6b1;
    color: #fff;
    height: 25px;
    width: 100px;
    font: 14px/25px "微软雅黑";
    text-align: center;
    border-top-left-radius: 16px;
    border-bottom-left-radius: 16px;
    cursor: pointer;
}
.shop:hover{
	background-color:#ff1123;
	border-color:#e50112;
}
</style>
</head>
<body>
	<div class="ct">
		<img class="logo" src="<c:url value='/img/logo.jpg'/>" />
		<div class="divForm">
			<form action="<c:url value='/GoodsServlet'/>" method="get" target="_parent" id="form1">
				<input type="hidden" name="method" value="findByGname" />
				<input type="text" name="gname" placeholder="搜索美食......"/> 
				<input type="hidden" name="status" value="" />
				<span> 
					<a class="doSearch" href="javascript:document.getElementById('form1').submit();">搜索</a>	    			
				</span>
			</form>
		</div>
		<c:choose>
				<c:when test="${empty sessionScope.sessionBuyer }">
					<div></div>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${empty sessionScope.sessionBuyer.sid }">
							<div><a class="shop" href="<c:url value='/jsp/seller/regist.jsp'/>" target="_blank">我要开店</a></div>
						</c:when>
						<c:otherwise>
							<div><a class="shop" href="<c:url value='/SellerServlet?method=login'/>" target="_blank">进入我的店铺</a></div>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
		</c:choose>
	</div>
</body>
</html>