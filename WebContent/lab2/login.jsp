<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- For Css Plugin -->
<link rel="stylesheet" type="text/css" href="/css/style.min.css">

<!-- For JavaScript , Jquery Plugin -->
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="/javascript/main.js"></script>

<!-- For Font Awesome,Google Font Plugin
<link href="https://fonts.googleapis.com/css?family=Arsenal"
	rel="stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Arsenal"
	rel="stylesheet">
 -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/util.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link href="css/animate.min.css" rel="stylesheet">


<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<title>Welcome to login</title>
</head>
<body>
	<jsp:include page="../exercises.jsp" />
	<div class="limiter">
		<div class="container-login100">
			<!-- style="background-image: url('images/welcome.jpg');" -->

			<div class="wrap-login100 p-t-30 p-b-50">
				<span class="login100-form-title p-b-41"> Account Login </span>
				<%
					String err = request.getParameter("err");
					if ("1".equals(err)) {
						out.print("<h4 style=\"color: red;text-align:center;\">Invalid email or password. </h4>");
					}
				%>
				<form class="login100-form validate-form p-b-33 p-t-5"
					action="<%=request.getContextPath()%>/LoginController"
					method="post">

					<div class="wrap-input100 validate-input"
						data-validate="Enter username">
						<input class="input100" type="text" name="username"
							placeholder="User name"> <span class="focus-input100"
							data-placeholder="&#xe82a;"></span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Enter password">
						<input class="input100" type="password" name="pass"
							placeholder="Password"> <span class="focus-input100"
							data-placeholder="&#xe80f;"></span>
					</div>

					<div class="container-login100-form-btn m-t-32">
						<button class="login100-form-btn">Login</button>
					</div>

				</form>
			</div>
		</div>
	</div>


	<div id="dropDownSelect1"></div>

	<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="js/main.js"></script>
</body>
</html>