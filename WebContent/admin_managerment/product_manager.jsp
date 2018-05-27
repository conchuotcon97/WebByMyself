<%@page import="dao.ProductDao"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Admin | Product</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect.
  -->
<link rel="stylesheet" href="dist/css/skins/skin-blue.min.css">
<link rel="stylesheet"
	href="http://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

<script
	src="http://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
<script
	src="http://cdn.datatables.net/plug-ins/1.10.13/sorting/alt-string.js"></script>

<script>
	$(document).ready(function() {
		$('#myTable1').DataTable({

		});

	});
</script>
<style>
* {
	box-sizing: border-box;
}

.input {
	background-image: url('/css/searchicon.png');
	background-position: 10px 10px;
	background-repeat: no-repeat;
	width: 100%;
	font-size: 16px;
	padding: 12px 20px 12px 40px;
	border: 1px solid #ddd;
	margin-bottom: 12px;
}

.table {
	border-collapse: collapse;
	width: 100%;
	border: 1px solid #ddd;
	font-size: 18px;
	font-family: monospace;
}

.table th, .table td {
	text-align: left;
	padding: 12px;
}

.table tr {
	border-bottom: 1px solid #ddd;
}

.table tr.header, .table tr:hover {
	background-color: #f1f1f1;
}
</style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<%@ include file="header.jsp"%>
		<%@ include file="menubar.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h1>
				Product<small>Trang quản lý danh sách sản phẩm</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
				<li class="active">Here</li>
			</ol>
			<br>
			<h2>Danh Sách Sản Phẩm</h2>



			<table id="myTable1" class="table">
				<a href="UpdateProduct.jsp" type="button" class="btn btn-success">
					<span class="glyphicon glyphicon-plus"></span> THÊM SẢN PHẨM
				</a>
				 <a href="ChartController?action=print"
								type="button" class="btn btn-success"><span
									class="glyphicon glyphicon-print "></span> In ấn</a>
				<br />
				<thead>
					<tr class="header">
						<th>ID</th>
						<th>Tên Sản Phẩm</th>
						<th>Mô tả sản phẩm</th>
						<th>Giá Tiền</th>
						<th></th>
						<th></th>

					</tr>
				</thead>
				<tbody>
					<%
						for (Product p : ProductDao.getListProduct()) {
					%>
					<tr>
						<td><%=p.getProductCode()%></td>
						<td><%=p.getProductName()%></td>
						<td><%=p.getProductDescription()%></td>
						<td><%=p.getPriceCurrencyFormat()%></td>
						<td>
							<form action="<%=request.getContextPath() %>/ProductManagerServlet" method="get">
								<input type="hidden" name="producCode"
									value="<%=p.getProductCode()%>">
								<input type="hidden" name="action"
									value="delete">
								<button type="submit" class="btn btn-danger">
									<span class="glyphicon glyphicon-remove"></span> Xóa
								</button>
							</form>
						</td>
						<td><a
							href="UpdateProduct.jsp?productCode=<%=p.getProductCode()%>"
							type="button" class="btn btn-primary"> <span
								class="glyphicon glyphicon-refresh"></span> Cập Nhật
						</a></td>


					</tr>
					<%
						}
					%>

				</tbody>
			</table>
		</div>
		<!-- Main Footer -->
		<%@ include file="footer.jsp"%>


		<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
		<script>
			$.widget.bridge('uibutton', $.ui.button);
		</script>
		<!-- Bootstrap 3.3.6 -->
		<script src="bootstrap/js/bootstrap.min.js"></script>
		<!-- Morris.js charts -->
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
		<script src="plugins/morris/morris.min.js"></script>
		<!-- Sparkline -->
		<script src="plugins/sparkline/jquery.sparkline.min.js"></script>
		<!-- jvectormap -->
		<script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
		<script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
		<!-- jQuery Knob Chart -->
		<script src="plugins/knob/jquery.knob.js"></script>
		<!-- daterangepicker -->
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
		<script src="plugins/daterangepicker/daterangepicker.js"></script>
		<!-- datepicker -->
		<script src="plugins/datepicker/bootstrap-datepicker.js"></script>
		<!-- Bootstrap WYSIHTML5 -->
		<script
			src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
		<!-- Slimscroll -->
		<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
		<!-- FastClick -->
		<script src="plugins/fastclick/fastclick.js"></script>
		<!-- AdminLTE App -->
		<script src="dist/js/app.min.js"></script>
		<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
		<script src="dist/js/pages/dashboard.js"></script>
		<!-- AdminLTE for demo purposes -->
		<script src="dist/js/demo.js"></script>
</body>
</html>
