/**
 * 
 */
$(function() {
	showTotal();//显示合计
	// 给全选按钮添加点击事件
	$("#selectAll").click(function() {
		var flag = $(this).attr("checked");//获取全选的状态
		setAll(flag);//让所有条目复选框与全选同步
		setJieSuanStyle(flag);//让结算按钮与全选同步
	});
	
	// 给条目复选框添加事件
	$(":checkbox[name=checkboxBtn]").click(function() {
		var selectedCount = $(":checkbox[name=checkboxBtn][checked=true]").length;//被勾选复选框个数
		var allCount = $(":checkbox[name=checkboxBtn]").length;//所有条目复选框个数
		if(selectedCount == allCount) {//全选了
			$("#selectAll").attr("checked", true);//勾选全选复选框
			setJieSuanStyle(true);//使结算按钮可用
		} else if(selectedCount == 0) {//全撤消了
			$("#selectAll").attr("checked", false);//撤消全选复选框
			setJieSuanStyle(false);//使结算按钮不可用			
		} else {//未全选
			$("#selectAll").attr("checked", false);//撤消全选复选框
			setJieSuanStyle(true);//使结算按钮可用
		}
		showTotal();//重新计算合计
	});
	
	// 给jia、jian添加事件
	$(".jian").click(function() {
		var cartItemId = $(this).attr("id").substring(0, 5);
		var quantity = Number($("#" + cartItemId + "Quantity").val());
		if(quantity == 1) {
			if(confirm("您是否真要删除该条目？")) {
				alert("删除成功！");		
			}
		} else {
			sendUpdate(cartItemId, quantity-1);
		}
	});
	$(".jia").click(function() {
		var cartItemId = $(this).attr("id").substring(0, 5);
		var quantity = Number($("#" + cartItemId + "Quantity").val());
		sendUpdate(cartItemId, quantity+1);
	});
});

// 异步请求，修改数量
function sendUpdate(cartItemId, quantity) {
	/*
	 1. 通过cartItemId找到输入框元素
	 2. 通过cartItemId找到小计元素
	*/
	var input = $("#" + cartItemId + "Quantity");
	var subtotal = $("#" + cartItemId + "Subtotal");
	var currPrice = $("#" + cartItemId + "CurrPrice");

	input.val(quantity);
	subtotal.text(round(currPrice.text() * quantity, 2));
	showTotal();
}

// 设置所有条目复选框
function setAll(flag) {
	$(":checkbox[name=checkboxBtn]").attr("checked", flag);//让所有条目的复选框与参数flag同步
	showTotal();//重新设置合计
}

// 设置结算按钮的样式
function setJieSuanStyle(flag) {
	if(flag) {// 有效状态
		$("#jiesuan").removeClass("kill").addClass("jiesuan");//切换样式
		$("#jiesuan").unbind("click");//撤消“点击无效”
	} else {// 无效状态
		$("#jiesuan").removeClass("jiesuan").addClass("kill");//切换样式
		$("#jiesuan").click(function() {//使其“点击无效”
			return false;
		});
	}
}

// 显示合计
function showTotal() {
	var total = 0;//创建total，准备累加
	/*
	1. 获取所有被勾选的复选框，遍历之
	*/
	$(":checkbox[name=checkboxBtn][checked=true]").each(function() {
		/*
		2. 通过复选框找到小计
		*/
		var subtotal = Number($("#" + $(this).val() + "Subtotal").text());
		total += subtotal;
	});
	/*
	3. 设置合计
	*/
	$("#total").text(round(total, 2));
}


