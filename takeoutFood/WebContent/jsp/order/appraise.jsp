<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>评价</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/order/appraise.css'/>" />
<script src="<c:url value='/jq/jquery-1.11.1.js'/>"></script>
<script>
	$(document).ready(function() {
		//prevAll前面所有的兄弟节点
		// $(this).text(wjx_sel).prevAll().text(wjx_sel);

		// $(this).nextAll().text(wjx_none);
		//当执行的jQuery 链式编程断掉的时候，如果能把链再链上就好了。

		//end()可以结束当前调用的链。 恢复上一级的调用链。
		$(".comment li").mouseenter(function() {
			$(this).css("color", "#aa0f7e").prevAll().css("color", "#aa0f7e");
		}).end();

		//第二步： 记录一下用户点击的那个五角星
		//给点击的li标签添加一个样式类				
		$(".comment li").on("click", function() {
			$(this).addClass("clickevent").siblings().removeClass("clickevent");
			$(".textScore").val($(this).val());
		});
		//鼠标移开的时候，先给所有的li标签添加一个空心的 五角星
		$(".comment").on("mouseout", function() {
			$(this).children("li").css("color", "#ccc");

			//第三步： 当鼠标移开评分控件的时候，把click（包括自己）之前的五角星全部变成实心的，后面的变成空心。
			$(".clickevent").css("color", "#aa0f7e").prevAll().css("color", "#aa0f7e").end().nextAll().css("color", "#ccc");
		});

	});
</script>
  </head>
  
  <body>
   <div class="top">
  	<div class="wa">
  		<img class="logo" src="<c:url value='/img/logo.jpg'/>" />
  		<a href="javascript:history.go(-1);" >返回</a>
  	</div>
  </div>
   	<div class="wa bigBox">
   		<div class="content">
   			<form action="/takeoutFood/OrderServlet" method="post">
   			  	<h4>请输入本次订餐的评价</h4> 
   				<input name="method" type="hidden" value="appraise" />
   				<input type="hidden" name="shopname" value="${param.shopname }"/>
   				<input type="hidden" name="score"  value="" class="textScore">
	   			<input type="hidden" name="orderItemId" value="${param.orderItemId }"/>
	   			<input type="hidden" name="gname" value="${param.gname }"/>
	   			<img class="img" alt="" src="<c:url value='/${param.goodsimg }'/>" > 
	   			<div  class="spanFist">${param.gname }</div>
	   			<textarea name="appraise" class="text"></textarea>
	   			<div class="score">
	   				<span class="spanSecond">综合评分：</span>
	   				<ul class="comment">
						<li value="-5">★</li>
						<li value="-2">★</li>
						<li value="0">★</li>
						<li value="2">★</li>
						<li value="5">★</li>
					</ul>
	   			</div>
	   			
	   			<input type="submit" class="btn" value="提交"/>
   			</form>
   		</div>
   	</div>
  </body>
</html>
