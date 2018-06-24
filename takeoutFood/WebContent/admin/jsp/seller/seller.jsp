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

	<link rel="stylesheet" type="text/css" href="<c:url value='/admin/css/seller.css'/>"">
 <script type="text/javascript"
	src="<c:url value='/jq/jquery-1.11.1.js'/>"></script>
	<script type="text/javascript">
		$(document).ready(function() {
		/* alert($(".optration a").text() == "是否"); 
		$(".optration a").text() == "YES";*/
			$(".optration a").on("click", function() {
				var $this=$(this);
			 if($this.text() == "YES"){
					$this.text("NO");
				}else{
					$this.text("YES");
				} 
			/*  alert("hhh");*/
			});
		});
	</script>	
  </head>
  
  <body>
    <div class="topTitle">
    	<div class="honour">信用</div>
    	<div class="shopname">店铺</div>
    	<div class="name">姓名</div>
    	<div class="optration">经营许可</div>
    </div>
   <c:forEach items="${sellers }" var="seller"> 	
    <div class="shop">
    	<div class="honour">${seller.honour }</div>
    	<div class="shopname">${seller.loginname }</div>
    	<div class="name">${seller.name }</div>
    	<div class="optration">
    		<c:if test="${seller.status eq 0}">
    			<a class="goodsBtn" href="<c:url value='/admin/AdminSellerServlet?method=open&sid=${seller.sid }'/>" target="body">NO</a>
    		</c:if>
    		<c:if test="${seller.status eq 1}">
    			<a class="goodsBtn" href="<c:url value='/admin/AdminSellerServlet?method=close&sid=${seller.sid }'/>" target="body">YES</a>
    		</c:if>
    	</div>
    </div>
  </c:forEach>    

  </body>
</html>
