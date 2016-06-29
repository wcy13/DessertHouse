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
<link href="css/style_nxf.css" rel="stylesheet">
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
				<div>
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
				<div class="product-right-table">
					<!-- style="overflow-x: auto; overflow-y: auto; height: 300px; width:310px;" -->
					<table class="branch-table-dessert" id="branch-table-dessert">
						<tr class="branch-table-dessert-head">
							<!-- style="position: fixed;width: 310px; height: 25px;" -->
							<th class="dessert-did">商品编号</th>
							<th class="dessert-dname">商品</th>
							<th class="dessert-price">单价</th>
						</tr>
						<tbody id="js-table-dessert-body">
							<!-- border="1" align="center" width="310px" height="200px" -->
							<%
								for (ProductCategory pc : pcList) {
									int cateid = pc.getPcid();
									List<Dessert> tmplist = (List<Dessert>) cpMap.get(cateid);
									for (Dessert dessert : tmplist) {
							%>
							<tr class="branch-table-dessert-row pcid-<%=dessert.getPcid()%>"
								id='<%=dessert.getDid()%>-<%=dessert.getName()%>
							-<%=dessert.getPrice()%>'
								onclick="addCart(this)">
								<td class="dessert-did"><%=dessert.getDid()%></td>
								<td class="dessert-dname"><%=dessert.getName()%></td>
								<td class="dessert-price"><%=dessert.getPrice()%></td>
							</tr>
							<%
								}
								}
							%>
						</tbody>
					</table>
				</div>
			</div>

			<div class="branch-right-div price-table">
				<s:date name="orderDate" format="yyyy-MM-dd" />
				<div>
					<div class="price-up-table">
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
							<tr class="branch-table-sale-row" style="display: none">
								<td class="sale-did ">1</td>
								<td class="sale-dname">商品面包</td>
								<td class="sale-price">￥20.0</td>
								<td class="sale-amount">
									<a href="javascript:void(0);"
									onclick="delFunc(this)" id='del-mount'
									class="branch-minus-item-cake"> <i
										class="fa fa-minus branch-cal-cake"></i></a> 
										<input class="branch-input-item-cake" id='buy-amount' type="text"
									value="1" name="branch-input-item-cake"  />
									  <!-- onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
									onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" -->
									<a href="javascript:void(0);" onclick="addFunc(this)"
									id='add-mount' class="branch-plus-item-cake"><i
										class="fa fa-plus branchcal-cake"></i></a></td>
								<td class="sale-total" >小计</td>
								<td class="sale-action">
									<span>
									<i id ="trash" class="fa fa-trash-o fa-lg" onclick = "delCart(this)" ></i>
									</span>
								</td>
							</tr>
						</tbody>

					</table>
					</div>
					<div class="branch-table-sale-settlement">
						<div class="branch-table-sale-detail">
							<span class="total-label">总计：¥</span> <span class="total-price"><label
								id="should-pay-price">0</label></span>
						</div>
					</div>
					<div class="branch-table-sale-bottom">
						<div>
							<input name=paytype class="paytype" type="radio" value="card" />会员刷卡
							<input name="paytype" class="paytype" type="radio" value="phone"
								onclick="changeType()" />手机号验证 <input name="paytype"
								class="paytype" type="radio" value="cash" checked="checked"
								onclick="changeType()" />现金支付
						</div>

						<div class="cash-charge" id="pay-by-cash">
							<div>
								实收现金：¥ <input name="cash-reality" class="cash-reality-box"
									type="text" value="" />
							</div>
							<div>
								找零：¥ <span class="changes"> <label id="changes">0</label>
								</span>
							</div>
						</div>
						<div class="phone-verify" id="pay-by-phone">
							<div>
								<input name="phone-box" class="phone" type="text"
									placeholder="输入手机号" />
								<button class="get-verify-code phone">获取验证码</button>
							</div>
							<div>
								<input name="type-in-code" class="type-in-code" type="text"
									placeholder="输入验证码" />
							</div>
						</div>
						<button class="confirm">确认结算</button>
					</div>
				</div>
			</div>
		</div>

	</div>

	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="jquery.js"></script>

	<script type="text/javascript">
		$("input[name='cash-reality']").bind('input propertychange', function() {
			var should_pay = $("#should-pay-price").html();
			var cash = $(this).val();
			var label=document.getElementById("changes"); 
			var changes = (cash-should_pay);
			if (changes >=0)
				label.innerText= cash-should_pay; 
			else 
				label.innerText=0;
		});

		$("input[name='branch-input-item-cake']").bind('change', function() {
			alert(1);
			var amount = $(this).val();
			alert($(this).val());
		});


		 $(function(){
		        $('#js-input').bind('keypress',function(event){
		            if(event.keyCode == "13")    
		            {
			           var input= $('#js-input').val();
			           var tr = $("tr[id^="+input+"\-]");
			           
			           var id="";
			           if (tr.length!=0){
			        	   var children = tr.children();
			        	   children.each(function(){
				        	   id +=$(this).html()+"-";
				       		});
				       		var newtr = document.createElement("tr");
				       		newtr.setAttribute("id", id);
				       		addCart(newtr);
				            
			           } else {
				           alert("商品不存在");
				           }
		              $("#js-input").val("");
		               
		            }
		        });
		  });
		
	</script>

	<script type="text/javascript">
		function disChange(){
			
			var selected = $("#js-select-dis").val();
			var tab=document.getElementById("js-table-dessert-body");
		    var trs=tab.getElementsByTagName("tr");
			if (selected==0){
				var count=0;
				for (var i=0;i<trs.length;++i){
					trs[i].style.display="table-row";
					}
				//alert(count);
			} else if (selected==1){ //面包
			    //alert(trs.length);
			    var count = 0;
			    for(var i=0;i<trs.length;i++){
				    //alert(trs[i].className);
			        if (trs[i].className!="branch-table-dessert-row pcid-1"){
				        count++;
				        trs[i].style.display='none';
				      } else {
					      trs[i].style.display='table-row';
					  }
			        
			    }
			    //alert(count);
				
			} else if(selected==2){//蛋糕
			    //alert(trs.length);
			    var count = 0;
			    for(var i=0;i<trs.length;i++){
				    //alert(trs[i].className);
			        if (trs[i].className!="branch-table-dessert-row pcid-2"){
				        count++;
				        trs[i].style.display='none';
				      } else {
					      trs[i].style.display='table-row';
					  }
			        
			    }

			} else if (selected==3){//饮品
			    var count = 0;
			    for(var i=0;i<trs.length;i++){
				    //alert(trs[i].className);
			        if (trs[i].className!="branch-table-dessert-row pcid-3"){
				        count++;
				        trs[i].style.display='none';
				      } else {
					      trs[i].style.display='table-row';
					  }
			        
			    }
				
			} else if (selected==4){//甜点
			    var count = 0;
			    for(var i=0;i<trs.length;i++){
				    //alert(trs[i].className);
			        if (trs[i].className!="branch-table-dessert-row pcid-4"){
				        count++;
				        trs[i].style.display='none';
				      } else {
					      trs[i].style.display='table-row';
					  }
			        
			    }
			} else if (selected==7){//其他商品
			    var count = 0;
			    for(var i=0;i<trs.length;i++){
				    //alert(trs[i].className);
			        if (trs[i].className!="branch-table-dessert-row pcid-7"){
				        count++;
				        trs[i].style.display='none';
				      } else {
					      trs[i].style.display='table-row';
					  }
			        
			    }

			} else if (selected==8) {//鲜奶蛋糕
			    var count = 0;
			    for(var i=0;i<trs.length;i++){
				    //alert(trs[i].className);
			        if (trs[i].className!="branch-table-dessert-row pcid-8"){
				        count++;
				        trs[i].style.display='none';
				      } else {
					      trs[i].style.display='table-row';
					  }
			        
			    }
			} else if (selected==9) {//慕斯蛋糕
			    var count = 0;
			    for(var i=0;i<trs.length;i++){
				    //alert(trs[i].className);
			        if (trs[i].className!="branch-table-dessert-row pcid-9"){
				        count++;
				        trs[i].style.display='none';
				      } else {
					      trs[i].style.display='table-row';
					  }
			        
			    }
			} else if (selected==10){//冰淇淋蛋糕
			    var count = 0;
			    for(var i=0;i<trs.length;i++){
				    //alert(trs[i].className);
			        if (trs[i].className!="branch-table-dessert-row pcid-10"){
				        count++;
				        trs[i].style.display='none';
				      } else {
					      trs[i].style.display='table-row';
					  }
			        
			    }
			} else if ($selected==12){//婚庆蛋糕
			    var count = 0;
			    for(var i=0;i<trs.length;i++){
				    //alert(trs[i].className);
			        if (trs[i].className!="branch-table-dessert-row pcid-12"){
				        count++;
				        trs[i].style.display='none';
				      } else {
					      trs[i].style.display='table-row';
					  }
			        
			    }
			}
		}
	</script>

	<script type="text/javascript">
		function addCart(obj) {
			var max = obj.getAttribute("id");
			arr = max.split('-');
			
			var node = document.createElement("tr");
			node.className="branch-table-sale-row";
			node.id = "branch-table-sale-row-"+arr[0];
			var sale_did = document.createElement("td");
			sale_did.className="sale-did";
			sale_did.textContent=arr[0];
			var sale_dname = document.createElement("td");
			sale_dname.className="sale-dname";
			sale_dname.textContent=arr[1];
			var sale_price=document.createElement("td");
			sale_price.className="sale-price";
			sale_price.textContent=arr[2];
			var sale_total = document.createElement("td");
			sale_total.className="sale-total";
			sale_total.textContent=arr[2];
			
			node.appendChild(sale_did);
			node.appendChild(sale_dname);
			node.appendChild(sale_price);
			var old_amount = document.getElementsByClassName("sale-amount")[1];
			var new_amount = old_amount.cloneNode(true);

			new_amount.getElementsByTagName("a")[0].id += "-"+arr[0];
			new_amount.getElementsByTagName("a")[1].id += "-"+arr[0];
			new_amount.getElementsByTagName("input")[0].id += "-"+arr[0];
			
			node.appendChild(new_amount);
			node.appendChild(sale_total);

			var old_trash = document.getElementsByClassName("sale-action")[1];
			var new_trash = old_trash.cloneNode(true);
			new_trash.getElementsByTagName("i")[0].id += "-"+arr[0];
			node.appendChild(new_trash);
			

			//判断购物车中是否已经存在条目
			var id = arr[0];
			var table = document.getElementById("js-table-sale-body");
			var exist_items = $("#js-table-sale-body").find("tr");
			var exists = false;
			exist_items.each(function(){
				if ($(this).find(".sale-did").html()==id){
					var old = Number($(this).find(".branch-input-item-cake").val());
					$(this).find(".branch-input-item-cake").val(old+1);
					exists = true;
				}
			});
			if (!exists)
				table.appendChild(node);

			calTotal()
		}

		function delCart(obj){
			var id = obj.getAttribute("id");
			var no = id.split("-")[1];
			$("#branch-table-sale-row-"+no).remove();
			calTotal();
			}
	</script>
	<script type="text/javascript">
	function changeType(){
		var selectedvalue = $("input[name='paytype']:checked").val();
		if (selectedvalue == "cash") {
			$("#pay-by-cash").show();
			$("#pay-by-phone").hide();
		} else if (selectedvalue =="phone") {
			$("#pay-by-phone").show();
			$("#pay-by-cash").hide();
		}
	}
	</script>
	
	<script type="text/javascript">
		function addFunc(obj) {
			var id = obj.getAttribute("id");
			arr = id.split('-');
			var tmpId = "#buy-amount-"+arr[2];
			var mount = $(tmpId).val();
			//alert("mount:"+mount);
			mount ++;
			//alert("after:"+mount);
			$(tmpId).val(mount);
			calTotal();
		}
		function delFunc(obj) {
			var id = obj.getAttribute("id");
			arr = id.split('-');
			var tmpId = "#buy-amount-"+arr[2];
			var mount = $(tmpId).val();
			if(mount == 1)
				return;
			mount --;
			$(tmpId).val(mount);
			calTotal();
		}
	</script>
	
	<script type="text/javascript">
		function calTotal(){
			var total = 0;
			var index = 1;
			var table = $("#js-table-sale-body").find("tr").each(function(index, table){
				if (index >0){
					//var tds = $(this).children();
					var price = $(this).children(".sale-price").html();
					var number = $(this).find(".sale-amount").find("input").val();
					var t = price*number;
					total += t;
					var t_label = $(this).find(".sale-total").text(t);
				}

			});
			
			var label=document.getElementById("should-pay-price"); 
			label.innerText = total;
		}
	</script>



</body>
</html>