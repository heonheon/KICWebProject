<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <title>프로필 페이지</title>
  <style>
    #main {
      height: 100vh;
    }
    body{
      background-color: lightgray;
    }
  </style>
</head>

<body>

  <div class="container-fluid mt-3">
    <!-- 왼쪽 사이드바 -->
    <div class="row"  id="main">
      <!-- 프로필 정보 -->
      <div class="col-sm-4 p-3 text-white">
        <table class="table">
          <div class="card shadow-sm">
            <div class="card-body">
              <img src="${pageContext.request.contextPath}/view/project/imgs/${info.picture}" class="img-fluid mb-3" alt="picture">
              <h3 class="text-black">${info.name }</h3>
              <p>${info.gender==1 ? "남성" : "여성" }</p>
              <c:choose>
    			<c:when test="${not empty sessionScope.id and empty searchUserId}">
        			<a href="${pageContext.request.contextPath}/project/profileUpdate" class="btn btn-dark">정보 수정</a>
    			</c:when>
    			<c:when test="${empty sessionScope.id and not empty searchUserId}">
    			</c:when>
    			<c:when test="${not empty sessionScope.id and not empty searchUserId and sessionScope.id == searchUserId}">
        			<a href="${pageContext.request.contextPath}/project/profileUpdate" class="btn btn-dark">정보 수정</a>
    			</c:when>
				<c:otherwise>
    			</c:otherwise>
			  </c:choose>
			  <hr>
			  	<c:choose>
    				<c:when test="${not empty sessionScope.id and empty searchUserId}">
        				<a href="${pageContext.request.contextPath}/sns/snsContent" class="btn btn-dark">SNS</a>
    				</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/sns/searchSns?id=${searchUserId}" class="btn btn-dark">SNS</a>
    				</c:otherwise>
			  	</c:choose>
			  
			  	
              <hr>
              <h3 class="text-black">신체 기록</h3>
              <p>Height</p>
              <div class="progress mb-3">
                <div class="progress-bar bg-black" role="progressbar" style="width: 100%;" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">
					${info.bodyheight }
                </div>
              </div>
              <p>Weight</p>
              <div class="progress mb-3">
                <div class="progress-bar bg-black" role="progressbar" style="width: 100%;" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100">
                  <div class="text-white">${info.bodyweight }</div>
                </div>
              </div>
              <p>BMI</p>
              <div class="progress mb-3">
                <div class="progress-bar bg-black" role="progressbar" style="width: 100%;" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100">
                  <div class="text-white">${info.bmi }</div>
                </div>
              </div>
              <p>Body Fat</p>
              <div class="progress mb-3">
                <div class="progress-bar bg-black" role="progressbar" style="width: 100%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">${info.bodyfat }</div>
              </div>
              <p>Skeletal Muscle Mass</p>
              <div class="progress mb-3">
                <div class="progress-bar bg-black" role="progressbar" style="width: 100%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">${info.muscul }</div>
              </div>
              <br>
              <a href="${pageContext.request.contextPath}/body/bodyinfo" class="btn btn-dark">신체 기록</a>
            </div>
          </div>
          <br>
        </table>
      </div>
      
      
      <!-- 프로필 정보 끝 -->

      <!-- 메인 콘텐츠 -->
      <div class="col-sm-8 p-3 text-white">
        <!-- 운동 기록  -->
        <div class="card mb-4">
          <div class="card-body">
            <h2 class="text-black mb-4"><i class="fa fa-suitcase fa-fw me-2"></i>Workout</h2>
            <div class="mb-4">
              <h5 class="text-black"><b>Today Workout</b></h5>
              <table class="table table-striped">
	 			<thead>
	  				<tr>
	   					<th scope="col">운동 이름</th>
	   					<th scope="col">무게(거리)</th>
	  					<th scope="col">횟수(시간)</th>
	   					<th scope="col">세트</th>
	  				</tr>
     			</thead>
     			<tbody>
     				<c:forEach var="item" items="${today }">
     					<tr id="a${item.num }">
     	 					<td>${item.woName }</td>
     	 					<td>${item.paraone }</td>
     	 					<td>${item.paratwo }</td>
     						<td>${item.parathr }</td>
     					</tr>
     				</c:forEach>
     			</tbody>
			  </table>
            </div>
            <hr>
            <div class="mb-4">
              <h5 class="text-black"><b>Yesterday Workout</b></h5>
              <table class="table table-striped">
	 			<thead>
	  				<tr>
	   					<th scope="col">운동 이름</th>
	   					<th scope="col">무게(거리)</th>
	  					<th scope="col">횟수(시간)</th>
	   					<th scope="col">세트</th>
	  				</tr>
     			</thead>
     			<tbody>
     				<c:forEach var="item" items="${yesterday }">
     					<tr id="a${item.num }">
     	 					<td>${item.woName }</td>
     	 					<td>${item.paraone }</td>
     	 					<td>${item.paratwo }</td>
     						<td>${item.parathr }</td>
     					</tr>
     				</c:forEach>
     			</tbody>
			   </table>
            </div>
            <hr>
            <a href="${pageContext.request.contextPath}/workout/workoutInfo" class="btn btn-dark">운동 기록</a>
          </div>
        </div>
        <!-- 운동 기록 끝 -->
        <!-- 식단 기록 -->
        <div class="card">
          <div class="card-body">
            <h2 class="text-black mb-4"><i class="fa fa-certificate fa-fw me-2"></i>Diet</h2>
            <table class="table table-striped">
	 			<thead>
	  				<tr>
	   					<th scope="col">이름</th>
	   					<th scope="col">무게</th>
	   					<th scope="col">탄수화물</th>
	   					<th scope="col">단백질</th>
	   					<th scope="col">지방</th>
	   					<th scope="col">칼로리</th>
	  				</tr>
     			</thead>
     			<tbody>
     				<c:forEach var="item" items="${todayD }">
     					<tr id="a${item.num }">
     	 					<td>${item.foodName }</td>
     	 					<td>${item.foodWeight }</td>
     	 					<td>${item.carbo }</td>
     	 					<td>${item.protine }</td>
     						<td>${item.fat }</td>
     						<td>${item.calorie }</td>
     					</tr>
     				</c:forEach>
     			</tbody>
			</table>
			<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col"></th>
					<th scope="col">탄수화물</th>
					<th scope="col">단백질</th>
					<th scope="col">지방</th>
					<th scope="col">칼로리</th>
				</tr>
			</thead>
				<tr>
					<td>합계</td>
					<td>${cartot }</td>
					<td>${protot }</td>
					<td>${fattot }</td>
					<td>${caltot }</td>
				</tr>
		</table>
            <hr>
            <a href="${pageContext.request.contextPath}/diet/dietInfo" class="btn btn-dark">식단 기록</a>
          </div>
        </div>
        <!-- 식단 기록 끝 -->
      </div>
    </div>
  </div>


</body>

</html>