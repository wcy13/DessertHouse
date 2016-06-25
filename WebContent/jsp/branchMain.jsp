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
	CatProVO cpvo = (CatProVO) request.getAttribute("cpvo");
	List<ProductCategory> pcList = cpvo.productCategoryList;
	List<Dessert> dessertList = cpvo.dessertList;
	HashMap<Integer, List<Dessert>> cpMap = cpvo.cpMap;
%>
<body>
	<div class="main">
		<div class="nav-top">
			<a href="/DessertHouse/logout" class="nav-top-item float-right">注销</a>
		</div>

		<div class="branch-main-div">
			<div class="branch-left-div">
				<div class="search-panel">
					<a href="#"><img src="img/logo.png" class="logo-branch "
						alt="KARROY CAKE"></a>
				</div>
				<div>
					<input type="text" name="id" id="js-input" class="branch-did-input"
						placeholder="输入商品编号并回车" />
				</div>
				<div class="">
					<span class="branch-select-label">忘记商品编号？</span> <select
						class="branch-dessert-select" id="js-select-dis"
						onchange=disChange()>
						<option value='0'>选择商品分类</option>
						<%
							for (ProductCategory pc : pcList) {
						%>
						<option value='<%=pc.getPcid()%>'><%=pc.getPcname()%></option>
						<%
							}
						%>
					</select>
				</div>
				<br />
				<div>
					<table class="branch-table-dessert">
						<tr class="branch-table-dessert-head">
							<th class="dessert-did">商品编号</th>
							<th class="dessert-dname">商品</th>
							<th class="dessert-price">单价</th>
						</tr>
						<tbody id="js-table-dessert-body">
							<tr class="branch-table-dessert-row">
								<td class="dessert-did ">1</td>
								<td class="dessert-dname">商品面包</td>
								<td class="dessert-price">￥20.0</td>
							</tr>
							<tr class="branch-table-dessert-row">
								<td class="dessert-did">1</td>
								<td class="dessert-dname">商品面包</td>
								<td class="dessert-price">￥20.0</td>
							</tr>
							<tr class="branch-table-dessert-row">
								<td class="dessert-did">1</td>
								<td class="dessert-dname">商品面包</td>
								<td class="dessert-price">￥20.0</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div class="branch-right-div">
			 <s:date name="orderDate" format="yyyy-MM-dd" /> 
				<div>
					<table class="branch-table-sale">
						<tr class="branch-table-sale-head">
							<th class="sale-did">商品编号</th>
							<th class="sale-dname">商品</th>
							<th class="sale-price">单价</th>
							<th class="sale-amount">数量</th>
							<th class="sale-total">小计</th>
							<th class="sale-action"></th>
						</tr>
						<tbody id="js-table-sale-body">
							<tr class="branch-table-sale-row">
								<td class="salet-did ">1</td>
								<td class="sale-dname">商品面包</td>
								<td class="sale-price">￥20.0</td>
								<td class="sale-amount">
									<a href="javascript:void(0);"
										onclick="delFunc(this)" id='del-mount'
										class="branch-minus-item-cake"> <i
											class="fa fa-minus branch-cal-cake"></i></a> 
											<input class="branch-input-item-cake" id='buy-amount'
										type="text" value="1" name="g"
										onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
										onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" />
										<a href="javascript:void(0);" onclick="addFunc(this)"
										id='add-mount' class="branch-plus-item-cake"><i
											class="fa fa-plus branchcal-cake"></i></a>
								</td>
								<td class="sale-total">小计</td>
								<td class="sale-action"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>


	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>

</body>
</html>