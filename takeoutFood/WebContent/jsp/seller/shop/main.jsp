<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>book_main.jsp</title>

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
.top {
	border-bottom: 2px solid #d7b6b1;
	padding-bottom: 5px;
	height: 87px;
}
.logo{
	width:200px;
	height:80px;
}
.wss {
	width: 1000px;
	margin: 0 auto;
}

.top #title {
	display: block;
	font: 18px/86px "微软雅黑";
	color: #000;	
	position: relative;
	top: -63px;
	left: 200px;
	width: 199px;
	height: 60px;
	
	border-bottom: 0;
	border-top: 0;
	border-right: 0;
	padding-left: 16px;
}

.top #back {
	display: block;
	position: relative;
	top: -80px;
	left: 850px;
	width: 100px;
	text-align: center;
	text-decoration: none;
	font: 14px/14px "微软雅黑";
}
.bigBox {
	position: relative;
}

.menue {
	position: relative;
	height: 69px;
	width: 1000px;
	margin: 0 auto;
}

.center {
	position: relative;
	height: 708px;
}
</style>
</head>
<script type="text/javascript"
	src="<c:url value='/jq/jquery-1.5.1.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		 $(window).scroll(function () {
	            var scrollTop = $(document).scrollTop();
				if(scrollTop>97){
					 $(".menue").css(
					 {"position":"fixed",
					 "top":"0",
					 "z-index":"55",
					  "left":"50%",
					 "margin-left":"-500px"});
					 
				}else{
					$(".menue").css(
					{"position":"relative",
					"top":"0",
					 "left":"50%",
					 "margin-left":"-500px"});
				}
	           
	        }); 
	}); 
	$(function() {
			/* alert($("#shopnameTitle").val()); */
			$("#title").text("${shopname  }" + "欢迎您");
		});
</script>
<body>
	<div class="bigBox">
		<div class="top">
			<div class="wss">
				<img class="logo" src="<c:url value='/img/logo.jpg'/>" /> <a
					id="title"></a> <a id="back" href="/takeoutFood/index.jsp"
					target="_parent">返回还没饱首页</a>
			</div>
		</div>
		<div class="menue">
			<iframe frameborder="0" scrolling="no"
				src="<c:url value='/CategoryServlet?method=findAll2&shopname=${shopname }'/>"
				name="left"></iframe>
		</div>
		<div class="center">
			<iframe frameborder="0" scrolling="no"
				src="<c:url value='/GoodsServlet?method=findAllGoodsByShopname&shopname=${shopname }&status'/>"
				name="body"></iframe>
		</div>
	</div>
</body>
</html>
