<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="edu.nju.desserthouse.model.*"%>
<%@ page import="edu.nju.desserthouse.model.hci.*"%>

<%@ page import="java.text.*" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style_hci.css" rel="stylesheet">
<link rel="stylesheet"
	href="//cdn.bootcss.com/font-awesome/4.5.0/css/font-awesome.min.css">
<title>凯罗伊西点 · 订单</title>
</head>
<%
	MyorderVO movo = (MyorderVO) request.getAttribute("movo");
	List<Order> orderList = movo.orderList;
	HashMap<Integer, List<OrderDetailVO>> oodMap = movo.oodMap;//key为oid
	HashMap<Integer, Shop> sidshopMap = movo.sidshopMap;
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
			<a href="/DessertHouse/myorder"
				class="nav-top-item float-right active">订单</a> <span
				class="nav-top-line float-right">|</span> <a
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
					class="bread-nav-label"> > </span> <span class="bread-nav-now">我的订单</span>
			</div>
			<div class="myorder-panel">
				<%
					for (Order o : orderList) {
						List<OrderDetailVO> od = oodMap.get(o.getOid());
				%>
				<div class="myorder-item">
					<div class="myorder-title">
						<span class="myorder-label"><%=o.getOrderTime()%></span> <span
							class="myorder-label">订单号：<%=o.getOid()%></span> <span
							class="myorder-label">消费门店：<%=sidshopMap.get(o.getSid()).getSname()%>(<%=sidshopMap.get(o.getSid()).getAddress() %>)</span>
						
					</div>
					<div class="myorder-dessert-item">
						<table class="myorder-table">
							<tr class="myorder-tr">
								<td class="myorder-item-td-img"><img src="<%=od.get(0).getImage()%>"
									class="myorder-img"></img></td>
								<td class="myorder-item-td-dname"><%=od.get(0).getDname()%>
									<%if(od.get(0).getDiscription()!=null){ %>
									<span><%=od.get(0).getDiscription() %></span>
									<%} %>
								</td>
								<td class="myorder-item-td-price">￥<%=od.get(0).getPrice() %></td>
								<td class="myorder-item-td-amount"><%=od.get(0).getAmount() %></td>
								<td class="myorder-item-sum-1" rowspan="<%=od.size()%>">
									<span class="myorder-item-sum-1-total">总价：</span><br/>
									实际支付：
								</td>
								<td class="myorder-item-sum-2" rowspan="<%=od.size()%>">
									<span class="myorder-item-sum-1-total">￥<%=o.getTotal() %></span><br/>
									￥<%=o.getRealTotal() %>
									</td>
								<td class="myorder-item-sum" rowspan="<%=od.size()%>">
								<%if(o.getIsValid()==0){ %>
								<span>订单已取消</span>
								<%}else{ %>
									<%	//在线点单
										if(o.getIsOnline()==0){
											
									%>
										<span>门店购买</span>
									<%}else { 
										//在线支付 再分
										if(!o.getSeat().equals("0")){
											//seat 不为0  在线点单
									%>
											<span class="myorder-item-state-span"><%=o.getSeat() %>桌</span>
											<br/><span>在线点单</span>
											
										<%}else{
											//seat为0，在线预订
											if(o.getVerification()==-1){
												//验证码失效 已取货
										%>	
												<span>已取货</span>
											<%}else{ 
												//没有取货 判断是否可以取消
												Calendar c = Calendar.getInstance();
												c.setTime(o.getTakeDate());
												int day = c.get(Calendar.DATE);
												c.set(Calendar.DATE, day - 1);
												String dayAfter = new SimpleDateFormat("yyyy-MM-dd").format(c.getTime());
												Date date = Date.valueOf(dayAfter);
												c = Calendar.getInstance();
												String dayCurr = new SimpleDateFormat("yyyy-MM-dd").format(c.getTime());
												Date dateCurr = Date.valueOf(dayCurr);
												if(date.compareTo(dateCurr)<0){
											%>
												<span>未取货(已过期)</span>
												<%} else{%>
												<!-- <button id='js-<%=o.getOid() %>' type="button" class="shop-enter-btn" onclick="cancelOrder(this) "  onmouseover="javascript:this.innerHTML='取消订单'" onmouseout="javascript:this.innerHTML='未取货'">未取货</button><br/> -->
												<span>未取货</span><br/>
												<span class="myorder-item-state-span">取货验证码：<%=o.getVerification() %></span>
												<%} %>
											<%} %>
										<%} %>
									<%} %>
									<%
										Calendar c = Calendar.getInstance();
										c.setTime(o.getTakeDate());
										int day = c.get(Calendar.DATE);
										c.set(Calendar.DATE, day - 1);
										String dayAfter = new SimpleDateFormat("yyyy-MM-dd").format(c.getTime());
										Date date = Date.valueOf(dayAfter);
										c = Calendar.getInstance();
										String dayCurr = new SimpleDateFormat("yyyy-MM-dd").format(c.getTime());
										Date dateCurr = Date.valueOf(dayCurr);
										if(date.compareTo(dateCurr)>=0){
											
									%>
									<%}} %>
								</td>
							</tr>
							<%
								for (int i = 1; i < od.size(); i++) {
							%>

							<tr class="myorder-tr">
								<td class="myorder-item-td-img"><img src="<%=od.get(i).getImage()%>"
									class="myorder-img"></img></td>
								<td class="myorder-item-td-dname"><%=od.get(i).getDname()%>
									<%if(od.get(i).getDiscription()!=null){ %>
									<span class="myorder-item-dis"><%=od.get(i).getDiscription() %></span>
									<%} %>
								</td>
								<td class="myorder-item-td-price">￥<%=od.get(i).getPrice() %></td>
								<td class="myorder-item-td-amount"><%=od.get(i).getAmount() %></td>
							</tr>

							<%
								}
							%>

						</table>
					</div>
				</div>
				<%
					}
				%>
			</div>

		</div>


	</div>

	<div class="float-bar">
		<a href="" class="float-bar-item">TOP</a> <a
			href="/DessertHouse/shoppingCart" class="float-bar-item"
			onclick="javascript:document.getElementsByTagName('BODY')[0].scrollTop=0;">
			<i class="fa fa-shopping-cart fa-fw fa-lg shopping-cart-icon"></i> <br />购<br />物<br />车<br />
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
	<script type="text/javascript" charset="utf-8">
		function cancelOrder(obj){
			var id = obj.getAttribute("id");
			id = id.substr(3);
			$.ajax({
				type : "post",
				url : "/DessertHouse/cancelMyOrder",
				async : false,
				data : {
					oid:id,
				},
				success : function(data) {
					toaster("取消订单成功！","success");
					location.reload();
				},
				error : function() {
					toaster("取消订单成功！","success");
					location.reload();
				}
			});
		}
	</script>
</body>
</html>