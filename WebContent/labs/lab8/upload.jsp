<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Upload data</title>
</head>
<body>
	<jsp:include page="/exercises.jsp" />
	<h2 style="text-align: center">Upload</h2>
	<form action="UploadFiles" method="post" enctype="multipart/form-data">
		<input type="file" name="file" multiple="multiple" /> <input type="submit"
			value="upload">
	</form>

</body>
</html>