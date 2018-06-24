<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>订单列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/order/list.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/pager/pager.css'/>" />
    <script type="text/javascript" src="<c:url value='/js/pager/pager.js'/>"></script>
    <script type="text/javascript"
	src="<c:url value='/jq/jquery-1.11.1.js'/>"></script>
  <script type="text/javascript">
  	$(document).ready(function(){
		if(typeof $("#msg").val() != 'undefined' && $("#msg").val()!=null && $("#msg").val()!=""){
			alert($("#msg").val());
		}
	}); 
	 
  </script>
  </head>
 
  <body>
   <input type="hidden" value="${msg }" id="msg"/> 
   <!--头部导航  -->
  	<div class="top ">
		<div class="divTop">
			<iframe frameborder="0" scrolling="no"
				src="<c:url value='/jsp/top.jsp'/>" name="top"></iframe>
		</div>
	</div>
	<div class="orderBox wo">
		<div class="">
			<img class="logo" src="<c:url value='/img/logo.jpg'/>" />
			<span class="order">订单详情</span> 
		</div>
	</div>
 <c:choose>
	<c:when test="${empty pb.beanList }">	
	<div class="wo ordertList">
		<img align="center" src="<c:url value='/img/emptycart.png'/>" /> 
		<span class="spanEmpty">您当前没有订单记录哦~
		</span>
		<a href="<c:url value='/index.jsp'/>">去购物>></a>
	</div> 
	
</c:when>
	<c:otherwise>
	 <!--订单导航  -->
	<div class="wo">
		<div class="orderTitle">
			<div class="goodsMgs">商品信息${msg }</div>
			<div class="shop">店铺</div>
			<div class="price">单价</div>
			<div class="num">数量</div>
			<div class="totalPrice">总价</div>
			<div class="state">订单状态</div>
			<div class="operation">操作</div>
		</div>
	</div>
	<!--商品详情  -->
<c:forEach items="${pb.beanList }" var="order">
		<div class="wo">
		
		<div class="orderList">
			<div class="orderId">
				<span>订单号：${order.oid}
</span>&nbsp;&nbsp;&nbsp;&nbsp;
				<span>下单时间：${order.ordertime }</span>
			</div>
		<c:forEach items = "${order.orderItemList }" var="orderItem"> 
			<div class="centerBox">
				<div class="boxLeft">
					<div class="goodsMgs">
						<a><img class="goodsImg" align="center" src="<c:url value='/${orderItem.goods.image_s }'/>"/></a>
						<span class="goodsSpan">${orderItem.goods.gname }</span>
					</div>
				</div>
				<div class="boxRight">
					<div class="shop">${orderItem.goods.shopname }</div>
					<div class="price">&yen;${orderItem.goods.price }</div>
					<div class="num">${orderItem.quantity }</div>
					<div class="totalPrice_t">&yen;${orderItem.subtotal }</div>
					
					<div class="state">
						<c:choose>
							<c:when test="${orderItem.status eq 1 }">(待付款)</c:when>
							<c:when test="${orderItem.status eq 2 }">(等待卖家确认)</c:when>
							<c:when test="${orderItem.status eq 3 }">(正在配送)</c:when>
							<c:when test="${orderItem.status eq 4 }">(交易成功)</c:when>
							<c:when test="${orderItem.status eq 5 }">(已取消)</c:when>
						</c:choose>
					</div>
					<div class="operation opration2">
								<a href="<c:url value='/OrderServlet?method=loadOrderItem&orderItemId=${orderItem.orderItemId } '/>">查看</a><br/>
								<c:if test="${orderItem.status eq 1 }">
									<a
										href="<c:url value='/OrderServlet?method=pay&orderItemId=${orderItem.orderItemId }'/>" onclick="return confirm('确定支付吗？');">支付</a>
									<br />
									<a
										href="<c:url value='/OrderServlet?method=cancel&orderItemId=${orderItem.orderItemId }'/>" onclick="return confirm('确定取消吗？');">取消</a>
									
									<br />
								</c:if>
								<c:if test="${orderItem.status eq 3 }">
									<a
										href="<c:url value='/OrderServlet?method=confirm&orderItemId=${orderItem.orderItemId }'/>" onclick="return confirm('确定收货吗？');">确认收货</a>
									<br />
								</c:if>
								<c:if test="${orderItem.status eq 4 }">
										<c:if test="${orderItem.score eq 1 }">
											<form action="/takeoutFood/jsp/order/appraise.jsp" method="post">
												<input class="appraise" type="submit" value="评价">
												<input type="hidden" name="goodsimg" value="${orderItem.goods.image_s }"/>
												<input type="hidden" name="gname" value="${orderItem.goods.gname }"/>
												<input type="hidden" name="orderItemId" value="${orderItem.orderItemId }"/>
												<input type="hidden" name="gname" value="${orderItem.goods.gname }"/>
												<input type="hidden" name="shopname" value="${orderItem.goods.shopname }"/>
											</form>
										</c:if>
										<c:if test="${orderItem.score eq -5 }">
											非常差
										</c:if>
										<c:if test="${orderItem.score eq -2 }">
											差
										</c:if>
										<c:if test="${orderItem.score eq 0 }">
											一般
										</c:if>
										<c:if test="${orderItem.score eq 2 }">
											好
										</c:if>
										<c:if test="${orderItem.score eq 5 }">
											非常好
										</c:if>
								</c:if>
							</div>
				</div>
			</div>
		
</c:forEach>
		</div>
	</div>
	

</c:forEach> 
	<div class="pagerBox">
		<div class="pager">
		<%@include file="/jsp/pager/pager.jsp" %>
		</div>
	</div>
	</c:otherwise>
</c:choose> 
  </body>
</html>
