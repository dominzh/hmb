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
<link rel="stylesheet" type="text/css" href="<c:url value='/seller/css/desc.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/seller/css/jquery.datepick.css'/>">
<script type="text/javascript" src="<c:url value='/jq/jquery-1.5.1.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jq/jquery.datepick.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jq/jquery.datepick-zh-CN.js'/>"></script>

<script type="text/javascript" src="<c:url value='/seller/js/desc.js'/>"></script>

<script type="text/javascript">

$(function() {
	$("#box").attr("checked", false);
	$("#formDiv").css("display", "none");
	$("#show").css("display", "");	
	
	// 操作和显示切换
	$("#box").click(function() {
		if($(this).attr("checked")) {
			$("#show").css("display", "none");
			$("#formDiv").css("display", "");
		} else {
			$("#formDiv").css("display", "none");
			$("#show").css("display", "");		
		}
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

/*
 * 点击编辑按钮时执行本函数
 */
function editForm() {
	$("#method").val("edit");
	$("#form").submit();
}
/*
 * 点击删除按钮时执行本函数
 */
 function deleteForm() {
	$("#method").val("delete");
	$("#form").submit();
	alert("删除成功");
	
}
</script>
  </head>
  
  <body>
  <div class="wd">
	    <input type="checkbox" id="box"><label for="box">编辑或删除</label>
	    <br/>
	    <br/>
	  <div id="show">
	    
	    <img align="top" src="<c:url value='/${goods.image_b }'/>" class="tp"/>
	    <div id="goods">
	    	<div class="sm">${goods.gname }</div>
		    <ul>		    	
		    	<li>定价：<span class="price_n">&yen;${goods.price }</span></li>
		    </ul>
			<hr style="margin-left: 50px; height: 1px; color: #f5c14c"/>
			<table class="tab">
				<tr>
					<td colspan="3">
						店铺：${goods.shopname }
					</td>
				</tr>
				<tr>
					<td colspan="3">菜品描述：<br>
						<div class="textDiv">${goods.describe }</div>
					</td>
				</tr>
			</table>
		</div>
	  </div>
	  
	  <div id='formDiv'>
	   <form action="<c:url value='/seller/SellerGoodsServlet'/>" method="post" id="form">
	    <input type="hidden" name="method" id="method"/>
   		<input type="hidden" name="gid" value="${goods.gid }"/>
	    <img align="top" src="<c:url value='/${goods.image_b }'/>" class="tp"/>
	    <div class="goods">
		    <ul>
		    	<li><span>菜品名：</span><input class="longinput" id="bname" type="text" name="gname" value="${goods.gname }" /></li>
		    	<li><span>定价：</span><input class="shortinput" id="price" type="text" name="price" value="${goods.price }" >
		    </ul>
			<hr style="margin-left: 50px; height: 1px; color: #dcdcdc"/>
			<table class="tab">			
				<tr>
					<td colspan="3"><span>菜品描述：</span><br>
						<textarea name="describe" class="textDiv">${goods.describe }</textarea>
					</td>
				</tr>
				<tr>
					<td>
					<span>一级分类：</span><select name="pid" id="pid" onchange="loadChildren()">
						<option value="">==请选择1级分类==</option>
			    	<c:forEach items="${parents }" var="parent">
			    		<option value="${parent.cid }" <c:if test="${goods.category.parent.cid eq parent.cid }">selected='selected'</c:if>>${parent.cname }</option>
			    	</c:forEach>
					</select>
				</td>
				<td>
					<span>二级分类：</span><select name="cid" id="cid">
						<option value="">==请选择2级分类==</option>
			    	<c:forEach items="${children }" var="child">
			    		<option value="${child.cid }" <c:if test="${goods.category.cid eq child.cid }">selected='selected'</c:if>>${child.cname }</option>
			    	</c:forEach>
					</select>
				</td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2">
						<input onclick="editForm()" type="button" name="method" id="edit" class="btn" value="编　　辑">
						<input onclick="deleteForm()" type="button" name="method" id="del" class="btn" value="删　　除">
					</td>
					<td></td>
				</tr>
			</table>
		</div>
	   </form>
	  </div>
	</div>
  </body>
</html>
