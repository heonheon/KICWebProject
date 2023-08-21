<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container mt-4">
    <h2>운동 기록</h2>
  </div>
  <hr>
  <div class="container bg-white rounded border border-2">
    <div class="align-items-center">
    <h4 class="border-dark">운동 리스트</h4>
	<table class="table table-striped">
	 <thead>
	  <tr>
	   <th scope="col">날짜</th>
	   <th scope="col">운동 이름</th>
	   <th scope="col">무게(거리)</th>
	   <th scope="col">횟수(시간)</th>
	   <th scope="col">세트</th>
	  </tr>
     </thead>
     <tbody>
     	<c:forEach var="item" items="${woList }">
     		<tr>
     	 		<td>
     	 		<fmt:formatDate value="${item.wodate }" pattern="yyyy-MM-dd"/>
     	 		
     	 		</td>
     	 		<td>${item.woName }</td>
     	 		<td>${item.paraone }</td>
     	 		<td>${item.paratwo }</td>
     			<td>${item.parathr }</td>
     		</tr>
     	</c:forEach>
     </tbody>
	</table>
   </div>
  </div>
</body>
</html>