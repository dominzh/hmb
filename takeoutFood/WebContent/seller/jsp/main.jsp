<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>main.jsp</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
<style type="text/css">
*{
	margin:0;
	padding:0;
}
div.top{
	height:150px;
	
}
iframe{
	height:100%;
	width:100%;
}
div.box{
	
	background-color:#EED2EE;
	height:796px;
}
div.main{
	width:1000px;
	margin:0 auto;
}
</style>
 <script type="text/javascript"
	src="<c:url value='/jq/jquery-1.5.1.js'/>"></script>
 <script type="text/javascript">
	$(document).ready(function() {
		function changeFrameHeight() {
			var ifms = document.getElementsByTagName("iframe");
			for(var i=0; i<ifms.length; i++){
				ifms.height = document.documentElement.clientHeight;
			}
		}
		window.onresize = function() {
			changeFrameHeight();
		};
	});
</script>
  </head>
 
  <body>
	<div class="top">
		<iframe frameborder="0" scrolling="no" src="<c:url value='/seller/jsp/top.jsp'/>" name="top"></iframe>
	</div>
	<div class="box">
		<div class="main">
			<iframe frameborder="0" scrolling="no" src="<c:url value='/seller/jsp/dishes/main.jsp'/>" name="body"></iframe>
  		</div>
  	</div>
  </body>
</html>
