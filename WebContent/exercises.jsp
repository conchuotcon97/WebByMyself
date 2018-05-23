<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Tipi</a>
		</div>
		<ul class="nav navbar-nav">
			<li class="active"><a
				href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
			<li><a href="<%=request.getContextPath()%>/labs/lab2/login.jsp">Lab1</a></li>
			<li><a href="<%=request.getContextPath()%>/labs/lab2/login.jsp">Lab2</a></li>
			<li><a href="<%=request.getContextPath()%>/labs/lab3/reg.jsp">Lab4</a></li>
			<li><a href="<%=request.getContextPath()%>/labs/lab5/products.jsp">Lab5</a></li>
			<li><a href="<%=request.getContextPath()%>/labs/lab6/settingConnect.jsp">Lab6</a></li>
			<li><a href="<%=request.getContextPath()%>/labs/lab7/...">Lab7</a></li>
			<li><a href="<%=request.getContextPath()%>/labs/lab8/upload.jsp">Lab8</a></li>
		</ul>
	</div>
	</nav>
</body>
</html>