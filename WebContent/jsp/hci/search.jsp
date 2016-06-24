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
<link href="css/style_ly.css" rel="stylesheet">
<link rel="stylesheet"
	href="//cdn.bootcss.com/font-awesome/4.5.0/css/font-awesome.min.css">
<title>凯罗伊西点</title>
</head>
<%
	SearchVO svo = (SearchVO) request.getAttribute("svo");
	List<Shop> sList = svo.shopList;
	List<Dessert> dList = svo.dessertList;
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
				id="js-nav-1">面包<span class="float-right color-black">|</span></a> <a
				href="/DessertHouse/cake" class="nav-main-item"
				id="js-nav-2">蛋糕<span class="float-right color-black">|</span></a> <a
				href="/DessertHouse/dessert" class="nav-main-item"
				id="js-nav-3">甜点<span class="float-right color-black">|</span></a> <a
				href="/DessertHouse/drinks" class="nav-main-item"
				id="js-nav-4">饮品<span class="float-right color-black">|</span></a> <a
				href="/DessertHouse/other" class="nav-main-item"
				id="js-nav-5">其他商品<span class="float-right color-black">|</span></a>
			<a href="/DessertHouse/shop" class="nav-main-item"
				id="js-nav-6">门店</a>
		</div>
		<div class="main-panel">
			<div class="bread-nav-div">
				<a href="/DessertHouse/index" class="bread-nav-item">首页</a> <span
					class="bread-nav-label"> > </span> <span class="bread-nav-now">搜索结果</span>
			</div>
			<%
			if (sList.size() == 0) {
			%>
				<div class="search-filter">
					<p>无相关门店</p>
				</div>
			
			<%
				} else {
					
			%>
				<div class="search-filter">
					<p>门店搜索结果</p>
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
									for(Shop shop:sList){
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
			<%
				}if (dList.size() == 0) {
			%>
				<div class="search-filter">
					<p>无相关商品</p>
				</div>
			<%
				} else {
					
			%>
				<div class="search-filter ">
					<p>商品搜索结果</p>
				</div>
			<%
				for (Dessert d : dList) {
					if(d.getDiscription().length()<40){
			%>
			<div class="bread-content-div padding-left-30">
				<img src="<%=d.getImage()%>" class="bread-img-item"></img>
				<div class="bread-dscription-div">
					<div class="bread-name-div padding-left-30 padding-top-20">
						<span class="bread-name-item"><%=d.getName()%></span>
					</div>
					<div class="padding-left-30">
						<span class="bread-description-item"><%=d.getDiscription()%></span>
					</div>
				</div>
				<div class="bread-price-div">
					￥<%=d.getPrice()%></div>

				<div class="bread-cart-div">
					<div class="cart-plain-div"></div>
					<div class="cart-content-div">
						<i class="fa fa-plus-circle fa-lg add-icon"></i>
						<div class="add-text"
							id='<%=d.getDid()%>-<%= d.getName()%>-<%=d.getImage()%>-<%=d.getPrice()%>'
							onclick="addCart(this)">加入购物车</div>
					</div>
					<div class="cart-plain-div">
						<a href="javascript:void(0);" onclick="delFunc(this)" id = 'del-mount-<%= d.getDid()%>'
							class="minus-item"><i class="fa fa-minus cal"></i></a> 
							<input
							class="input-item" id = 'buy-amount-<%= d.getDid()%>' type="text" value="1" name="g"
							onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
							onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" />
						<a href="javascript:void(0);" onclick="addFunc(this)" id = 'add-mount-<%= d.getDid()%>'
							class="plus-item"><i class="fa fa-plus cal"></i></a>
					</div>
					<div class="cart-plain-div"></div>
				</div>
			</div>
			<%
				}else{
					
			%>
			<div class="bread-content-div padding-left-30">
					<img src='<%=d.getImage()%>' class="bread-img-item"></img>
					<div class="bread-dscription-div">
						<div class="cake-name-div padding-left-30 padding-top-20">
							<span class="bread-name-item"><%=d.getName()%></span>
						</div>
						<%
							String dis = d.getDiscription();
							String[]disArr = dis.split(";");
							for(String s:disArr){
						%>
						<div class="padding-left-30">
							<span class="cake-description-item"><%=s %></span>
						</div>
						<%} %>
					</div>
					<div class="cake-price-div">
						￥<%=d.getPrice()%>
						<%
							if (d.getPrice() < 2000) {
						%>/1.0磅<%
							}
						%>
					</div>
					<div class="bread-cart-div">
						<div class="cart-plain-div"></div>
						<div class="cart-content-div"
							id="js-btn-div-<%=d.getDid()%> " onclick='change(this)'>
							<form method="post" id="js-btn-<%=d.getDid()%>"
								target="_blank" action="/DessertHouse/cakeSpeci">

								<div class="">
									<i class="fa fa-plus-circle fa-lg add-icon"></i>
									<input  readonly="readonly" class="cake-input-btn" type="text" name="<%=d.getDid()%>" value="加入购物车" placeholder="加入购物车" />
								</div>
							</form>

						</div>
						<div class="cart-content-div"
							id="js-btn-div1-<%=d.getDid()%> " onclick='change(this)'>
							<form method="post" id="js-btn-<%=d.getDid()%>"
								target="_blank" action="/DessertHouse/cakeSpeci">

								<div class="">
									<i class="fa fa-plus-circle fa-lg add-icon"></i>
									<input  readonly="readonly" class="cake-input-btn" type="text" name="<%=d.getDid()%>" value="查看详情" placeholder="查看详情" />
								</div>
							</form>

						</div>
						<div class="cart-plain-div"></div>
					</div>
				</div>
			<%}}}
				%>
				</div>

		</div>

	<div class="float-bar">
		<a href="" class="float-bar-item">TOP</a> <a href="/DessertHouse/shoppingCart"
			class="float-bar-item" onclick="javascript:document.getElementsByTagName('BODY')[0].scrollTop=0;"> <i
			class="fa fa-shopping-cart fa-fw fa-lg shopping-cart-icon"></i> <br />购<br />物<br />车<br />
			<span class="badge css-badge">0</span>
		</a>
	</div>
<div id="toaster" class="toaster"></div>
<script type="text/javascript" src="js/script.js"></script>
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
			arr = id.split('-');
			var tmpId = "#buy-amount-"+arr[2];
			var mount = $(tmpId)[0].value;
			//alert(mount);
			mount ++;
			$(tmpId)[0].value = mount;
		}
		function delFunc(obj) {
			var id = obj.getAttribute("id");
			arr = id.split('-');
			var tmpId = "#buy-amount-"+arr[2];
			var mount = $(tmpId)[0].value;
			if(mount == 1)
				return;
			//alert(mount);
			mount --;
			$(tmpId)[0].value = mount;
		}
	</script>

	<script type="text/javascript">
		function addCart(obj) {
			var max = obj.getAttribute("id");
			arr = max.split('-');
			var id = arr[0];
			var dname = arr[1];
			var img = arr[2];
			var dprice = arr[3];
			
			var tmpId = "#buy-amount-"+id;
			//alert(tmpId);
			var dcount = $(tmpId).val();
			
			var dtype = "addItem";
			
			//alert(id +" id: "+ dcount +" count: ");
			
			$.ajax({
				type : "post",
				url : "/DessertHouse/shopCartManage",
				async : false,
				data : {
					did: id,
					name: dname,
					image: img,
					price: dprice,
					count: dcount,
					type: dtype,
				},
				success : function(data) {
					toaster("成功加入购物车！","success");
					location.reload();
				},
				error : function() {
					alert("购买失败");
				}
			});
			}
	</script>
	<script type="text/javascript">
		function change(obj) {
			var id = obj.getAttribute("id");
			arr = id.split('-');
			var did = arr[3];
			did = "#js-btn-" + did;
			$(did).submit();
		}
	</script>
</body>
</html>