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
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/templatemo-style.css">
<link href='//fonts.googleapis.com/css?family=Raleway:400,300,600,700'
	rel='stylesheet' type='text/css'>
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
					<%
						ArrayList<Menu> lstMenu = MenuDao.getMenuList();
						for (int i = 0; i<lstMenu.size(); i++) {
							Menu m = lstMenu.get(i);
					%>

					<li><a href="<%=request.getContextPath() + "/" + m.getPath()%>"
						class="smoothScroll"><%=m.getName()%></a></li>

					<%
						}
					%>
					<!--  
					<li><a href="#home" class="smoothScroll">Home</a></li>
					<li><a href="#work" class="smoothScroll">My Work</a></li>
					<li><a href="#portfolio" class="smoothScroll">Portfolio</a></li>
					<li><a href="#resume" class="smoothScroll">Resume</a></li>
					<li><a href="#about" class="smoothScroll">About</a></li>
					<li><a href="#contact" class="smoothScroll">Contact</a></li>
					-->
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