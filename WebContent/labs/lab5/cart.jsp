<%@page import="dao.LineItemDao"%>
<%@page import="model.Cart"%>
<%@page import="model.LineItem"%>
<%@page import="dao.ProductDao"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cart page</title>
<style type="text/css">
.container_content_frist{ margin-top:10px;}


</style>
</head>
<body>
	<jsp:include page="/menu.jsp" />
	<div class="container_content_frist">
		<h2>Your cart</h2>
			<%
				Cart cart = (Cart) session.getAttribute("cart");
				if (cart == null) {
					cart = new Cart();
				}
				for (int i = 0; i < cart.getItems().size(); i++) {
					LineItem item = (LineItem) cart.getItems().get(i);
			%>
		<table>
			<tr>
				<th>Code</th>
				<th>Description</th>
				<th>Image</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Amount</th>
				<th></th>
			</tr>
			
			<tr>
				<td><%=item.getProduct().getProductCode()%></td>
				<td><%=item.getProduct().getProductName()%></td>
				<td><%=item.getProduct().getImageUrl()%></td>
				<td><%=item.getProduct().getPriceCurrencyFormat()%></td>

				<td>
					<form action="" method="post">
						<input type="hidden" name="productCode"
							value="<%=item.getProduct().getProductCode()%>"> <input
							type="text" name="quantity" value="<%=item.getQuantity()%>">
						<input type="submit" value="Update">
					</form>
				</td>
				<td><%=item.getTotalCurrencyFormat()%></td>
				<td><form action="" method="post">
						<input type="hidden" name="productCode"
							value="<%=item.getProduct().getProductCode()%>"> <input
							type="hidden" name="quantity" value="0"> <input
							type="submit" value="Remove">
					</form></td>
			</tr>



			<%
				}
			%>

		</table>

		<p>
			<b> To change the quantity, </b> enter the new quantity and click on
			the Update button.
		</p>
		<form action="" method="post">
			<input type="hidden" name="action" value="shop"> <input
				type="submit" value="Continue shopping">

		</form>
		<form action="" method="post">
			<input type="hidden" name="action" value="invoice"> <input
				type="submit" value="Invoice">

		</form>

	</div>
</body>
</html>