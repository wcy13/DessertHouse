<%@page import="java.awt.event.ItemEvent"%>
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
<link href="css/style_nxf.css" rel="stylesheet">
<link href="css/style_ly.css" rel="stylesheet">
<title>凯罗伊西点 · 购物车</title>
</head>
<body>
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
					class="bread-nav-label"> > </span> <span class="bread-nav-now">购物车</span>
			</div>
			<!-- 购物车主体 -->
			<div class="cart-div">
				<div class="title-div">
					<span class="name-span">商品</span> <span class="price-span">单价</span>
					<span class="mount-span">数量</span> <span class="total-span">小计</span>
					<span class="total-span">操作</span>
				</div>
				<%
					if (session.getAttribute("cart") != null) {
						ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
						Map<String, ShopItem> map = cart.getMap();
						for (String key : map.keySet()) {
							ShopItem item = map.get(key);
							DessertItem d = item.getDessert();
							int count = item.getCount();
				%>
				<div class="item-div" id = 'item-div-<%= item.getItemId()%>'>
					<img src=<%=d.getImage()%> class="cart-img-item"></img>
					<div class="cart-dis-div">
						<div class="cake-name-div padding-top-20">
							<span class="cart-name-item"><%=d.getName()%></span>
						</div>
						<%
							if (d.isCake()) {
						%>
						<div>
							<span class="cart-detail-item">规格：<%=d.getMount()%>磅&nbsp;夹馅：<%=d.getJ() %>
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
					<span class="cart-price-div">￥<%=d.getPrice()%></span>
					<div class="cart-change-div">
						<a href="javascript:void(0);" onclick="delFunc(this)"
							id='del--mount--<%=item.getItemId() %>--<%=d.getPrice() %>' class="minus-item-cake"> <i
							class="fa fa-minus cal-cake"></i>
						</a> <input class="input-item-cake" id='buy--amount--<%=item.getItemId() %>' type="text"
							value=<%= item.getCount() %> name="g"
							onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
							onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" />
						<a href="javascript:void(0);" onclick="addFunc(this)"
							id='add--mount--<%=item.getItemId() %>--<%=d.getPrice() %>' class="plus-item-cake"><i
							class="fa fa-plus cal-cake"></i></a>
					</div>
					<span class="cart-total-div" id = 'total-price-<%=item.getItemId()%>'>￥<%=item.getTotalPrice()%>
					</span> <span class="cart-delete-div"><i id = '<%=item.getItemId() %>'
						class="fa fa-trash-o fa-lg" onclick = "delCart(this)" ></i></span>
				</div>
				<%
					}
				%>
				<div class="tail-div" >
					<span class="cart-total-span" id = "total-prices">总计金额：￥<%=cart.getTotalPrices()%></span>
				</div>
				<%
					}
				%>
			</div>
			<div class="empty-div">
				<a href="javascript:void(0);" onclick="removeCart(this)"
					class="empty-item">清空购物车</a>
			</div>
			<div class="select-div">
				<a href="/DessertHouse/checkout" class="account-item">下单结算</a> <a
					href="" class="continue-item">继续购物</a>

			</div>
			<!-- 购物车主体结束 -->
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
	
	<script type="text/javascript">
		function addFunc(obj) {
			var id = obj.getAttribute("id");
			arr = id.split('--');
			var tmpId = "#buy--amount--"+arr[2];
			var mount = $(tmpId)[0].value;
			//alert(mount);
			mount ++;
			$(tmpId)[0].value = mount;
			$("#total-price-"+arr[2]).text("￥"+mount * arr[3]);
			$.ajax({
				type : "post",
				url : "/DessertHouse/shopCartManage",
				async : false,
				data : {
					did: arr[2],
					name: "",
					image: "",
					price: "",
					count: mount,
					type: "changeCount",
				},
				success : function(data) {
					//toaster("成功加入购物车！","success");
					location.reload();
				},
				error : function() {
					alert("购买失败");
				}
			});
		}
		function delFunc(obj) {
			var id = obj.getAttribute("id");
			arr = id.split('--');
			var tmpId = "#buy--amount--"+arr[2];
			var mount = $(tmpId)[0].value;
			if(mount == 1)
				return;
			mount --;
			$(tmpId)[0].value = mount;
			$("#total-price-"+arr[2]).text("￥"+mount * arr[3]);
			//$("#total-prices").text("总计金额：￥"+);
			$.ajax({
				type : "post",
				url : "/DessertHouse/shopCartManage",
				async : false,
				data : {
					did: arr[2],
					name: "",
					image: "",
					price: "",
					count: mount,
					type: "changeCount",
				},
				success : function(data) {
					//toaster("成功加入购物车！","success");
					location.reload();
				},
				error : function() {
					alert("购买失败");
				}
			});
		}
		function delCart(obj){
			var id = obj.getAttribute("id");
			var mount = 0;
			$("#item-div-"+id).hide();
			$.ajax({
				type : "post",
				url : "/DessertHouse/shopCartManage",
				async : false,
				data : {
					did: id,
					name: "",
					image: "",
					price: "",
					count: mount,
					type: "delItem",
				},
				success : function(data) {
					//toaster("成功加入购物车！","success");
					location.reload();
				},
				error : function() {
					alert("购买失败");
				}
			});
			
		}
		function removeCart(obj){
			$.ajax({
				type : "post",
				url : "/DessertHouse/shopCartManage",
				async : false,
				data : {
					did: "",
					name: "",
					image: "",
					price: "",
					count: 0,
					type: "removeCart",
				},
				success : function(data) {
					location.reload();
				},
				error : function() {
					alert("购买失败");
				}
			});
		}
	</script>
</body>
</html>