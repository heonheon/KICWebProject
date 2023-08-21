<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	img = opener.document.querySelector('#pic');
	img.src = "${pageContext.request.contextPath}/view/project/imgs/${filename}"
	opener.document.f.picture.value="${filename}";
	self.close();
</script>
</head>

<body>
	
</body>
</html>