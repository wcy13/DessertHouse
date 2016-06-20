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
<script src="//cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
<title>凯罗伊西点</title>
</head>
<%
	String tel = (String)request.getAttribute("tel");
	List<String> telList = (List<String>)request.getAttribute("telList");
%>
<body class="">
	<nav class="">
	<div class="navbar-header">
		<label class="navbar-brand active">凯罗伊西点</label>
	</div>
	<div>
		<ul class="nav navbar-nav ">
			<li><a href="/DessertHouse/product">商品</a></li>
			<li><a href="/DessertHouse/shop">门店</a></li>
			<li><a href="/DessertHouse/onlineOrder">在线点餐</a></li>
		</ul>
		<form action="/DessertHouse/search" method="post"
			class="navbar-form navbar-left" role="search">
			<div class="form-group">
				<s:textfield name="searchContent" class="form-control"/>
			</div>
			<button type="submit" class="btn btn-default">提交</button>
		</form>
		<ul class="nav navbar-nav pull-right">
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown"> 个人中心 <b class="caret"></b>
			</a>
				<ul class="dropdown-menu">
					<li><a href="/DessertHouse/myorder">我的订单</a></li>
					<li><a href="/DessertHouse/selfInfo">个人信息</a></li>
					<li><a href="/DessertHouse/signOut">退出</a></li>
				</ul></li>
			<li><a href="/DessertHouse/shoppingCart">购物车</a></li>
			<li><a href="/DessertHouse/signIn">会员登录</a></li>
			
		</ul>
	</div>
	</nav>
	<div>
		<form action="/DessertHouse/category" method="post" class="">
			<s:hidden name="pcid" value='1'></s:hidden>
			<input type="submit" class="" value="面包">
		</form>
		<form action="/DessertHouse/category" method="post" class="">
			<s:hidden name="pcid" value='4'></s:hidden>
			<input type="submit" class="" value="甜品">
		</form>
		<form action="/DessertHouse/cake" method="post" class="">
			<s:hidden name="pcid" value='8'></s:hidden>
			<input type="submit" class="" value="鲜奶蛋糕">
		</form>
		<form action="/DessertHouse/cake" method="post" class="">
			<s:hidden name="pcid" value='9'></s:hidden>
			<input type="submit" class="" value="慕斯蛋糕">
		</form>
	</div>
<div>
<h1>密码错误</h1>
</div>
	<script src="../dist/js/jquery-1.9.1.min.js"></script>
	<script src="../dist/js/bootstrap.js"></script>
	<script type="text/javascript" charset="utf-8">
		
	</script>

</body>
</html>