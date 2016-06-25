<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="edu.nju.desserthouse.model.*"%>
<%@ page import="edu.nju.desserthouse.model.hci.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html/loose.dtd">
<html>
<head>
<s:head />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style_hci.css" rel="stylesheet">
<link href="css/style_ly.css" rel="stylesheet">
<link rel="stylesheet"
	href="//cdn.bootcss.com/font-awesome/4.5.0/css/font-awesome.min.css">
<title>凯罗伊西点 · 购物车</title>
</head>

<body>
	
	<div class="main">
		<div class="nav-top">
			<a href="/DessertHouse/shoppingCart"
				class="nav-top-item float-right active">购物车</a> <span
				class="nav-top-line float-right">|</span>
			<%
				if (session.getAttribute("memberInfo") == null) {
					System.out.println("here");
			%>
			<a href="/DessertHouse/signIn" class="nav-top-item float-right">会员登录</a>
			<%
				} else {
					Member m = (Member) session.getAttribute("memberInfo");
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
				class="nav-top-item float-right top-welcome">您好，<%=m.getCname()%><%=sex%></a>

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
					class="bread-nav-label"> > </span> <span class="bread-nav-now">订单结算</span>
			</div>
			<%
				if(session.getAttribute("sid")==null){
			%>
			<!-- 购物车主体 -->
			<div class="cart-div">
				<div class="title-div">
					<span class="name-span">商品</span> <span class="price-span">单价</span>
					<span class="mount-span">数量</span> <span class="total-span">祝语牌</span>
					<span class="total-span">小计</span>
				</div>
				<div class="check-item-div">
					<img src="img/dessert/17.jpg" class="check-img-item"></img>
					<div class="check-dis-div">
						<div class="cake-name-div padding-top-20">
							<span class="cart-name-item">黑糖核桃卷</span>
						</div>
						<div>
							<span class="cart-detail-item">规格：1磅&nbsp;夹馅：布丁 </span>
						</div>
						<div>
							<span class="cart-detail-item">含4套餐具 </span>
						</div>
					</div>
					<span class="check-price-div">￥23.0</span> <span
						class="check-mount-div">3</span>
					<div class="bless-div">
						<input type="text" name="bless" class="bless-input" />
					</div>
					<span class="check-total-div">￥333.0</span>
				</div>
				<div class="area-div">
					<div>
						<span class="area-span">提货站点：</span> <select class="area-select">
							<option>鼓楼区</option>
							<option>栖霞区</option>
						</select>
						<form class="area-form">
							<input type="radio" checked="checked" name="Sex" value="1" />一号站
							&nbsp;地址：珠江路糖果车站 &nbsp;联系电话:15850568637 <br> <input
								type="radio" checked="checked" name="Sex" value="2" />二号站
							&nbsp;地址：珠江路糖果车站 &nbsp;联系电话:15850568637
						</form>
					</div>
					<div>

						<span class="area-span">提货时间：</span>

					</div>
				</div>
				<div class="tail-div">
					<span class="cart-total-span">总计金额：￥333.0</span>
				</div>
				<div class="check-select-div">
					<a href="" class="check-continue-item">返回购物车</a>
					<a href="/DessertHouse/checkout" class="check-account-item">立即支付</a>
				</div>
			</div>
			<!-- 购物车主体结束 -->
			<% }else{
				String sid = (String)session.getAttribute("sid");
				String disname = (String)session.getAttribute("disname");
				String sname = (String)session.getAttribute("sname");
			} %>
		</div>

	</div>

	<div class="float-bar">
		<a href="" class="float-bar-item">TOP</a> <a
			href="/DessertHouse/shoppingCart" class="float-bar-item"
			onclick="javascript:document.getElementsByTagName('BODY')[0].scrollTop=0;">
			<i class="fa fa-shopping-cart fa-fw fa-lg shopping-cart-icon"></i> <br />购<br />物<br />车<br />
			<span class="badge css-badge">0</span>
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