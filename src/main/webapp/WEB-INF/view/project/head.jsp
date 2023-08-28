<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <title>Top Menu</title>
  <style>
    .navbar {
      background-color: #343a40;
    }

    .navbar a {
      color: #fff;
    }
    .navbar a:hover {
      color: silver;
    }
    .navbar-toggler {
      color: white;
    }
    
  </style>

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light ">
  <div class="container">
  	<c:if test="${empty sessionScope.id}">
  		<div class="navbar-nav">
     		<a class="nav-link" href="${pageContext.request.contextPath}/project/home">Home</a>
    	</div>
    </c:if>
    <c:if test="${not empty sessionScope.id}">
  		<div class="navbar-nav">
      		<a class="nav-link" href="${pageContext.request.contextPath}/project/profile">Profile</a>
    	</div>
    </c:if>
        <c:if test="${not empty sessionScope.id}">
  		<div class="navbar-nav">
      		<a class="nav-link" href="${pageContext.request.contextPath}/sns/snsContent">SNS</a>
    	</div>
    </c:if>
    <c:if test="${not empty sessionScope.id}">
    <div class="text-center d-flex flex-row" id="searchContainer">
      	<input type="text" class="form-control text-center" id="searchInput" placeholder="Enter user name" name="profileEmail">
      	<a class="btn btn-dark" href="#" id="searchToggleBtn" >
      		<svg id="searchToggleBtn" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
          		<path d="M11.88 10.46a6.5 6.5 0 1 0-1.42 1.42l3.54 3.54a1 1 0 0 0 1.42-1.42l-3.54-3.54Zm-5.38-3.92a4.5 4.5 0 1 1-6.36 6.36 4.5 4.5 0 0 1 6.36-6.36Z"/>
        	</svg>
      	</a>
    </div>
    </c:if>
    <c:if test="${not empty sessionScope.id}">
		<div class="navbar-nav">
      		<a class="nav-link" href="${pageContext.request.contextPath}/workout/workout">Workout</a>
    	</div>
    </c:if>
    <c:if test="${not empty sessionScope.id}">
    	<div class="navbar-nav">
      		<a class="nav-link" href="${pageContext.request.contextPath}/diet/diet">Diet</a>
    	</div>
    </c:if>
    
    <!-- 로그인 로그아웃 설정 -->
    <button class="navbar-toggler text-white" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation" >
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
        <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
      </svg>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
    <c:if test="${not empty sessionScope.id}">
      <ul class="navbar-nav">
        <li class="nav-item ms-auto" id="si">
          <a class="nav-link text-white" href="${pageContext.request.contextPath}/project/logoutPro" id="si">Logout</a>
        </li>
      </ul>
      </c:if>
    <c:if test="${empty sessionScope.id}">
      <ul class="navbar-nav">
        <li class="nav-item ms-auto" id="si">
          <a class="nav-link text-white" href="#" id="si" data-bs-toggle="modal" data-bs-target="#loginModal">Sign in</a>
        </li>
        <li class="nav-item ms-auto" id="su">
          <a class="nav-link text-white" href="${pageContext.request.contextPath}/project/signUpForm">Sign up</a>
        </li>
      </ul>
     </c:if>
    </div>
    
    
    
  </div>
</nav>

<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="loginModalLabel">Sign In</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" data-bs-backdrop="true" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <!-- 로그인 폼 -->
        <form action="${pageContext.request.contextPath}/project/loginPro">
          <div class="mb-3">
            <label for="id" class="form-label">ID</label>
            <input type="text" class="form-control" name="id" aria-describedby="idHelp">
          </div>
          <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" name="password">
          </div>
          <button type="submit" class="btn btn-dark">Sign In</button>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" data-bs-backdrop="true">Close</button>
      </div>
    </div>
  </div>
</div>
  <script type="text/javascript">
  /* 검색창 기능 */
  document.querySelector('#searchToggleBtn').addEventListener('click', function(event) {
	  event.preventDefault();
	  executeSearch();
	});

	document.querySelector('#searchInput').addEventListener('keydown', function(event) {
	  if (event.key === 'Enter') {
	    event.preventDefault();
	    executeSearch();
	  }
	});

	function executeSearch() {
	  const id = document.querySelector('#searchInput').value;
	  const link = document.querySelector('#searchToggleBtn');
	  const contextPath = "${pageContext.request.contextPath}";
	  link.href = contextPath + "/project/profile?id=" + id;
	  window.location.href = link.href;
	}

  </script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
</body>
</html>






