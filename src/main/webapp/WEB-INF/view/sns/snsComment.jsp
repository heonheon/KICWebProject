<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
</head>
<script type="text/javascript">

</script>
<body>
<table class="table table-striped">
	<c:forEach var="item" items="${li }">
        <tr id="a${item.ser }">
            <td class="col-md-1">${item.id }</td>
            <td class="col-md-8">${item.content }</td>
            <c:choose>
    			<c:when test="${sessionScope.id == item.id }">
    				<td class="col-md-1"><input type="checkbox" value="${item.ser }" id="checkComment" onchange="commentDelete('${item.num }')" name="checkComment"/></td>
    			</c:when>
    			<c:otherwise>
    				<td class="col-md-1"></td>
    			</c:otherwise>
			</c:choose>
        </tr>
	</c:forEach>
</table>
</body>
</html>