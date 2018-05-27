<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
div {
	margin-left: 40px;
	font-size: 20px;
}

table, th, td {
	border: 1px solid black;
}
table th{
text-align: center;}
</style>
</head>
<body>
	<jsp:include page="/exercises.jsp"></jsp:include>
	<div>
		<h2>1.How to you setting connection with mysql</h2>

		<ul>
			<li>Download library mysql-connector-java-5.1.46.jar</li>
			<li>Copy this file into WebContent/WEB-INF/lib</li>
			<li>Right click on Jar file-> select Build Path-> Configure
			<li><img src="<%=request.getContextPath()%>/images/connect1.png"></li>

			<li>Select mysql-connector-java.5.1.46.jar and press Apply</li>
		</ul>
		<h2>2. Delete product has productCode=bass</h2>
		<table>
			<tr>
				<th>Before</th>
				<th>After</th>
			</tr>
			<tr>
				<td><img
					src="<%=request.getContextPath()%>/images/beforeconnect.PNG"></td>
				<td><img
					src="<%=request.getContextPath()%>/images/afterconnect.PNG"></td>

			</tr>
			<tr>
				<td><img
					src="<%=request.getContextPath()%>/images/beforeproduct.png"></td>
				<td><img
					src="<%=request.getContextPath()%>/images/afterproduct.PNG"></td>

			</tr>
			<tr>


			</tr>

		</table>
	</div>
</body>
</html>