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
<%
		List<String> telList = (List<String>)request.getAttribute("telList");
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
			<a href="/DessertHouse/signIn" class="nav-top-item float-right">会员登录</a> 
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
			<div class="signin-panel">
				<div class="signin-div">
					<div class="signin-label">会 员 登 录</div>
				 	<form action="/DessertHouse/signInValidate" method="post" class="">
				 		<div class="">
		      				<s:textfield name="tel" id="js-input" class="signin-input" placeholder="请输入手机号"  onblur="myFunction(this);"/>
		         			<label id="js-check-label"></label>
		   				</div>
		   				<div class="">
		      				<s:password name="password" class="signin-input" placeholder="请输入密码"/>
		   				</div>
		   				<input type="submit" class="signin-btn" value="登陆" id="sign-btn"/>
		   				</form>
				</div>
			</div>
			
		</div>


	</div>
<div id="toaster" class="toaster"></div>
	<div class="float-bar">
		<a href="" class="float-bar-item">TOP</a> <a href="/DessertHouse/shoppingCart"
			class="float-bar-item" onclick="javascript:document.getElementsByTagName('BODY')[0].scrollTop=0;"> <i
			class="fa fa-shopping-cart fa-fw fa-lg shopping-cart-icon"></i> <br />购<br />物<br />车<br />
			<span class="badge css-badge"><%=amount %></span>
		</a>
	</div>

	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript">
	
	function myFunction(obj){
		var text = $("#js-input").val();
		var myArray=new Array();
		<%
			for(int i=0;i<telList.size();i++){
				%>
				myArray[<%=i %>] = <%=telList.get(i) %>
				<%
			}
		%>
		var x = 0;
		if(text.length>0){
			for(var i=0;i<myArray.length;i++){
				if(text==myArray[i]){
					x=1;
				}
			}
		}else{
			x = 2;
		}
		if(x==1){
			//账号正确
			$("#js-check-label").html('<span class="input-check color-lanlv"><i class="fa fa-check fa-fw"></i></span>');
		}else if(x==0){
			//账号不存在
			$("#js-check-label").html('<span class="input-check color-red"><i class="fa fa-close fa-fw"></i>账号不存在</span>');
		}
	}
		$(document).ready(function() {
			toaster("密码错误","error");
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
		
		$("#sign-btn").mouseover(function() {
			$("#sign-btn").css("background", "rgba(41,205,181,0.8)");
			$("#sign-btn").css("color", "rgba(255,255,255,0.8)");
				$("#sign-btn").mouseout(function() {
					$("#sign-btn").css("background", " rgba(41,205,181,1)");
					$("#sign-btn").css("color", "white");
				});
			});
	</script>
</body>
</html>