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
<title>凯罗伊西点 · 门店</title>
</head>
<%
	List<Shop> shopList = (List<Shop>)request.getAttribute("sList");
	List<District> districtList = (List<District>)request.getAttribute("disList");
	int disid = (int)request.getAttribute("disid");
%>
<%
	int amount = 0;
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
				
				if(session.getAttribute("memberInfo")==null){
					System.out.println("here");
					
			%>
			<a href="/DessertHouse/signIn" class="nav-top-item float-right">会员登录</a> 
			<%}else{ 
				Member m = (Member)session.getAttribute("memberInfo");
				String sex = "";
				if(m.getSex()==0){
					sex = "先生";
				}else{
					sex = "女士";
				}
			%>
			<a href="/DessertHouse/myorder" class="nav-top-item float-right">订单</a> 
			<span class="nav-top-line float-right">|</span> 
			<a href="/DessertHouse/signOut" class="nav-top-item float-right">[退出]</a>
			<a href="/DessertHouse/selfInfo" class="nav-top-item float-right top-welcome">您好，<%=m.getCname() %><%=sex %></a> 
			
			<%} %>
			
			

		</div>
		<div class="search-panel">
			<a href="/DessertHouse/index"><img src="img/logo.png" class="logo float-left"
				alt="KARROY CAKE"></a>
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
			<a href="/DessertHouse/bread" class="nav-main-item "
				id="js-nav-1">面包<span class="float-right color-lanlv">|</span></a> <a
				href="/DessertHouse/cake" class="nav-main-item"
				id="js-nav-2">蛋糕<span class="float-right color-black">|</span></a> <a
				href="/DessertHouse/dessert" class="nav-main-item"
				id="js-nav-3">甜点<span class="float-right color-black">|</span></a> <a
				href="/DessertHouse/drinks" class="nav-main-item"
				id="js-nav-4">饮品<span class="float-right color-black">|</span></a> <a
				href="/DessertHouse/other" class="nav-main-item"
				id="js-nav-5">其他商品<span class="float-right color-white">|</span></a>
			<a href="/DessertHouse/shop" class="nav-main-item active"
				id="js-nav-6">门店</a>
		</div>
		<div class="main-panel">

				<div class="bread-nav-div">
					<a href="/DessertHouse/index" class="bread-nav-item">首页</a> <span
						class="bread-nav-label"> > </span> <span class="bread-nav-now">门店搜索</span>
				</div>
				<div class="shop-panel">
					<div class="shop-filter">
						<select class="shop-select" id="js-select-dis" onchange=disChange()>
							<option value='0'>所有地区</option>
							<%
								for (District dis : districtList) {
							%>
								<option value='<%=dis.getDisid() %>'
								<%if (dis.getDisid() == disid) {%> selected="selected" <%}%>><%=dis.getDisname()%></option>
							<%
								}
							%>
		      			</select>
					</div>
					<div class="shop-table-div">
						<table class="shop-table">
							<tr class="table-head">
								<th class="sname">门店</th>
								<th class="sadd">地址</th>
								<th class="stel">营业时间</th>
								<th class="stel">联系电话</th>
								<th class="sbtn"></th>
							</tr>
							
							<tbody>
								<%
									for(Shop shop:shopList){
								%>
								<tr class="table-row">
									<td class="sname text-align-center"><%=shop.getSname() %></td>
									<td class="sadd padding-left-70"><%=shop.getAddress() %></td>
									<td class="stel text-align-center"><%=shop.getOpenTime() %></td>
									<td class="stel text-align-center"><%=shop.getStel() %></td>
									<td class="sbtn padding-left-30">
										<form method="post" action="/DessertHouse/onlineOrder">
										<input class="shop-enter-btn" type="submit" name="<%=shop.getSid() %>-<%=shop.getDisname() %>-<%=shop.getSname() %>" value="在线点餐" />
										</form>
									</td>
								
								</tr>
								<%} %>
							</tbody>
						</table>
					</div>
				</div>
			
		</div>


	</div>

	<div class="float-bar">
		<a href="" class="float-bar-item">TOP</a> <a href="/DessertHouse/shoppingCart"
			class="float-bar-item" onclick="javascript:document.getElementsByTagName('BODY')[0].scrollTop=0;"> <i
			class="fa fa-shopping-cart fa-fw fa-lg shopping-cart-icon"></i> <br />购<br />物<br />车<br />
			<span class="badge css-badge"><%=amount %></span>
		</a>
	</div>

	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
	function disChange(){
		var disId = $("#js-select-dis").val();
		$.ajax({
			type : "post",
			url : "/DessertHouse/shop",
			async : false,
			data : {
				disid:disId,
			},
			success : function(data) {
				location.reload();
			},
			error : function() {
				alert("fail");
			}
		});
	}
		$(document).ready(function() {
			$("#js-nav-2").mouseover(function() {
				$("#js-nav-1").children("span").removeClass("color-lanlv");
				$("#js-nav-1").children("span").addClass("color-white");
				$("#js-nav-2").mouseout(function() {
					$("#js-nav-1").children("span").removeClass("color-white");
					$("#js-nav-1").children("span").addClass("color-lanlv");

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
				$("#js-nav-5").children("span").css("color","white");
				$("#js-nav-5").mouseout(function() {
					$("#js-nav-4").children("span").removeClass("color-white");
					$("#js-nav-4").children("span").addClass("color-black");

				});
			});

		})
		
	</script>
</body>
</html>