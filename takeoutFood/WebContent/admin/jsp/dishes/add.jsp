<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>添加分类</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/admin/css/edit1.css'/>">
	<script type="text/javascript" src="<c:url value='/jq/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript">
		function checkForm() {
			if(!$("#cname").val()) {
				alert("分类名不能为空！");
				return false;
			}
			if(!$("#desc").val()) {
				alert("分类描述不能为空！");
				return false;
			}
			return true;
		}
	</script>
  </head>
  
  <body>
  <div class="bigBox">
	    <span class="title">添加一级分类</span>
	    <p>${msg }</p>
	    <form class="form" action="<c:url value='/admin/AdminCategoryServlet'/>" method="post"  onsubmit="return checkForm()">
	    	<input type="hidden" name="method" value="addParent"/>
	    	<div class="nameDiv">分类名称：<input type="text" name="cname" id="cname"/></div>
	    	<div class="descDiv">分类描述：<textarea class="desc" name="desc" id="desc"></textarea></div>
	    	<input type="submit" value="添加一级分类" class="subtn"/>
	    	<input type="button" value="返回" onclick="history.go(-1)" class="backbtn"/>
	    </form>
   </div> 
  </body>
</html>
