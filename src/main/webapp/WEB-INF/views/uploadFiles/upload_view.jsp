<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>UPLOAD_FILES</title>	
</head>
<body>
	<h1>파일 업로드</h1>
	<form action="${pageContext.request.contextPath}/file/uploadAccess" method="post" enctype="multipart/form-data">
		<input type="file" name="uploadfile" placeholder="파일 선택" />&nbsp;&nbsp;
    	<input type="submit" value="업로드">
	</form>
</body>
</html>