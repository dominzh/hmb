<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>管理员登录页面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript"
	src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}
html {
	background-attachment:fixed;
	background-image:url('/takeoutFood/img/bg.jpg');
	background-size: cover;
}
.box {
	margin: 100px auto;
	background: rgba(0, 0, 0, 0.3);
	height: 267px;
	width: 458px;
	border-radius: 9px;
	box-shadow: 3px 3px 5px #666;
	padding: 2px 2px;
	position: relative;
}

p {
	color: #fff;
	display: block;
	line-height: 33px;
	text-align: center;
	border-bottom: 1px solid #FFF;
	margin-bottom: 30px;
	height: 33px;
}

div.adminname,div.adminpwd {
	width: 226px;
	height: 38px;
	padding: 5px 115px;
	line-height: 38px;
}

label {
	position: absolute;
	left: 122px;
	color: #aaa;
	z-index: 2;
	font-size: 15px;
	
}

label.adminname {
	top: 66px;
}

label.adminpwd {
	top: 115px;
}

input#adminname,input#adminpwd {
	height: 30px;
	width: 226px;
	position: absolute;
	padding-left: 90px;
}

input.but {
	background-color: #AA0F7E;
	width: 227px;
	height: 30px;
	color: #FFF;
	margin: 12px 114px;
	border-radius: 11px;
	border:0;
	font-size:15px;
}

input.but:hover {
	color: #FF6600;
}

a {
	font-size: 14px;
	color: skyblue;
	text-decoration: none;
	float: right;
	margin: 6px 137px 0 0;
}
</style>
</head>
<body>
	<div class="box">
		<p>${msg}</p>
		<form id="form" action="<c:url value='/AdminServlet'/>"
			method="post">
			<input type="hidden" name="method" value="login" />
			<div class="adminname">
				<label for="adminname" class="adminname">管理员账户</label> <input
					type="text" name="adminname" id="adminname">
			</div>
			<div class="adminpwd">
				<label for="adminpwd" class="adminpwd">
					密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 码</label> <input type="password"
					name="adminpwd" id="adminpwd">
			</div>
			<input type="button" class="but" onclick="check()" value="进&nbsp;入&nbsp;后&nbsp;台">
		</form>
	</div>
</body>
<script type="text/javascript">
  	var adminname = document.getElementById("adminname");
	var adminpwd = document.getElementById("adminpwd");
	var form = document.getElementById("form");
  	//alert(name.value);
  		function check(){
  			if(adminname.value == ""){
  				alert("用户名不能为空！");
  				adminname.focus();
  			}else if(adminpwd.value == ""){
  				alert("密码不能为空！");
  				adminpwd.focus();
  			}else{
  				form.submit();
  			}
  		}
</script>
</html>
