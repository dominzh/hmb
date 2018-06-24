<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>结算页面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/cart/showitem.css'/>">
<script src="<c:url value='/jq/jquery-1.11.1.js'/>"></script>
<script src="<c:url value='/js/round.js'/>"></script>
<style type="text/css">
</style>
<script type="text/javascript">
	//计算合计
	$(function() {
		var total = 0;
		$(".subtotal").each(function() {
			total += Number($(this).text());
		});
		$("#total").text(round(total, 2));
		
		//联系方式校验
		$("#phone").blur(function validatePhone() {
			var value = $("#phone").val();// 获取输入框内容
			// 1. 非空校验
			if (!value) {
				 $("#error").val("×  手机号码不能为空");
			}
			// 2. 数字及有效号码校验 ^1(3|4|5|7|8)\d{9}$
			if (!/^[0-9]*$/.test(value)) {
				$("#error").val("×  请输入数字");
			} else if (!(/^1(3|4|5|7|8)\d{9}$/.test(value))) {
				$("#error").val("×  请输入有效号码");
			}
		});
		
	});
</script>
</head>

<body>
	<div class="top">
		<div class="ws">
			<img class="logo" src="<c:url value='/img/logo.jpg'/>" /> <a
				href="javascript:history.go(-1);">返回</a>
		</div>
	</div>
	<div class="ws">
		<form id="form1" action="<c:url value='/OrderServlet'/>" method="post">
			<input type="hidden" name="cartItemIds" value="${cartItemIds }" /> <input
				type="hidden" name="method" value="createOrder" />

			<table align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td class="orderTitle" colspan="5"><span>生成订单</span></td>
				</tr>
				<tr align="center">
					<td>&nbsp;</td>
					<td>商品名称</td>
					<td>单价</td>
					<td>数量</td>
					<td>小计</td>
				</tr>

				<c:forEach items="${cartItemList }" var="cartItem">
					<tr align="center">
						<td class="nobotomborder" align="right"><a class="linkImage"
							href="<c:url value='/GoodsServlet?method=load&gid=${cartItem.goods.gid }'/>"> <img
								class="goodsimg" align="top"
								src="<c:url value='/${cartItem.goods.image_s }'/>" /></a></td>
						<td class="nobotomborder" align="left"><a
							href="<c:url value='/GoodsServlet?method=load&gid=${cartItem.goods.gid }'/>"><span>${cartItem.goods.gname }</span></a>
						</td>
						<td class="nobotomborder">&yen;${cartItem.goods.price }</td>
						<td class="nobotomborder">${cartItem.quantity }</td>
						<td class="nobotomborder"><span class="price_n">&yen;<span
								class="subtotal">${cartItem.subtotal }</span></span></td>
					</tr>
				</c:forEach>

				<tr>
					<td class="nobotomborder topborder" colspan="6" align="right">
						<span>总计：</span><span class="price_t">&yen;<span id="total">${total }</span></span>
					</td>
				</tr>
				<tr>
					<td class="nobotomborder" colspan="1"><span>收货地址:</span></td>
					<td class="nobotomborder" colspan="4"><input id="addr"
						type="text" name="address" value="${address}" />
						</td>
				</tr>
				<tr>
					<td class="nobotomborder" colspan="1"><span>联系方式:</span></td>
					<td class="nobotomborder" colspan="4"><input id="phone"
						type="text" name="phone"  value="${phone}" />
						<input id="error" type="text" value=""/></td>
				</tr>

			</table>
			<div class="btnfixed">
				<div class="btn">
					<a id="linkSubmit"
						href="javascript:window.alert('确定提交订单？'); $('#form1').submit();">提交订单</a>
				</div>
			</div>
		</form>
	</div>
	<!-- <%@ include file="/jsp/footer.jsp"%> -->
</body>

</html>
