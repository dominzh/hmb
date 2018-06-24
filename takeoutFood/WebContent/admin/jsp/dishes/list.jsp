<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>分类列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="<c:url value='/admin/css/list.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/css.css'/>">
  </head>
  <script type="text/javascript"
	src="<c:url value='/jq/jquery-1.11.1.js'/>"></script>
  <script type="text/javascript">
	 $(document).ready(function(){
		if(typeof $("#msg").val() != 'undefined' && $("#msg").val()!=null && $("#msg").val()!=""){
			alert($("#msg").val());
		}
	}); 
</script>
  <body>
  
	  <div class="wm btn">
	  	<a id="orderBtn" class="orderBtn" href="<c:url value='/admin/jsp/dishes/add.jsp'/>" target="body">添加一级分类</a>
		<a class="addBtn" href="<c:url value='/admin/AdminCategoryServlet?method=addChildPre&pid=${parent.cid }'/>" target="body">添加二级分类</a>
	  </div>
	  <div class="main wm">
	  	<div class="top">
		  	<input type="hidden" value="${msg }" id="msg"/>
		    <span>分类列表</span><br>
	    	<span class="captionAddOneLevel">
	    	</span>
	   	</div>
	   	<div class="box" >
		   	<div class="trTitle">
		   		<div class="thTop">分类名称</div>
		   		<div class="thTop">描述</div>
		   		<div class="thTop">操作</div>
		   	</div>
	    	
	<c:forEach items="${parents }" var="parent">  
	    	<div class="trOneLevel">
	    		<div class="twoTop">${parent.cname }</div>
	    		<div class="twoTop">${parent.desc }</div>
	    		<div class="operation" >
		    		<span class="rightTh">
		    		  <a href="<c:url value='/admin/AdminCategoryServlet?method=editParentPre&cid=${parent.cid }'/>">修改</a>
		    		  <a onclick="return confirm('您是否真要删除该一级分类？')" href="<c:url value='/admin/AdminCategoryServlet?method=deleteParent&cid=${parent.cid }'/>">删除</a>
	    			</span>
	    		</div>
	    	</div>
	     <c:forEach items="${parent.children }" var="child">
	    	<div class="trTwoLevel">
	    		<div class="threeTop">${child.cname }</div>
	    		<div class="threeTop">${child.desc }</div>
	    		<div>
	    			<span class="rightTh">
		    		  <a href="<c:url value='/admin/AdminCategoryServlet?method=editChildPre&cid=${child.cid }'/>">修改</a>
		    		  <a onclick="return confirm('您是否真要删除该二级分类？')" href="<c:url value='/admin/AdminCategoryServlet?method=deleteChild&cid=${child.cid }'/>">删除</a>
	    			</span>
	    		</div>
	    	</div>
	    </c:forEach> 
	</c:forEach>  
			</div>
	
	    </div>
	    
	    
    
  </body>
</html>
