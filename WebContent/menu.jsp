<%@page import="dao.MenuDao"%>
<%@page import="model.Menu"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Menu</title>
<!-- STYLESHEETS -->

</head>
<body>
	<!-- START NAVIGATION -->
	<div
		class="navbar navbar-default bs-dos-nav navbar-fixed-top sticky-navigation"
		role="navigation">
		<div class="container">

			<div class="navbar-header">
				<button class="navbar-toggle" data-toggle="collapse"
					data-target="#rock-navigation">
					<span class="icon icon-bar"></span> <span class="icon icon-bar"></span>
					<span class="icon icon-bar"></span>
				</button>
				<a href="#" class="navbar-brand">Tipi</a>
			</div>
			<nav class="collapse navbar-collapse" id="rock-navigation">
				<ul
					class="nav navbar-nav navbar-right main-navigation text-uppercase">
					<!------------------ tạo menu động  ---------------------------------------------------------------------------->




					<li><a href="<%=request.getContextPath()%>/#home"
						class="smoothScroll">Home</a></li>
					<li><a href="<%=request.getContextPath()%>/#work"
						class="smoothScroll">My Work</a></li>
					<li><a href="<%=request.getContextPath()%>/#portfolio"
						class="smoothScroll">Portfolio</a></li>
					<li><a href="<%=request.getContextPath()%>/#resume"
						class="smoothScroll">Resume</a></li>
					<li><a href="<%=request.getContextPath()%>/#about"
						class="smoothScroll">About</a></li>
					<li><a href="<%=request.getContextPath()%>/#contact"
						class="smoothScroll">Contact</a></li>
					<li>
						<div class="col-md-2">
							<div class="dropdown ">
								<button class="btn btn-primary dropdown-toggle" type="button"
									data-toggle="dropdown" style="background: #008080;">
									Exercises <span class="caret"></span>
								</button>

								<ul class="dropdown-menu">
									<li><a 
										href="<%=request.getContextPath()%>/labs/lab2/login.jsp">Lab
											1</a></li>
									<li><a 
										href="<%=request.getContextPath()%>/labs/lab2/login.jsp">Lab
											2</a></li>
									<li><a 
										href="<%=request.getContextPath()%>/labs/lab3/reg.jsp">Lab
											3</a></li>
									<li><a class="dropdown-item"
										href="<%=request.getContextPath()%>/labs/lab3/reg.jsp">Lab
											4</a></li>
								<%--	<li><a class="dropdown-item"
										href="<%=request.getContextPath()--%>/labs/lab5/products.jsp">Lab
											5</a></li>
									<li><a class="dropdown-item"
										href="<%=request.getContextPath()%>/labs/lab6/settingConnect.jsp">Lab6</a></li>
									<li><a class="dropdown-item"
										href="<%=request.getContextPath()%>/labs/lab7/..">Lab 7</a></li>
									<li><a class="dropdown-item"
										href="<%=request.getContextPath()%>/labs/lab8/upload.jsp">Lab8</a></li>  --%>
								</ul>
							</div>
						</div>
					</li>

				</ul>
			</nav>

		</div>
	</div>

	<!-- END NAVIGATION -->
	<!-- 	<script src="js/jquery.js"></script> -->
	<!-- 	<script src="js/bootstrap.min.js"></script> -->
	<!-- 	<script src="js/smoothscroll.js"></script> -->
	<!-- 	<script src="js/jquery.nav.js"></script> -->
	<!-- 	<script src="js/isotope.js"></script> -->
	<!-- 	<script src="js/imagesloaded.min.js"></script> -->
	<!-- 	<script src="js/custom.js"></script> -->
</body>
</html>