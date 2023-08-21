<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- webapp/layout/layout.jsp -->
<meta charset="UTF-8">
<title>타이틀 : <sitemesh:write property='title' /></title>
<%@ include file="/WEB-INF/view/project/head.jsp" %>
<sitemesh:write property='head'/>
</head>
<body>
	<div class="mainBody">
		<sitemesh:write property='body'/>
	</div>
	
	<div>
		<sitemesh:write property='footer'/>
	</div>
</body>
</html>