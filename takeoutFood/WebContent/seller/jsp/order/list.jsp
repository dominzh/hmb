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
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/pager/pager.css'/>" />
    <script type="text/javascript" src="<c:url value='/js/pager/pager.js'/>"></script>
    <link rel="stylesheet" type="text/css" href="<c:url value='/seller/css/order/list.css'/>" />
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
  <div class="wo">
	  <p class="pLink">
		  <a href="<c:url value='/seller/SellerOrderServlet?method=findByStatus&status=1'/>">未付款</a>
		  <a href="<c:url value='/seller/SellerOrderServlet?method=findByStatus&status=2'/>">已付款</a> 
		  <a href="<c:url value='/seller/SellerOrderServlet?method=findByStatus&status=3'/>">已发货</a>
		  <a href="<c:url value='/seller/SellerOrderServlet?method=findByStatus&status=4'/>">交易成功</a>
		  <a href="<c:url value='/seller/SellerOrderServlet?method=findByStatus&status=5'/>">已取消</a>
	 </p>
 </div>
 <!--订单头部标题 -->
 
 	<div class="wo">
		<div class="orderTitle">
			<div class="goodsMgs">商品信息</div>
			<div class="price">金额</div>
			<div class="num">数量</div>
			<div class="totalPrice">总价</div>
			<div class="state">订单状态</div>
			<div class="operation">操作</div>
		</div>
	</div>
	<!--订单详情  -->
 <c:forEach items="${pb.beanList }" var="orderItem">
		<div class="wo">
		
		<div class="orderList">
			<div class="orderId">
				<span>订单号：${orderItem.order.oid }</span>&nbsp;&nbsp;&nbsp;&nbsp;
				<span>下单时间：${orderItem.order.ordertime }</span>
			</div>
		
			<div class="centerBox">
				<div class="boxLeft">
					<div class="goodsMgs">
						<a><img class="goodsImg" align="center" src="<c:url value='/${orderItem.goods.image_s }'/>"/></a>
						<span class="goodsSpan">${orderItem.goods.gname }</span>
					</div>
				</div>
				<div class="boxRight">
					<div class="price">&yen;${orderItem.goods.price }</div>
					<div class="num">${orderItem.quantity }</div>
					<div class="totalPrice">&yen;${orderItem.subtotal }</div>
					<div class="state">
						<c:choose>
							<c:when test="${orderItem.status eq 1 }">(等待付款)</c:when>
							<c:when test="${orderItem.status eq 2 }">(准备发货)</c:when>
							<c:when test="${orderItem.status eq 3 }">(等待确认)</c:when>
							<c:when test="${orderItem.status eq 4 }">(交易成功)</c:when>
							<c:when test="${orderItem.status eq 5 }">(已取消)</c:when>
						</c:choose>
					</div>
					<div class="operation opration2">
								<a href="<c:url value='/seller/SellerOrderServlet?method=loadOrderItem&orderItemId=${orderItem.orderItemId } '/>">查看</a><br/>
								<c:if test="${orderItem.status eq 1 }">
									<a href="<c:url value='/seller/SellerOrderServlet?method=cancel&orderItemId=${orderItem.orderItemId }'/>">取消</a>
									<br />
								</c:if>
								<c:if test="${orderItem.status eq 2 }">
									<a href="<c:url value='/seller/SellerOrderServlet?method=deliver&orderItemId=${orderItem.orderItemId }'/>">发货</a>
									<br />
								</c:if>
								<c:if test="${orderItem.status eq 4 }">
										<c:if test="${orderItem.score eq 1 }">
											未评价
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
		

		</div>
	</div>
	
</c:forEach><br>
	<div class="pagerBox">
		<div class="pager">
			<%@include file="/jsp/pager/pager.jsp" %>
		</div>
	</div>

  </body>
</html>
