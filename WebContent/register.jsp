<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register page</title>
<style type="text/css">
body {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11pt;
	margin-left: 2em;
	margin-right: 2em;
}

label {
	float: left;
	width: 6em;
	margin-bottom: 0.5em;
}

input[type="text"], input[type="email"] {
	width: 15em;
	margin-left: 0.5em;
	margin-bottom: 0.5em;
}

br {
	clear: both;
}

h1 {
	color: teal;
}

#submit {
	margin-left: 0.5em;
}
</style>


</head>

<body>
	<jsp:include page="menu.jsp" />
	<h1>Create account</h1>
	<p>Enter inform below</p>
	<form action="accountList" method="post">
		<input type="hidden" name="action" value="add"> <label>First
			Name:</label> <input type="text" name="firstName" required><br>
		<label>Last Name:</label> <input type="text" name="lastName" required><br>
		<label>Email:</label> <input type="email" name="email" required><br>
		<label>Password:</label> <input type="password" name="password"
			required><br> <label>&nbsp;</label> <input type="submit"
			value="Join Now" id="submit">

	</form>
</body>
</html>