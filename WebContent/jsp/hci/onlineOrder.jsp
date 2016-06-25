<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Map.Entry"%>
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
<title>凯罗伊西点 · 在线点单</title>
</head>
<%
	ShopListVO slvo = (ShopListVO)request.getAttribute("slvo");
	List<Shop> shopList = slvo.shopList;
	List<District> districtList = slvo.districtList;
	HashMap<Integer,List<Shop>> dpMap = slvo.dpMap;
	CatProVO cpvo = (CatProVO)request.getAttribute("cpvo");
	List<ProductCategory> pcList = cpvo.productCategoryList;
	List<Dessert> dessertList = cpvo.dessertList;
	HashMap<Integer,List<Dessert>> cpMap = cpvo.cpMap;
	String sid = (String)session.getAttribute("sid");
	String disname = (String)session.getAttribute("disname");
	String sname = (String)session.getAttribute("sname");
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
					class="bread-nav-label"> > </span> <span class="bread-nav-now">在线点单</span>
			</div>
			<div class="bread-filter">
				<span class="bread-nav-label">商品分类 : </span> <a
					href="javascript:void(0);" id="js-cake-1" onclick="select(this)"
					class="bread-filter-itemLy active">&nbsp;不限分类&nbsp;</a> <a
					href="javascript:void(0);" id="js-cake-2" onclick="select(this)"
					class="bread-filter-itemLy">&nbsp;面包&nbsp;</a> <a
					href="javascript:void(0);" id="js-cake-3" onclick="select(this)"
					class="bread-filter-itemLy">&nbsp;甜点&nbsp;</a> <a
					href="javascript:void(0);" id="js-cake-4" onclick="select(this)"
					class="bread-filter-itemLy">&nbsp;饮品&nbsp;</a> <a
					href="javascript:void(0);" id="js-cake-5" onclick="select(this)"
					class="bread-filter-itemLy">&nbsp;其他商品&nbsp;</a>
			</div>
			<div class="cake-div" id='js-1'>
				<%
					for (Entry<Integer, List<Dessert>> entry : cpMap.entrySet()) {
						List<Dessert> l = entry.getValue();
						for (Dessert d : l) {
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
				<%}} %>
			</div>
			<%
				for (int i = 2; i < pcList.size() + 2; i++) {
					ProductCategory pc = pcList.get(i - 2);
					List<Dessert> l = cpMap.get(pc.getPcid());
			%>
			<div class="cake-div" id='js-<%=i%>'>
				<%
					for (Dessert d : l) {
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
							onclick="addCart1(this)">加入购物车</div>
					</div>
					<div class="cart-plain-div">
						<a href="javascript:void(0);" onclick="delFunc1(this)" id = 'del-mount1-<%= d.getDid()%>'
							class="minus-item"><i class="fa fa-minus cal"></i></a> 
							<input
							class="input-item" id = 'buy-amount1-<%= d.getDid()%>' type="text" value="1" name="g"
							onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
							onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" />
						<a href="javascript:void(0);" onclick="addFunc1(this)" id = 'add-mount1-<%= d.getDid()%>'
							class="plus-item"><i class="fa fa-plus cal"></i></a>
					</div>
					<div class="cart-plain-div"></div>
				</div>
			</div>
				<%
					}
				%>
			</div>
			<%
				}
			%>
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
			mount --;
			$(tmpId)[0].value = mount;
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
		function select(obj) {
			$("#js-cake-1").removeClass("active");
			$("#js-cake-2").removeClass("active");
			$("#js-cake-3").removeClass("active");
			$("#js-cake-4").removeClass("active");
			var id = obj.getAttribute("id");
			arr = id.split('-');
			var index = arr[2];
			$("#js-cake-" + index).addClass("active");

			$("#js-1").hide();
			$("#js-2").hide();
			$("#js-3").hide();
			$("#js-4").hide();
			$("#js-" + index).show();
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
					//toaster("成功加入购物车！","success");
					alert("ok");
					location.reload();
				},
				error : function() {
					alert("购买失败");
				}
			});
			}
	</script>
	
	<!-- 1 -->
	<script type="text/javascript">
		function addFunc1(obj) {
			var id = obj.getAttribute("id");
			arr = id.split('-');
			var tmpId = "#buy-amount1-"+arr[2];
			var mount = $(tmpId)[0].value;
			//alert(mount);
			mount ++;
			$(tmpId)[0].value = mount;
		}
		function delFunc1(obj) {
			var id = obj.getAttribute("id");
			arr = id.split('-');
			var tmpId = "#buy-amount1-"+arr[2];
			var mount = $(tmpId)[0].value;
			if(mount == 1)
				return;
			mount --;
			$(tmpId)[0].value = mount;
		}
	</script>
	<script type="text/javascript">
		function addCart1(obj) {
			var max = obj.getAttribute("id");
			arr = max.split('-');
			var id = arr[0];
			var dname = arr[1];
			var img = arr[2];
			var dprice = arr[3];
			
			var tmpId = "#buy-amount1-"+id;
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
					//toaster("成功加入购物车！","success");
					alert("ok");
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