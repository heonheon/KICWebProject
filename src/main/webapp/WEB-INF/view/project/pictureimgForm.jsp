<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath }/project/picturePro" class="container" method="post" enctype="multipart/form-data">
		<input class="input" type="file" name="picture">
		<input class="input" type="submit" name="사진등록">
	</form>
</body>
</html>