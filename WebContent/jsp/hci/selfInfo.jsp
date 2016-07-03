<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
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
<title>凯罗伊西点 · 个人中心</title>
</head>
<%
	int amount = 0;
	Member m = new Member();
	if (session.getAttribute("cart") != null) {
		ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
		amount = cart.getMount();
	}
%>
<body>
	<div class="main">
		<div class="nav-top">
			<a href="/DessertHouse/shoppingCart" class="nav-top-item float-right">购物车</a>
			<span class="nav-top-line float-right">|</span>
			<%
				if (session.getAttribute("memberInfo") == null) {
					System.out.println("here");
			%>
			<a href="/DessertHouse/signIn" class="nav-top-item float-right">会员登录</a>
			<%
				} else {
					m = (Member) session.getAttribute("memberInfo");
					String sex = "";
					if (m.getSex() == 0) {
						sex = "先生";
					} else {
						sex = "女士";
					}
			%>
			<a href="/DessertHouse/myorder" class="nav-top-item float-right">订单</a>
			<span class="nav-top-line float-right">|</span> <a
				href="/DessertHouse/signOut" class="nav-top-item float-right">[退出]</a>
			<a href="/DessertHouse/selfInfo"
				class="nav-top-item float-right top-welcome active">您好，<%=m.getCname()%><%=sex%></a>

			<%
				}
			%>



		</div>
		<div class="search-panel">
			<a href="/DessertHouse/index"><img src="img/logo.png"
				class="logo float-left" alt="KARROY CAKE"></a>
			<div class="search-div float-left">
				<form action="/DessertHouse/search" method="post" class="">

					<s:textfield name="searchContent" class="search-box"
						placeholder="请输出商品名/门店名" />
					<button class="search-btn ">
						<i class="fa fa-search fa-fw search-icon"></i>
					</button>
				</form>
			</div>
		</div>
		<div class="nav-main">
			<a href="/DessertHouse/bread" class="nav-main-item " id="js-nav-1">面包<span
				class="float-right color-black">|</span></a> <a
				href="/DessertHouse/cake" class="nav-main-item" id="js-nav-2">蛋糕<span
				class="float-right color-black">|</span></a> <a
				href="/DessertHouse/dessert" class="nav-main-item" id="js-nav-3">甜点<span
				class="float-right color-black">|</span></a> <a
				href="/DessertHouse/drinks" class="nav-main-item" id="js-nav-4">饮品<span
				class="float-right color-black">|</span></a> <a
				href="/DessertHouse/other" class="nav-main-item" id="js-nav-5">其他商品<span
				class="float-right color-black">|</span></a> <a
				href="/DessertHouse/shop" class="nav-main-item" id="js-nav-6">门店</a>
		</div>
		<div class="main-panel">
			<div class="bread-nav-div">
				<a href="/DessertHouse/index" class="bread-nav-item">首页</a> <span
					class="bread-nav-label"> > </span> <span class="bread-nav-now">个人信息</span>
			</div>
			<div class="signin-panel">
				<div class="signin-div">
					<div class="signin-label">个人信息</div>
					<table class="selfinfo-table">
					<%
					int g = m.getSex();
					String sex;
					if(g == 0){
						sex = "男";
					}else{
						sex = "女";
					}
					%>
					<tr>
						<td class="text-align-right">性别：</td>
						<td class="text-align-left"><%=sex %></td>
					</tr>
					<tr>
						<td class="text-align-right">姓名：</td>
						<td class="text-align-left"><%=m.getCname() %></td>
					</tr>
					
					
					<tr>
						<td class="text-align-right">居住地：</td>
						<td class="text-align-left"><%=m.getAddress() %></td>
					</tr>
					<tr>
						<td class="text-align-right">生日：</td>
						<td class="text-align-left"><%=m.getBirth() %></td>
					</tr>
					<tr>
						<td class="text-align-right">会员编号：</td>
						<td class="text-align-left"><%=m.getCid() %></td>
					</tr>
					<tr>
						<td class="text-align-right">账户余额：</td>
						<td class="text-align-left"><%=m.getBalance() %></td>
					</tr>
					<%
	   				DecimalFormat df = new DecimalFormat("######0.0"); 
					String percent = df.format(m.getCredit());
   				%>
					<tr>
						<td class="text-align-right">积分个数：</td>
						<td class="text-align-left"><%=percent %>点</td>
					</tr>
					<tr>
						<td class="text-align-right"></td>
						<td class="text-align-left"></td>
					</tr>
					
					</table>
				</div>
			</div>
		</div>


	</div>

	<div class="float-bar">
		<a href="" class="float-bar-item">TOP</a> <a
			href="/DessertHouse/shoppingCart" class="float-bar-item"
			onclick="javascript:document.getElementsByTagName('BODY')[0].scrollTop=0;">
			<i class="fa fa-shopping-cart fa-fw fa-lg shopping-cart-icon"></i> <br />购<br />物<br />车<br />
			<span class="badge css-badge"><%=amount%></span>
		</a>
	</div>

	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#js-nav-2").mouseover(function() {
				$("#js-nav-1").children("span").removeClass("color-black");
				$("#js-nav-1").children("span").addClass("color-white");
				$("#js-nav-2").mouseout(function() {
					$("#js-nav-1").children("span").removeClass("color-white");
					$("#js-nav-1").children("span").addClass("color-black");

				});
			});

			$("#js-nav-3").mouseover(function() {
				$("#js-nav-2").children("span").removeClass("color-black");
				$("#js-nav-2").children("span").addClass("color-white");
				$("#js-nav-3").mouseout(function() {
					$("#js-nav-2").children("span").removeClass("color-white");
					$("#js-nav-2").children("span").addClass("color-black");

				});
			});

			$("#js-nav-4").mouseover(function() {
				$("#js-nav-3").children("span").removeClass("color-black");
				$("#js-nav-3").children("span").addClass("color-white");
				$("#js-nav-4").mouseout(function() {
					$("#js-nav-3").children("span").removeClass("color-white");
					$("#js-nav-3").children("span").addClass("color-black");

				});
			});

			$("#js-nav-5").mouseover(function() {
				$("#js-nav-4").children("span").removeClass("color-black");
				$("#js-nav-4").children("span").addClass("color-white");
				$("#js-nav-5").mouseout(function() {
					$("#js-nav-4").children("span").removeClass("color-white");
					$("#js-nav-4").children("span").addClass("color-black");

				});
			});

			$("#js-nav-6").mouseover(function() {
				$("#js-nav-5").children("span").removeClass("color-black");
				$("#js-nav-5").children("span").addClass("color-white");
				$("#js-nav-6").mouseout(function() {
					$("#js-nav-5").children("span").removeClass("color-white");
					$("#js-nav-5").children("span").addClass("color-black");

				});
			});
		})
	</script>
</body>
</html>