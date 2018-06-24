<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="<c:url value='/seller/css/add.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/jq/jquery.datepick.css'/>">
<script type="text/javascript" src="<c:url value='/jq/jquery-1.5.1.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jq/jquery.datepick.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jq/jquery.datepick-zh-CN.js'/>"></script>
<script type="text/javascript">
$(function () {
	$("#btn").addClass("btn1");
	$("#btn").hover(
		function() {
			$("#btn").removeClass("btn1");
			$("#btn").addClass("btn2");
		},
		function() {
			$("#btn").removeClass("btn2");
			$("#btn").addClass("btn1");
		}
	);
	
	$("#btn").click(function() {
		var gname = $("#gname").val();
		var image_b = $("#image_b").val();
		var image_s = $("#image_s").val();
		var price = $("#price").val();		
		var describe = $("#describe").val();
		var pid = $("#pid").val();
		var cid = $("#cid").val();
		if(!gname || !image_b || !image_s || !price || !describe || !pid || !cid ) {
			alert("菜品名、定价、店铺名、菜品描述、1级分类、2级分类、大图、小图都不能为空！");
			return false;
		} 
		
		if(isNaN(price)) {
			alert("当前价、定价、折扣必须是合法小数！");
			return false;
		}
		$("#form").submit();
	});
});

function loadChildren(){
	/*
	1.获取pid
	2.发出异步请求
	3.得到一个数组
	4.获取cid元素(<select>)，把内部的<option>全部删除
	5.添加一个头<option>请选择2级分类</option>
	6.循环数组，把数组的每个对象转换成一个<option>添加到cid中
	*/
	//1.获取pid
	var pid = $("#pid").val();
	//2.发出异步请求
	$.ajax({
		async:true,
		cache:false,
		url:"/takeoutFood/seller/SellerGoodsServlet",
		data:{method:"ajaxFindChildren",pid:pid},
		type:"POST",
		dataType:"json",
		success:function(arr){
			//3.得到cid，删除它的内容
			$("#cid").empty();//删除元素的子元素
			//添加头
			$("#cid").append($("<option>==请选择2级分类==</option>"));
			//5.循环遍历数组，把每个对象转换成<option>添加到cid中
			for(var i = 0; i < arr.length; i++){
				var option =$("<option>").val(arr[i].cid).text(arr[i].cname);
				$("#cid").append(option);
			}
			
		}
	
	});
}

</script>
  </head>
  
  <body>
  <div>
   <p class="msg">${msg }</p>
   <form action="<c:url value='SellerAddGoodsServlet'/>" enctype="multipart/form-data" method="post" id="form">
    <div>
	    <ul>
	    	<li><span>菜品名：</span><input id="gname"  name="gname" value="" /></li>
	    	<li><span>大图：</span><input id="image_b" type="file" name="image_b"/></li>
	    	<li><span>小图：</span><input id="image_s" type="file" name="image_s"/></li>
	    	<li><span>定价：</span><input id="price" type="text" name="price" value="" />
	    </ul>
	    <div class="addbox">
			<div class="smallbox">
				<div><span>菜品描述：</span><br>
					<textarea id="describe" name="describe"></textarea>
				</div>
			</div>
			<div  class="smallbox">
				<span>一级分类：</span><select name="pid" id="pid" onchange="loadChildren()">
					<option value="">==请选择1级分类==</option>
		    <c:forEach items="${parents }" var="parent">
		    		<option value="${parent.cid }" >${parent.cname }</option>
		    </c:forEach>		
				</select>
			</div>
			<div  class="smallbox">
				<span>二级分类：</span>
				<select name="cid" id="cid">
					<option value="">==请选择2级分类==</option>
		    		
				</select>
			</div>
			<div>
				<div class="button">
					<input type="button" id="btn" class="btn" value="宝贝上架">
				</div>
			</div>
		</div>
	</div>
   </form>
  </div>

  </body>
</html>
