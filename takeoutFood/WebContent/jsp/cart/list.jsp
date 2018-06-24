<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>还没饱-我的购物车</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="<c:url value='/jq/jquery-1.5.1.js'/>"></script>
	<script src="<c:url value='/js/round.js'/>"></script>
	
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/cart/list.css'/>">
	
<script type="text/javascript">
$(function() {
		showTotal();//计算总计
		/*
		给全选添加click事件
		 */
		$("#selectAll").click(function() {
			/*
			1.获取全选的状态
			 */
			var bool = $("#selectAll").attr("checked");
			/**
			2.让所有条目的复选框与全选的状态同步
			 */
			setItemCheckBox(bool);
			/*
			3.让结算按钮与全选同步
			 */
			setJiesuan(bool);
			/*
			4.重新计算总计
			 */
			showTotal();
		});
		/*
		给所有条目的复选框添加click事件
		 */
		 $(":checkbox[name=checkboxBtn]").click(function(){
		 	var all = $(":checkbox[name=checkboxBtn]").length;//所有条目的个数
		 	var select = $(":checkbox[name=checkboxBtn][checked=true]").length;//被选中条目的个数
		 	if(all == select){
		 		$("#selectAll").attr("checked",true);//勾选全选复选框
		 		setJiesuan(true);//让结算按钮有效
		 	}else if(select == 0){//都没选
		 		$("#selectAll").attr("checked",false);//取消全选复选框
		 		setJiesuan(false);//让结算按钮失效
		 	}else {
		 		$("#selectAll").attr("checked",false);//取消全选复选框
		 		setJiesuan(true);//让结算按钮有效
		 	}
		 	showTotal();//重新计算总计
		 });
		 
		 /*
		 给减号添加事件
		 */
		 $(".jian").click(function(){
		 	//获取cartItemId
		 	var id = $(this).attr("id").substring(0,32);
		 	//获取输入框中的数量
		 	var quantity = $("#" + id +"Quantity").val();
		 	//判断当前数量是否为1，如果为1，那就不是修改数量了，而是删除了
		 	if(quantity == 1){
		 		if(confirm("您是否要删除该条目？")){
		 				location = "/store/CartItemServlet?method=batchDelete&cartItemIds=" + id;
		 		}
		 	}else {
		 		sendUpdateQuantity(id,Number(quantity)-1);
		 	}
		 });
		 /*
		 给加号添加事件
		 */
		$(".jia").click(function(){
			//获取cartItemId
		 	var id = $(this).attr("id").substring(0,32);
		 	//获取输入框中的数量
		 	var quantity = $("#" + id +"Quantity").val();
			sendUpdateQuantity(id,Number(quantity)+1);
		});
		
	});
	//请求服务器修改数量
	function sendUpdateQuantity(id,quantity){
		$.ajax({
			async:false,
			cache:false,
			url:"/store/CartItemServlet",
			data:{method:"updateQuantity",cartItemId:id,quantity:quantity},
			type:"POST",
			dataType:"json",
			success:function(result){
				//1.修改数量
				$("#" + id +"Quantity").val(result.quantity);
				//2.修改小记
				$("#" + id + "Subtotal").text(result.subtotal);
				//3.重新计算总计
				showTotal();
			}
		});
	}
	
	/*
	 计算总计
	 */

	function showTotal() {

		var total = 0;
		/*
		 1.获取所有的被勾选的条目的复选框,循环遍历
		 */
		$(":checkbox[name=checkboxBtn][checked=true]").each(function() {

			//2.获取复选框的值，即cartItemId，其他元素的前缀
			var id = $(this).val();
			//3.再通过cartItemId找到小记，获取其文本
			var text = $("#" + id + "Subtotal").text();
			//4.累加计算
			total += Number(text);

		});
		//5.把总计显示在总计元素上面
		$("#total").text(round(total,2));//round()把total保留2位小数

	}
	/**
	统一设置所有条目的复选按钮
	 */
	function setItemCheckBox(bool) {
		$(":checkbox[name=checkboxBtn]").attr("checked", bool);
	}

	/*
		设置结算按钮样式
	 */
	function setJiesuan(bool) {
		if (bool) {
			 $("#jiesuan").removeClass("kill").addClass("jiesuan"); 
			$("#jiesuan").unbind("click");//撤销当前元素所有click事件
		} else {
			$("#jiesuan").removeClass("jiesuan").addClass("kill");
			$("#jiesuan").click(function() {
				return false;
			});
		}
	}
	
	/*
	 批量删除
	*/
	function batchDelete(){
		//1.获取所有被选中条目的复选框
		//2.创建一个数组，把所有被选中的复选框的值添加到数组中
		//3.指定location为CartItemServlet，参数为method=bathDelete，参数cartItemIds=数组的toString()
		var cartItemIdArray = new Array();
		$(":checkbox[name=checkboxBtn][checked=true]").each(function() {
			cartItemIdArray.push($(this).val());//把复选框的值添加到数组中
		});
		location = "/store/CartItemServlet?method=batchDelete&cartItemIds=" + cartItemIdArray;
		
	}
	
	/*
	结算
	*/
	function jiesuan(){
	// 1. 获取所有被选择的条目的id，放到数组中
	var cartItemIdArray = new Array();
	$(":checkbox[name=checkboxBtn][checked=true]").each(function() {
		cartItemIdArray.push($(this).val());//把复选框的值添加到数组中
	});	
	// 2. 把数组的值toString()，然后赋给表单的cartItemIds这个hidden
	$("#cartItemIds").val(cartItemIdArray.toString());
	// 把总计的值，也保存到表单中
	$("#hiddenTotal").val($("#total").text());
	// 3. 提交这个表单
	$("#jieSuanForm").submit();
	}

</script>
  </head>
  <body>
	 <!--头部导航  -->
  	<div class="top ">
		<div class="divTop">
			<iframe frameborder="0" scrolling="no"
				src="<c:url value='/jsp/top.jsp'/>" name="top"></iframe>
		</div>
	</div>
	<div class="cartBox">
		<div class="wc">
			<img class="logo" src="<c:url value='/img/logo.jpg'/>" />
			<span class="cart">我的购物车</span> 
		</div>
	</div>
	<!--空购物车  -->
<c:choose>
	<c:when test="${empty cartItemList }">	
	<div class="wc cartList" name="order">
		<img align="center" src="<c:url value='/img/emptycart.png'/>" /> 
		<span class="spanEmpty">您的购物车空空的哦~
		</span>
		<a href="<c:url value='/index.jsp'/>">去购物>></a>
	</div>

</c:when>
	<c:otherwise>
<!--购物车列表  -->
	<div class="wc">
		<div >
			<div  class="div_top">
				<div class="selectAll">
					<input type="checkbox" id="selectAll" checked="checked" />
					<label for="selectAll">全选</label>
				</div>
				<div class="goods">商品名称</div>
				<div class="price">单价</div>
				<div class="num">数量</div>
				<div class="numPrice">小计</div>
				<div class="operation">操作</div>
			</div>
		</div>
	<c:forEach items="${cartItemList }" var="cartItem">	
		<div class="bigBox">
			<div class="storename">店铺：${cartItem.goods.shopname }</div>
			<div  class="div_list">
				
				<div class="selectAll">
					<input value="${cartItem.cartItemId }" type="checkbox" name="checkboxBtn" checked="checked" />
				</div>
				<div class="goods">
					<a class="linkImage" href="<c:url value='/GoodsServlet?method=load&gid=${cartItem.goods.gid }'/>">
					<img class="img_s" src="<c:url value='/${cartItem.goods.image_s }'/>" /></a>
					<a href="<c:url value='/GoodsServlet?method=load&gid=${cartItem.goods.gid }'/>">
					<span class="goodsName">${cartItem.goods.gname }</span>
					</a>
				</div>
				<div class="boxright">
					<div class="price">
						<span>&yen;<span class="currPrice" >${cartItem.goods.price }</span></span>
					</div>
					<div class="num">
						<a class="jian" id="${cartItem.cartItemId}Jian"></a>
						<input class="quantity" readonly="readonly" id="${cartItem.cartItemId }Quantity" type="text" value="${cartItem.quantity }"/>
						<a class="jia" id="${cartItem.cartItemId }Jia"></a>
					</div>
					<div class="numPrice">
						<span class="price_n">&yen;
						<span class="subTotal" id="${cartItem.cartItemId }Subtotal">${cartItem.subtotal}</span>
						</span>
					</div>
					<div class="operation">
						<a href="<c:url value='/CartItemServlet?method=batchDelete&cartItemIds=${cartItem.cartItemId }'/>">删除</a>
					</div>
				</div>
			</div>
			
			
		</div>
		</c:forEach>
		
		
		
		<!--结算  -->
		<div class="zanWei">
			<div class="jiesuanBox wc">
				<div class="tdBatchDelete">
					<a href="javascript:batchDelete();">批量删除</a>
				</div>
				<div  class="tdTotal">
					<span>总计：</span>
					<span class="price_t">&yen;
						<span id="total"></span>
					</span>
				</div>
			
					<a href="javascript:jiesuan();" id="jiesuan" class="jiesuan" target="_parent">结算</a>
	
				<form id="jieSuanForm" action="<c:url value='/CartItemServlet'/>" method="post" >
					<input type="hidden" name="cartItemIds" id="cartItemIds"/>
					<input type="hidden" name="method" value="loadCartItems"/>
					<input type="hidden" name="total" id="hiddenTotal" /> 
				</form>
				
			</div>		
		</div>	
	</div>
	</c:otherwise>
</c:choose>

  </body>
</html>