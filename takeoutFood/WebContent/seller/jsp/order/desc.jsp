<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>订单详细</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/order/desc.css'/>">
<style type="text/css">
.tt {
    border-top: 1px solid #4e4e4e;
    border-bottom: 1px solid #4e4e4e;
    height: 38px;
    color: #fff;
    background-color: #4e4e4e;
}
</style>
</head>

<body>
	<div class="wd">
		<div class="divRow">
			<div class="divContent">
				<dl>
					<dt>
						订单号：${orderItem.order.oid }
						<c:choose>
							<c:when test="${orderItem.status eq 1 }">(等待付款)</c:when>
							<c:when test="${orderItem.status eq 2 }">(准备发货)</c:when>
							<c:when test="${orderItem.status eq 3 }">(等待确认)</c:when>
							<c:when test="${orderItem.status eq 4 }">(交易成功)</c:when>
							<c:when test="${orderItem.status eq 5 }">(已取消)</c:when>
						</c:choose>
						下单时间：${orderItem.order.ordertime }
					</dt>
					<dt>收货地址：${orderItem.order.address }&nbsp;&nbsp;&nbsp;&nbsp;
						联系方式:${orderItem.order.phone}</dt>
				</dl>
			</div>
			<div class="line"></div>
			<div class="divContent2">
				<dl>
					<dt>商品清单</dt>
					<dd>
						<div class="tableDiv">
							<table cellpadding="0" cellspacing="0">
								<tr>
									<th class="tt">商品名称</th>
									<th class="tt" align="center">单价</th>
									<th class="tt" align="center">数量</th>
									<th class="tt" align="center">小计</th>
								</tr>
							<tr class="descTitle">
								<td class="td" align="center">
									<div class="goodsname">
										<img align="middle" width="70"
											src="<c:url value='/${orderItem.goods.image_s }'/>" />
										${orderItem.goods.gname }
									</div>
								</td>
								<td class="td" align="center"><span class="price_t">&yen;${orderItem.goods.price }</span>
								</td>
								<td class="td" align="center"><span>${orderItem.quantity }</span>
								</td>
								<td class="td" align="center"><span>&yen;${orderItem.subtotal }</span>
								</td>
							</tr>
							
						</table>
					</div>
					</dd>
				</dl>
			</div>
			<div class="appraiseResult">
				<c:if test="${orderItem.status eq 4}">
					<c:if test="${not empty orderItem.appraise}">
						<span>评论内容：</span>
						<br>
						<div>${orderItem.appraise }</div>
					</c:if>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>

