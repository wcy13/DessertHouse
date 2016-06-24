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
			<a href="/DessertHouse/shoppingCart" class="nav-top-item float-right active">购物车</a>
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
					class="bread-nav-label"> > </span> <span class="bread-nav-now">购物车</span>
			</div>
			<!-- 购物车主体 -->
			<div id="cart_container" class="cart-container">
				<!-- 购物车内容 -->
				<table id="cart_main" class="cart-main" width=100%>
					<colgroup>
					<col class="col-1">
					<col class="col-2">
					<col class="col-3">
					<col class="col-4">
					<col class="col-5">
					<col class="col-6">
					</colgroup>
					<thead>
						<tr>
							<th colspan="2">商品</th>
							<th>单价</th>
							<th>数量</th>
							<th>小计</th>
							<th>操作</th>
						</tr>
					</thead>
					<!-- 购物车条目 -->
					<tbody class="cart-item">
						<tr class="cart-procuct last">
							<td>
								<div class="p-pic">
									<a href="#" target="_blank"><img src="img/dessert/10.png" alt="蛋糕嘤嘤嘤"></a>
								</div>
							</td>
							<td class="p-info">
								<div class="p-title">
									<a target="_blank", src="#">Bailey's Love Triangle 百利甜情人</a>
								</div>
								<div class="p-spec">
								规格：3磅 夹馅：布丁 含四套餐具
								</div>
							</td>
							<td class="p-price">¥498</td>
							<td>
								<div class="p-quantity">
									<a href="#" class="btn-decrease">-</a>
									<input type="text" name="modify_quantity[][]" value="1" />
									<a href="#" class="btn-increase">+</a>
								</div>
							</td>
							<td class="p-subtotal">¥498</td>
							<td class="p-action">
								<a href="#" class="btn-delete">
									移除
								</a>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr class="hr-bg">
							<td colspan="3">
							</td>
							<!--订单价格 -->
							<td colspan="4" class="order-price">
								<ul>
									<li class="total">
										<span class="label">
											<em>总计金额:</em>
										</span>
										<span class="price">
											<span class="ico">¥</span>
											<b>498</b>
										</span>
									</li>
								</ul>
								
							</td>
						</tr>
						<tr>
							<td colspan="3" class="cart-left"></td>
							<td colspan="4" class="cart-right">
								<span class="clear-all">
									<a href="#"> 清空购物车</a>
								</span>
							</td>
						</tr>
						<tr>
							<!-- 按钮 -->
							<td colspan="3" class="cart-left"></td>
							<td colspan="4" class="cart-right">
								<a href="#" class="btn-link">继续购物</a>
								<button class="btn btn-huge">
									<span>下单结算</span>
								</button>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
			<%
			Iterator<TestCakeVO> iterator = orderedCakes.iterator();
		%>
		你选购的蛋糕： <br>
		<form method="post" action="/DessertHouse/shoppingCart">
		<%
			if (!orderedCakes.isEmpty()) {
		%>
		
			<table width="600" border="1" cellspacing="0" cellpadding="0">
				<tr>
					<td>选择</td>
					<td>名字</td>
					<td>价格</td>
				</tr>
				<%
					while (iterator.hasNext()) {
							TestCakeVO bvo = iterator.next();
				%>
				<tr>
					<td><input name="checked" type="checkbox"
						value=<%=bvo.getId()%> /></td>
					<td><%=bvo.getName()%></td>
					<td><%=bvo.getPrice()%></td>
				</tr>
				<%
					}
				%>
				<tr>
					<td colspan="6"><input type="submit" name="goBack"
						value="放回货架" />&nbsp;&nbsp;&nbsp;<input type="submit"
						name="continue" value="继续购物" /></td>
				</tr>
			</table>
			
			<%
				}else{
			%>
			<b>对不起,您的购物车里面没有东西!</b>
			<p>
			<input type="submit" name="continue" value="继续购物" />
			<% }%>
			</form>
		</div>


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