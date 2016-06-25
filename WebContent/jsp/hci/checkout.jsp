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
<%
	ShopListVO slvo = (ShopListVO) request.getAttribute("slvo");
	List<District> districtList = slvo.districtList;
	HashMap<Integer, List<Shop>> dpMap = slvo.dpMap;
	List<Shop> shopList = slvo.shopList;
	int size = dpMap.size();
%>
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
				String sid = (String) session.getAttribute("sid");
				sid = null;
				if (sid == null) {
			%>
			<!-- 购物车主体 -->
			<div class="cart-div">
				<div class="title-div">
					<span class="name-span">商品</span> <span class="price-span">单价</span>
					<span class="mount-span">数量</span> <span class="total-span">祝语牌</span>
					<span class="total-span">小计</span>
				</div>
				<%
					if (session.getAttribute("cart") != null) {
							ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
							Map<String, ShopItem> map = cart.getMap();
							for (String key : map.keySet()) {
								ShopItem item = map.get(key);
								DessertItem d = item.getDessert();
								int count = item.getCount();
								double price = d.getPrice();
								double totalPrice = item.getTotalPrice();
								String name = d.getName();
								String img = d.getImage();
				%>

				<div class="check-item-div">
					<img src='<%=img%>' class="check-img-item"></img>
					<div class="check-dis-div">
						<div class="cake-name-div padding-top-20">
							<span class="cart-name-item"><%=name%></span>
						</div>
						<%
							if (d.isCake()) {
						%>
						<div>
							<span class="cart-detail-item">规格：<%=d.getMount()%>磅&nbsp;夹馅：<%=d.getJ()%>
							</span>
						</div>
						<div>
							<span class="cart-detail-item">含<%=d.getP()%>套餐具
							</span>
						</div>
						<%
							}
						%>
					</div>
					<span class="avi-check-price-div">￥<%=price%></span> <span
						class="avi-check-mount-div"><%=count%></span> <span
						class="avi-check-total-div"><%=totalPrice%></span>
				</div>

				<%
					}
				%>
				<div class="area-div">
					<div>
						<span class="area-span">提货站点：</span> <select id="area-select"
							class="area-select" onChange="changeArea(this)">
							<option>请选择地区</option>
							<%
								for (int i = 0; i < districtList.size(); i++) {
							%>
							<option id='area-<%=districtList.get(i).getDisid()%>'><%=districtList.get(i).getDisname()%></option>
							<%
								}
							%>
						</select> <select id="shop-select-all" class="area-select">
							<option>请选择商家</option>
							<%
								for (int i = 0; i < shopList.size(); i++) {
							%>
							<option id='shop-<%=shopList.get(i).getSid()%>'><%=shopList.get(i).getSname()%></option>
							<%
								}
							%>
						</select>
						<%
							for (int did : dpMap.keySet()) {
										List<Shop> sl = dpMap.get(did);
						%>
						<select id='shop-select-<%=did%>' class="area-select">
							<%
								for (int i = 0; i < sl.size(); i++) {
												String sname = sl.get(i).getSname();
												int sd = sl.get(i).getSid();
							%>
							<option id='shop-<%= sd%>'><%=sname %></option>
							<%
								}
							%>
						</select>
						<%
							}
						%>

					</div>
					<div>

						<span class="area-span">提货时间：</span>

					</div>
				</div>
				<div class="tail-div">
					<span class="cart-total-span">总计金额：￥<%=cart.getTotalPrices()%></span>
				</div>
				<div class="check-select-div">
					<a href="/DessertHouse/shoppingCart" class="check-continue-item">返回购物车</a>
					<a href="/DessertHouse/checkout" class="check-account-item">立即支付</a>
				</div>
				<%
					}
				%>

			</div>
			<!-- 购物车主体结束 -->
			<%
				} else {
					String disname = (String) session.getAttribute("disname");
					String sname = (String) session.getAttribute("sname");
			%>
			<!-- 购物车主体 -->
			<div class="cart-div">
				<div class="title-div">
					<span class="name-span">商品</span> <span class="arr-price-span">单价</span>
					<span class="arr-mount-span">数量</span> <span class="total-span">小计</span>
				</div>
				<%
					if (session.getAttribute("cart") != null) {
							ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
							Map<String, ShopItem> map = cart.getMap();
							for (String key : map.keySet()) {
								ShopItem item = map.get(key);
								DessertItem d = item.getDessert();
								int count = item.getCount();
								double price = d.getPrice();
								double totalPrice = item.getTotalPrice();
								String name = d.getName();
								String img = d.getImage();
				%>
				<div class="check-item-div">
					<img src='<%=img%>' class="check-img-item"></img>
					<div class="check-dis-div">
						<div class="cake-name-div padding-top-20">
							<span class="cart-name-item"><%=name%></span>
						</div>
						<%
							if (d.isCake()) {
						%>
						<div>
							<span class="cart-detail-item">规格：<%=d.getMount()%>磅&nbsp;夹馅：<%=d.getJ()%>
							</span>
						</div>
						<div>
							<span class="cart-detail-item">含<%=d.getP()%>套餐具
							</span>
						</div>
						<%
							}
						%>
					</div>
					<span class="avi-check-price-div">￥<%=price%></span> <span
						class="avi-check-mount-div"><%=count%></span> <span
						class="avi-check-total-div"><%=totalPrice%></span>
				</div>
				<%
					}
				%>
				<div class="area-div">
					<span class="area-span-1">您当前所在店铺：&nbsp;</span> <span
						class="area-span-2"><%=sname%>&nbsp;</span> <span
						class="area-span-3">地址：<%=disname%></span>
					<div class="seat-div">
						<span class="area-span-1">请输入您的座位号： </span> <input
							class="area-input" />
					</div>
				</div>
				<div class="tail-div">
					<span class="cart-total-span">总计金额：￥<%=cart.getTotalPrices()%></span>
				</div>

				<div class="check-select-div">
					<a href="/DessertHouse/shoppingCart" class="check-continue-item">返回购物车</a>
					<a href="/DessertHouse/checkout" class="check-account-item">立即支付</a>
				</div>
				<%
					}
				%>
			</div>
			<!-- 购物车主体结束 -->
			<%
				}
			%>
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
		var area = "all";
		$(document).ready(function() {
			$("#shop-select-all").show();
			for(var i=0;i<<%= size%>
		; i++) {
				var p = i + 1;
				$("#shop-select-" + p).hide();
			}
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

		function changeArea(obj) {
			//alert(obj.options[obj.selectedIndex].id);
			var id = obj.options[obj.selectedIndex].id;
			var intGet = obj.options[obj.selectedIndex].id.split('-')[1];
			//alert(intGet);
			$("#shop-select-all").hide();
			for(var i = 0 ; i < <%=size%> ; i ++)
				{
				var p = i + 1;
				$("#shop-select-" + p).hide();
				}
			$("#shop-select-"+ intGet).show();
		}
	</script>
	<script type="text/javascript">
		
	</script>
</body>
</html>