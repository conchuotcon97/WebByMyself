<%@page import="model.User"%>
<%@page import="model.Cart"%>
<%@page import="dao.ProductDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Products</title>
<style>
body {
	text-align: center;
}

table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: center;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}
</style>
</head>
<body>
	<jsp:include page="/exercises.jsp" />

	<%
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
	%>

	<select name="category" id="categoryId">
		<option selected value="none">None</option>
		<%
			for (int c = 0; c < CategoryDAO.getCategory().size(); c++) {
				Category cate = CategoryDAO.getCategory().get(c);
		%>
		<option value="<%=cate.getId()%>"><%=cate.getCategoryName()%>
		</option>
		<%
			}
		%>
	</select>

	<h2 style="color: blue">The list product current</h2>
	<span><%=cart.countItem()%></span>
	<table>
		<tr>
			<th>Product Code</th>
			<th>Name</th>
			<th>Image</th>
			<th>Price</th>
			<th></th>
			<th></th>
		</tr>


		<%
			String categoryId = "";
			if (request.getParameter("category") != null) {
				categoryId = request.getParameter("category");
			}
			if (categoryId.equals("none")) {
				for (Product p : ProductDao.getListProduct()) {
					System.out.print(p.toString());
					String productCode = p.getProductCode();
					String name = p.getProductName();
					String path = p.getImageUrl();
					double price = p.getPrice();
		%>
		<tr>
			<td><%=productCode%></td>
			<td><%=name%></td>
			<td><img src="<%=request.getContextPath() + "/" + path%>"
				style="width: 200px; height: 200px; border: 0"></td>
			<td><%=price%>Đ</td>
			<td>
				<form action="<%=request.getContextPath()%>/DeleteServlet"
					method="post">
					<input type="hidden" name="productCode" value="<%=productCode%>">
					<input style="background-color: #f44336;" type="submit"
						value="Delete">
				</form>
			</td>

			<td><form action="<%=request.getContextPath()%>/CartServlet">
					<input type="hidden" name="command" value="plus"> <input
						type="hidden" name="productCode" value="<%=productCode%>">
					<input style="background-color: #f44336;" type="submit"
						value="Add to cart">
					<!--  		<button class="btn btn-success" style="background-color: #f44336;"
							type="button">
							<a href="" style="color: white">Add to Cart </a>
						</button>
						-->
				</form></td>
		</tr>
		<%
			}
			} else

				for (Product p : ProductDao.getListProductByCategoryID(categoryId)) {
					System.out.print(p.toString());
					String productCode = p.getProductCode();
					String name = p.getProductName();
					String path = p.getImageUrl();
					double price = p.getPrice();
		%>

		<tr>
			<td><%=productCode%></td>
			<td><%=name%></td>
			<td><img src="<%=request.getContextPath() + "/" + path%>"
				style="width: 200px; height: 200px; border: 0"></td>
			<td><%=price%>Đ</td>
			<td>
				<form action="<%=request.getContextPath()%>/DeleteServlet"
					method="post">
					<input type="hidden" name="productCode" value="<%=productCode%>">
					<input style="background-color: #f44336;" type="submit"
						value="Delete">
				</form>
			</td>

			<td><form action="<%=request.getContextPath()%>/CartServlet">
					<input type="hidden" name="command" value="plus"> <input
						type="hidden" name="productCode" value="<%=productCode%>">
					<input style="background-color: #f44336;" type="submit"
						value="Add to cart">
					<!--  		<button class="btn btn-success" style="background-color: #f44336;"
							type="button">
							<a href="" style="color: white">Add to Cart </a>
						</button>
						-->
				</form></td>
		</tr>
		<%
			}
		%>
	</table>
	</div>
</body>
</html>