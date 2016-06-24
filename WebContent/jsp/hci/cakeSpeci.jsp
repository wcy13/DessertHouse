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
<title>凯罗伊西点 · 蛋糕详情</title>
</head>
<%
	Dessert d = (Dessert) request.getAttribute("cake");
	ProductCategory pc = (ProductCategory) request.getAttribute("pc");
	Cakediscription cd = (Cakediscription) request.getAttribute("cd");
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
				class="float-right color-white">|</span></a> <a
				href="/DessertHouse/cake" class="nav-main-item active" id="js-nav-2">蛋糕<span
				class="float-right color-lanlv ">|</span></a> <a
				href="/DessertHouse/dessert" class="nav-main-item" id="js-nav-3">甜点<span
				class="float-right color-black">|</span></a> <a
				href="/DessertHouse/drinks" class="nav-main-item " id="js-nav-4">饮品<span
				class="float-right color-black">|</span></a> <a
				href="/DessertHouse/other" class="nav-main-item" id="js-nav-5">其他商品<span
				class="float-right color-black">|</span></a> <a
				href="/DessertHouse/shop" class="nav-main-item" id="js-nav-6">门店</a>
		</div>
		<div class="main-panel">
			<div class="bread-nav-div">
				<a href="/DessertHouse/index" class="bread-nav-item">首页</a> <span
					class="bread-nav-label"> > </span> <a href="/DessertHouse/cake"
					class="bread-nav-item"><%=pc.getPcname()%></a> <span
					class="bread-nav-label"> > </span> <span class="bread-nav-now"><%=d.getName()%></span>
			</div>
			<div class="cake-content-div">
				<img src="<%=d.getImage()%>" class="cake-img-item"></img>
				<div class="cake-right-div">
					<div class="cake-name-div padding-top-20">
						<span class="cake-name-item"><%=d.getName()%></span>
					</div>
					<div>
						<span class="cake-price-label">价格：</span> <span
							class="cake-price-text">￥198.0</span>
					</div>
					<div class="spec-div ">
						<span class="cake-spe-label">选择规格：</span>
						<div class="spec-div-left">
							<div class="spec-field active" id = "mount-1" onclick = "changeMount(this)">1.0磅</div>
							<div class="spec-field" id = "mount-3" onclick = "changeMount(this)">3.0磅</div>
						</div>
						<div class="spec-div-right">
							<div class="spec-field" id = "mount-2" onclick = "changeMount(this)">2.0磅</div>
							<div class="spec-field" id = "mount-5" onclick = "changeMount(this)">5.0磅</div>
						</div>
					</div>
					<div class="spec-div padding-top-100">
						<span class="cake-spe-label">选择夹层：</span>
						<div class="spec-div-left">
							<div class="spec-field active" id="j-1" onclick = "changeJ(this)">时令水果</div>
							<div class="spec-field" id = "j-2" onclick = "changeJ(this)">奶油布丁</div>
						</div>
						<div class="spec-div-right ">
							<div class="spec-field" id = "j-3" onclick = "changeJ(this)">密豆</div>
							<div class="spec-field" id = "j-4" onclick = "changeJ(this)">果冻</div>
						</div>
					</div>
					<div class="mount-div padding-top-120">
						<div>
							<a href="javascript:void(0);" onclick="delFunc(this)"
								id='del-mount' class="minus-item-cake"> <i
								class="fa fa-minus cal-cake"></i>
							</a> <input class="input-item-cake" id='buy-amount'
								type="text" value="1" name="g"
								onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
								onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" />
							<a href="javascript:void(0);" onclick="addFunc(this)"
								id='add-mount' class="plus-item-cake"><i
								class="fa fa-plus cal-cake"></i></a>
						</div>
						<div class="cake-add-text"
							id='<%=d.getDid()%>-<%=d.getName()%>-<%=d.getImage()%>-<%=d.getPrice()%>' onclick="addCart(this)">加入购物车</div>
					</div>
					<div></div>
				</div>
			</div>
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
	<script>
		var m = 1;
		var j = 1;
		var mount = 1;
		function changeMount(obj){
			var id = obj.getAttribute("id");
			arr = id.split('-');
			m = arr[1];
			//alert("mount : "+mount);
			$("#mount-1").removeClass("active");
			$("#mount-2").removeClass("active");
			$("#mount-3").removeClass("active");
			$("#mount-5").removeClass("active");
			$("#mount-"+m).addClass("active");
		}
		
		function changeJ(obj){
			var id = obj.getAttribute("id");
			arr = id.split('-');
			j = arr[1];
			$("#j-1").removeClass("active");
			$("#j-2").removeClass("active");
			$("#j-3").removeClass("active");
			$("#j-4").removeClass("active");
			$("#j-"+j).addClass("active");
		}
		
		function addFunc(obj) {
			mount = $("#buy-amount")[0].value;
			//alert(mount);
			mount ++;
			$("#buy-amount")[0].value = mount;
		}
		function delFunc(obj) {
			mount = $("#buy-amount")[0].value;
			if(mount == 1)
				return;
			//alert(mount);
			mount --;
			$("#buy-amount")[0].value = mount;
		}
		function addCart(obj) {
			var max = obj.getAttribute("id");
			arr = max.split('-');
			var id = arr[0];
			var dname = arr[1];
			var img = arr[2];
			var dprice = arr[3];
			
			var dtype = "addItemCake-"+m+"-"+j;
			
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
					count: mount,
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
		$(document).ready(function() {

			$("#js-nav-1").mouseover(function() {
				$("#js-nav-1").children("span").css("color", "white");
				$("#js-nav-3").mouseout(function() {

				});
			});

			$("#js-nav-3").mouseover(function() {
				$("#js-nav-2").children("span").removeClass("color-lanlv");
				$("#js-nav-2").children("span").addClass("color-white");
				$("#js-nav-3").mouseout(function() {
					$("#js-nav-2").children("span").removeClass("color-white");
					$("#js-nav-2").children("span").addClass("color-lanlv");

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