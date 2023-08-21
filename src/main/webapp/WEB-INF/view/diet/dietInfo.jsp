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
    <h2>식단 기록</h2>
  </div>
<hr>
<div class="container bg-white rounded border border-2">
    <div class="align-items-center">
    <h4 class="border-dark">식단 리스트</h4>
 	<table class="table table-striped">
	 <thead>
	  <tr>
	   <th scope="col">날짜</th>
	   <th scope="col">식사</th>
	   <th scope="col">이름</th>
	   <th scope="col">탄수화물</th>
	   <th scope="col">단백질</th>
	   <th scope="col">지방</th>
	   <th scope="col">칼로리</th>
	  </tr>
     </thead>
     <tbody>
     	<c:forEach var="item" items="${dList }">
     		<tr id="a${item.num }">
     			<td>
     				<fmt:formatDate value="${item.mealDate }" pattern="yyyy-MM-dd"/>
     			</td>
     	 		<td id="mealName">${item.mealType }</td>
     	 		<td>${item.foodName }</td>
     	 		<td>${item.carbo }</td>
     	 		<td>${item.protine }</td>
     			<td>${item.fat }</td>
     			<td>${item.calorie }</td>
     		</tr>
     	</c:forEach>
     </tbody>
	</table>
   </div>
  </div>
</body>
</html>