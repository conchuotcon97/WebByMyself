<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<aside class="main-sidebar"> <!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar"> <!-- Sidebar user panel (optional) -->
	<div class="user-panel">
		<div class="pull-left image">
			<img src="img/photo_large.png" class="img-circle" alt="User Image">
		</div>
		<div class="pull-left info">
			<p>Phượng</p>
			<!-- Status -->
			<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
		</div>
	</div>

	<!-- search form (Optional) -->
	<form action="#" method="get" class="sidebar-form">
		<div class="input-group">
			<input type="text" name="q" class="form-control"
				placeholder="Search..."> <span class="input-group-btn">
				<button type="submit" name="search" id="search-btn"
					class="btn btn-flat">
					<i class="fa fa-search"></i>
				</button>
			</span>
		</div>
	</form>
	<!-- /.search form --> <!-- Sidebar Menu -->
	<ul class="sidebar-menu">
		<!-- Optionally, you can add icons to the links -->
		<li class="active"><a href="home_admin.jsp"><i class="fa fa-home"></i> <span>Home</span></a></li>
		<li><a href="mail.jsp"><i class="fa fa-envelope-o"></i> <span>Mail</span></a></li>
		<li><a href="UserManager.jsp"><i class="fa fa-users"></i> <span>User</span></a></li>
		<li class="treeview"><a href="#"><i
				class="fa fa-shopping-bag"></i> <span>Sản phẩm</span> <span
				class="pull-right-container"> <i
					class="fa fa-angle-left pull-right"></i>
			</span> </a>
			<ul class="treeview-menu">
				<li><a href="product_managerment.jsp" class="fa fa-circle-o"> Danh
						sách sản phẩm</a></li>
				<li><a href="UpdateProduct.jsp" class="fa fa-circle-o">
						Thêm, Xóa , Cập nhật sản phẩm</a></li>
			</ul></li>

		<li><a href="loginAdmin.jsp"><i class="fa fa-sign-out"></i> <span>Sign
					out</span></a></li>
	</ul>
	<!-- /.sidebar-menu --> </section> <!-- /.sidebar --> </aside>
</body>
</html>