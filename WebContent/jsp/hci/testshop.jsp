<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="edu.nju.desserthouse.model.*"%>
<%@ page import="edu.nju.desserthouse.model.hci.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="//cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
<title>testShop</title>
</head>
<body>
	<%
		boolean isSelected = false;
		List<TestCakeVO> allCakes = new ArrayList<TestCakeVO>();
		List<TestCakeVO> orderedCakes = new ArrayList<TestCakeVO>();
		List<TestCakeVO> remainCakes = new ArrayList<TestCakeVO>();

		TestCakeVO vo1 = new TestCakeVO("1", "vo1", "12");
		TestCakeVO vo2 = new TestCakeVO("2", "vo2", "12");
		TestCakeVO vo3 = new TestCakeVO("3", "vo3", "12");

		allCakes.add(vo1);
		allCakes.add(vo2);
		allCakes.add(vo3);
	%>
	<%
		if (session.getAttribute("allCakes") != null) {
			allCakes = (List<TestCakeVO>) session.getAttribute("allCakes");
		}
		if (session.getAttribute("orderedCakes") != null) {
			orderedCakes = (List<TestCakeVO>) session.getAttribute("orderedCakes");
		}
	%>
	<%
		if (request.getParameter("putCar") != null) {
			String[] selectedBK = request.getParameterValues("checked");
			Iterator<TestCakeVO> iterator = allCakes.iterator();
			while (iterator.hasNext()) { //对allBooks遍历
				TestCakeVO bvo = iterator.next();
				for (int i = 0; i < selectedBK.length; i++) {
					if (selectedBK[i].equals(bvo.getId())) {
						orderedCakes.add(bvo);
						isSelected = true;
						break;
					}
				} //isSelected代表是否在selectedBK中找到这本书，如果找到了，加入orderedBK
				if (isSelected) {
					isSelected = false;
				} else {
					remainCakes.add(bvo);//如果没被选上。加入remainBK
				}
			}
			allCakes = remainCakes;//现在所有的书变成没被选中的书
			remainCakes = new ArrayList();//remainBK清空
			System.gc();
			session.setAttribute("allCakes", allCakes);
			session.setAttribute("orderedCakes", orderedCakes);
		} else if (request.getParameter("showCart") != null) {
			response.sendRedirect("/DessertHouse/shoppingCart");
			return;
		}
	%>
	<br>
	<h3>面包店</h3>
	<form id="form1" name="form1" method="post" action="/DessertHouse/test">
		<%
			if (!allCakes.isEmpty()) {
		%>
		<table width="600" border="1" cellspacing="0" cellpadding="0">
			<tr>
				<td>选择</td>
				<td>名字</td>
				<td>价格</td>
			</tr>
			<%
				Iterator<TestCakeVO> iterator = allCakes.iterator();
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
				<td colspan="6"><input type="submit" name="putCar"
					value="放入购物车" />&nbsp;&nbsp;&nbsp; <input type="submit"
					name="showCart" value="查看购物车" /></td>
			</tr>
		</table>
		<%
			} else {
		%>
		<b>对不起,没有你要的蛋糕!</b>
		<p>
			<input type="submit" name="showCart" value="查看购物车" />
			<%
				}
			%>
	</form>
</body>
</html>