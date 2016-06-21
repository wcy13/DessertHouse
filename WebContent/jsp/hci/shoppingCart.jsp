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
<title>凯罗伊西点·购物车</title>
</head>
<body class="">
	<%
		boolean isSelected = false;
		List<TestCakeVO> allCakes = new ArrayList<TestCakeVO>();
		List<TestCakeVO> orderedCakes = new ArrayList<TestCakeVO>();
		List<TestCakeVO> remainCakes = new ArrayList<TestCakeVO>();
		if (session.getAttribute("allCakes") != null) {
			allCakes = (List<TestCakeVO>) session.getAttribute("allCakes");
		}
		if (session.getAttribute("orderedCakes") != null) {
			orderedCakes = (List<TestCakeVO>) session.getAttribute("orderedCakes");
		}
		if (request.getParameter("goBack") != null) {
			String selectBK[] = request.getParameterValues("checked");
			if (selectBK != null) {
				Iterator<TestCakeVO> iterator = orderedCakes.iterator();
				while (iterator.hasNext()) {
					TestCakeVO bvo = iterator.next();
					for (int i = 0; i < selectBK.length; i++) {
						if (selectBK[i].equals(bvo.getId())) {
							allCakes.add(bvo);
							isSelected = true;
							break;
						}
					}
					if (isSelected) {
						isSelected = false;
					} else {
						remainCakes.add(bvo);
					}
				}
				orderedCakes = remainCakes;
				remainCakes = new ArrayList();
				System.gc();
				session.setAttribute("allCakes", allCakes);
				session.setAttribute("orderedCakes", orderedCakes);
			}
		} else if (request.getParameter("continue") != null) {
			response.sendRedirect("/DessertHouse/test");
			return;
		}
	%>

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
				<input type="text" class="form-control" placeholder="商品 / 门店">
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
			<li><a href="/DessertHouse/signIn">登录</a></li>
			<li><a href="/DessertHouse/signUp">注册</a></li>
		</ul>
	</div>
	</nav>
	<div>
		<%
			Iterator<TestCakeVO> iterator = orderedCakes.iterator();
		%>
		你选购的蛋糕： <br>
		<form method="post" action="/DessertHouse/shoppingCart">
		<%
			if (!orderedCakes.isEmpty()) {
		%>
		
			<table width="600" border="1" cellspacing="0" cellpadding="0">
				<tr>
					<td>选择</td>
					<td>名字</td>
					<td>价格</td>
				</tr>
				<%
					while (iterator.hasNext()) {
							TestCakeVO bvo = iterator.next();
				%>
				<tr>
					<td><input name="checked" type="checkbox"
						value=<%=bvo.getId()%> /></td>
					<td><%=bvo.getName()%></td>
					<td><%=bvo.getPrice()%></td>
				</tr>
				<%
					}
				%>
				<tr>
					<td colspan="6"><input type="submit" name="goBack"
						value="放回货架" />&nbsp;&nbsp;&nbsp;<input type="submit"
						name="continue" value="继续购物" /></td>
				</tr>
			</table>
			
			<%
				}else{
			%>
			<b>对不起,您的购物车里面没有东西!</b>
			<p>
			<input type="submit" name="continue" value="继续购物" />
			<% }%>
			</form>
		
	</div>

	<script src="../dist/js/jquery-1.9.1.min.js"></script>
	<script src="../dist/js/bootstrap.js"></script>
</body>
</html>