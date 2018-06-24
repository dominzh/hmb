<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>${goods.gname}</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/pager/pager.css'/>" />
	<script src="<c:url value='/jq/jquery-1.5.1.js'/>"></script>
	
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/dishes/desc.css'/>">
	<script src="<c:url value='/js/goods/desc.js'/>"></script>
	<script type="text/javascript">
		function al(){			
			alert("加入购物车成功！！");	
	}
	</script>
  </head>
  
  <body>
  <div class="top">
  	<div class="wd">
  		<img class="logo" src="<c:url value='/img/logo.jpg'/>" />
  		<a href="javascript:history.go(-1);" >返回</a>
  	</div>
  </div>
  <div class="wd">
  
	  <div class="main">
	   <div class="divGoodsName">${goods.gname}</div>
	    <div class="box" id="fdj">
			<div class="small">
				<img src="<c:url value='/${goods.image_s }'/>"/>
				<div class="mask"></div>
			</div>
			<div class="big">
				<img src="<c:url value='/${goods.image_b }'/>"/>
			</div>
		</div>
	    
	    <div class="divGoodsDesc">
		    <ul>
		    	<li>食品编号：${goods.gid }</li>
		    	<li>单价：<span class="price_n">&yen;${goods.price }</span></li>
		    </ul>
			<hr class="hr1"/>
			<table>
				<tr>
					<td colspan="3">
						店铺：${goods.shopname}
					</td>
				</tr>
				<tr>
					<td>描述：${goods.describe}</td>
				</tr>
			</table>
			<div class="divForm">
				<form id="form2" action="<c:url value='/CartItemServlet'/>" method="post" >
					<input type="hidden" name="method" value="add"/>
					<input type="hidden" name="gid" value="${goods.gid }"/>
					<input type="hidden" name="url" value=""/>
	  				我要买：<input id="cnt" style="width: 40px;text-align: center;" type="text" name="quantity" value="1"/>件
	  			</form>
	  			<form id="form1" action="<c:url value='/CartItemServlet'/>" method="post" >
					<input type="hidden" name="method" value="add"/>
					<input type="hidden" name="gid" value="${goods.gid }"/>
					<input type="hidden" name="gid" value="${goods.gid }"/>
					<input type="hidden" name="url" value="r:/"/>
	  				<div class="btncart">我要添加：<input  id="cnt" style="width: 40px;text-align: center;" type="text" name="quantity" value="1"/>件
	  				</div>
	  			</form>
	  			<a id="btn" href="javascript:$('#form1').submit();" onclick="al()">加入购物车</a><br>
	  			<a id="btnBuy" href="javascript:$('#form2').submit();" >立即购买</a>
	  		</div>	
		</div>
	  </div>
	</div>
  </body>
  <script type="text/javascript">
		var fdj = document.getElementById("fdj");
		var small = fdj.children[0];
		var big = fdj.children[1];
		var mask = small.children[1];
		var bigImage = big.children[0];
		small.onmouseover = function(){
			mask.style.display = "block";
			big.style.display = "block";
		}
		small.onmouseout = function(){
			mask.style.display = "none";
			big.style.display = "none";
		} 
		
		var x = 0,y = 0;
		small.onmousemove = function(event){
			var event = event || window.event;
			x = event.clientX - this.offsetParent.offsetLeft-mask.offsetWidth/2;
			y = event.clientY - this.offsetParent.offsetTop-mask.offsetHeight/2;
			if(x<0){
				x = 0;
			}else if(x > small.offsetWidth - mask.offsetWidth){
				x = small.offsetWidth - mask.offsetWidth;
			}
			if(y < 0){
				y = 0;
			}else if(y > small.offsetHeight - mask.offsetHeight){
				y = small.offsetHeight - mask.offsetHeight;
			}
			mask.style.left = x +"px";
			mask.style.top = y + "px";
			
			bigImage.style.left = -x * big.offsetWidth/small.offsetWidth + "px";
			bigImage.style.top = -y * big.offsetHeight/small.offsetHeight + "px";
		}
		
</script>
</html>
