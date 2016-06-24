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
<title>凯罗伊西点</title>
</head>
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
			<div class="advertise">
				<div id="myCarousel" class="carousel slide">
					<!-- 轮播（Carousel）指标 -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>
					<!-- 轮播（Carousel）项目 -->
					<div class="carousel-inner">
						<div class="item active">
							<img src="img/lunbo/1.png" alt="First slide">
						</div>
						<div class="item">
							<img src="img/lunbo/2.png" alt="Second slide">
						</div>
						<div class="item">
							<img src="img/lunbo/3.png" alt="Third slide">
						</div>
					</div>
					<!-- 轮播（Carousel）导航 -->
					<a class="carousel-control left" href="#myCarousel"
						data-slide="prev">&lsaquo;</a> <a class="carousel-control right"
						href="#myCarousel" data-slide="next">&rsaquo;</a>
				</div>

			</div>
			<div class="pro-item-panel">
				<div class="pro-item">
					<img src="img/dessert/16.png" class="pro-item-img"  >
					<div class="pro-item-label">
						<span class="pro-item-money">¥18</span>
						<a href="javascript:void(0);"  onclick="addCart(this)" class="pro-item-add" id="js-11-迷你披萨风味面包-img/dessert/16.png-18">加入购物车</a>
					</div>
				</div>
				<div class="pro-item margin-6">
					<img src="img/dessert/11.jpg" class="pro-item-img"  >
					<div class="pro-item-label">
						<span class="pro-item-money">¥15</span>
						<a href="javascript:void(0);" onclick="addCart(this)" class="pro-item-add" id="js-6-奶油芝士面包-img/dessert/11.jpg-15">加入购物车</a>
					</div>
				</div>
				<div class="pro-item margin-6">
					<img src="img/dessert/12.jpg" class="pro-item-img"  >
					<div class="pro-item-label">
						<span class="pro-item-money">¥16</span>
						<a href="javascript:void(0);" onclick="addCart(this)" class="pro-item-add" id="js-7-红豆奶油包-img/dessert/12.jpg-16">加入购物车</a>
					</div>
				</div>
				<div class="pro-item margin-6">
					<img src="img/dessert/13.jpg" class="pro-item-img"  >
					<div class="pro-item-label">
						<span class="pro-item-money">¥10</span>
						<a href="javascript:void(0);" onclick="addCart(this)" class="pro-item-add" id="js-8-蒜香酥菠萝包-img/dessert/13.jpg-10">加入购物车</a>
					</div>
				</div>
				<div class="pro-item margin-6">
					<img src="img/dessert/20.jpg" class="pro-item-img"  >
					<div class="pro-item-label">
						<span class="pro-item-money">¥20</span>
						<a href="javascript:void(0);" onclick="addCart(this)" class="pro-item-add" id="js-14-黑糖核桃卷-img/dessert/20.jpg-20">加入购物车</a>
					</div>
				</div>
				<div class="pro-item margin-6">
					<img src="img/dessert/17.jpg" class="pro-item-img"  >
					<div class="pro-item-label">
						<span class="pro-item-money">¥14</span>
						<a href="javascript:void(0);" onclick="addCart(this)" class="pro-item-add" id="js-16-芝士蒸蛋糕-img/dessert/17.jpg-14">加入购物车</a>
					</div>
				</div>
			</div>
		</div>
<div id="toaster" class="toaster"></div>

	</div>

	<div class="float-bar">
		<a href="" class="float-bar-item">TOP</a> <a href="/DessertHouse/shoppingCart"
			class="float-bar-item" onclick="javascript:document.getElementsByTagName('BODY')[0].scrollTop=0;"> <i
			class="fa fa-shopping-cart fa-fw fa-lg shopping-cart-icon"></i> <br />购<br />物<br />车<br />
			<span class="badge css-badge">0</span>
		</a>
	</div>

	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript">
	 
		$(document).ready(function() {
			//toaster("创建新公告成功！","success");
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
		function addCart(obj) {
			var max = obj.getAttribute("id");
			arr = max.split('-');
			var id = arr[1];
			var dname = arr[2];
			var img = arr[3];
			var dprice = arr[4];
			
			var dcount = 1;
			
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
					alert("success");
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