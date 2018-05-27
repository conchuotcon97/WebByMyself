<%@page import="dao.CategoryDAO"%>
<%@page import="model.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE >
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
<script src="plugins/ckeditor/ckeditor.js"></script>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
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
					Product<small>Trang quản lý thêm sản phẩm</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
					<li class="active">Here</li>
				</ol>
				<hr />
				<!-- quick email widget -->
				<div class="box box-info">
					<div class="box-header">
						<i class="fa fa-shopping-bag"></i>
						<h3 class="box-title">Thêm Sản Phẩm</h3>
						<!-- tools box -->
						<div class="pull-right box-tools">
							<button type="button" class="btn btn-info btn-sm"
								data-widget="remove" data-toggle="tooltip" title="Remove">
								<i class="fa fa-times"></i>
							</button>
						</div>
						<!-- /. tools -->
					</div>
					<div class="box-body">
						<form action="<%=request.getContextPath()%>/ProductManager"
							method="post">
							<div class="form-group">
								<input type="text" class="form-control" name="id"
									placeholder="Id sản phẩm ...">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" name="name"
									placeholder="Tên sản phẩm ...">
							</div>
							<div class="form-group">
								<label>Mô tả sản phẩm</label>
								<textarea class="form-textarea" id="noiDung" name="description"
									placeholder="Mô tả sản phẩm.."></textarea>
								<script type="text/javascript" language="javascript">
									CKEDITOR.replace('noiDung', {
										width : '500px',
										height : '300px'
									});
								</script>
							</div>
							<div class="form-group">
								<select name="category">
									<option seleted>Chọn loại sản phẩm</option>
									<%
										for (Category c : CategoryDAO.getCategorys()) {
									%>
									<option value="<%=c.getId()%>"><%=c.getCategoryName()%></option>
									<%
										}
									%>

								</select>
							</div>
							<div class="form-group">
								<input type="text" class="form-control" name="price"
									placeholder="Giá sản phẩm ...">
							</div>

							<div class="form-group">
								<input type="file" class="form-control" name="url"
									placeholder="Url hình ảnh ...">
							</div>

							<div class="box-footer clearfix">
								<input type="hidden" name="action" value="insert"> <input
									type="submit" class="pull-right btn btn-info"
									value="Thêm sản phẩm">
							</div>
						</form>
					</div>
				</div>

				<div class="box box-info">
					<div class="box-header">
						<i class="fa fa-shopping-bag"></i>
						<h3 class="box-title">Cập nhật Sản Phẩm</h3>
						<!-- tools box -->
						<div class="pull-right box-tools">
							<button type="button" class="btn btn-info btn-sm"
								data-widget="remove" data-toggle="tooltip" title="Remove">
								<i class="fa fa-times"></i>
							</button>
						</div>
						<!-- /. tools -->
					</div>
					<%
						String id = (String) request.getParameter("productCode");
						if (id == null) {
							id = "";
						}
					%>
					<div class="box-body">
						<form action="<%=request.getContextPath() %>/ProductManager"
							method="post">
							<div class="form-group">
								<input type="text" class="form-control" name="id"
									value="<%=id%>" placeholder="ID sản phẩm cần cập nhật ...">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" name="price"
									placeholder="Điều chỉnh giá tăng lên hoặc giảm xuống ...">
							</div>
							<%-- 	<div class="form-group">
							<input type="text" class="form-control" name="quantity"
								placeholder="Điều chỉnh số lượng ...">
						</div>
--%>
							<div class="box-footer clearfix">
								<input type="hidden" name="action" value="update"> <input
									type="submit" class="pull-right btn btn-primary"
									value="Cập nhật sản phẩm">
							</div>
						</form>
					</div>
				</div>
			</section>

			<!-- /.box-footer -->
			<!-- Main content -->
			<section class="content">
				<!-- Your Page Content Here -->
			</section>
			<!-- /.content -->
			<!-- /.content-wrapper -->
		</div>
		<!-- Main Footer -->
		<%@ include file="footer.jsp"%>

	</div>
	<!-- ./wrapper -->
	<!-- ./wrapper -->

	<!-- jQuery 2.2.3 -->
	<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
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
