<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="">
<title>body</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/body_slider.css'/>">
<script type="text/javascript"
	src="<c:url value='/js/body/animate.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/body/slider.js'/>"></script>
</head>
<body>
	<div class="ct-slider" id="js_slider">
		<div class="slider">
			<div class="slider-main" id="slider_main_block">
				<div class="slider-main-img">
					<a href="#"><img src="<c:url value='/img/1.jpg'/>" /></a>
				</div>
				<div class="slider-main-img">
					<a href="#"><img src="<c:url value='/img/2.jpg'/>" alt="" /></a>
				</div>
				<div class="slider-main-img">
					<a href="#"><img src="<c:url value='/img/3.jpg'/>" alt="" /></a>
				</div>
				<div class="slider-main-img">
					<a href="#"><img src="<c:url value='/img/4.jpg'/>" alt="" /></a>
				</div>
			</div>
		</div>
		<div class="slider-ctrl" id="slider_ctrl">
			<span class="slider-ctrl-prev"></span> 
			<span class="slider-ctrl-next"></span>
		</div>
	</div>
</body>
</html>
