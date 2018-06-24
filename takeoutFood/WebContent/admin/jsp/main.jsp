<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>还没饱点餐平台后台管理主页</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

iframe {
	height: 100%;
	width: 100%;
}

div.top {
	height: 150px;
}

div.box {
	background-color: #EED2EE;
	height: 800px;
}

div.main {
	width: 1000px;
	margin: 0 auto;
	/* display:none; */
}
</style>
<script type="text/javascript"
	src="<c:url value='/jq/jquery-1.11.1.js'/>"></script>
<script type="text/javascript">

	$(document).ready(function() {
		var num = $(".num").val()*32;
		$(".box").css({"height":num+"px"});
	});
</script>
</head>

<body>

	<div class="top">
		<iframe frameborder="0" scrolling="no"
			src="<c:url value='/admin/jsp/top.jsp'/>" name="top"></iframe>
	</div>
	<div class="box iframeHeight">
		<div class="main">
			<iframe id="Iframe" frameborder="0" scrolling="no"
				src="<c:url value='/admin/AdminCategoryServlet?method=findAll'/>"name="body"> 
			</iframe>
		</div>
	</div>


</body>
</html>
