<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="edu.nju.desserthouse.model.*"%>
<%@ page import="edu.nju.desserthouse.model.hci.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style_hci.css" rel="stylesheet">
<link rel="stylesheet"
	href="//cdn.bootcss.com/font-awesome/4.5.0/css/font-awesome.min.css">
<title>凯罗伊西点</title>
</head>
<%
		session.invalidate();
		List<String> telList = (List<String>)request.getAttribute("telList");
%>
<body>
	<div class="main">
		<div class="nav-top"> 
			<a href="/DessertHouse/shoppingCart" class="nav-top-item float-right">购物车</a>
			<span class="nav-top-line float-right">|</span> 
			<a href="/DessertHouse/signIn" class="nav-top-item float-right">会员登录</a> 
		</div>
		<div class="search-panel">
			<a href="#"><img src="img/logo.png" class="logo float-left"
				alt="KARROY CAKE"></a>
			
		</div>
		<div class="main-panel">
			<div class="signin-panel">
				<div class="signin-div">
					<div class="signin-label">销 售 员 登 录</div>
				 	<form action="/DessertHouse/login" method="post" class="">
				 		<div class="">
				 			
		      				<s:textfield name="id" id="js-input" class="signin-input" placeholder="请输入销售员编号" />
		         			<label id="js-check-label"></label>
		   				</div>
		   				<div class="">
		      				<s:password name="password" class="signin-input" placeholder="请输入密码"/>
		   				</div>
		   				<input type="submit" class="signin-btn" value="登陆" id="sign-btn"/>
		   				</form>
				</div>
			</div>
			
		</div>


	</div>


	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>

</body>
</html>