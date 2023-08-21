<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <title>개인 정보 수정</title>
<script type="text/javascript">
	function win_upload() {
		var op = "width=500, height=150, legt=50, top=150";
		open("${pageContext.request.contextPath}/project/pictureimgForm", "", op)
	}
</script>
</head>
<style>
  #main {
    height: 100vh;
  }
  body{
    background-color: lightgray;
  }
</style>
<body>
  <div class="container">
    <h2 class="h2 mt-3">${id.id } 프로필 수정</h2>
    <form action="${pageContext.request.contextPath }/project/profileUpdatePro" class="container" name="f">
    	<input type="hidden" name="picture" value="">
		<div class="mb-3">
			<img alt="" src="${pageContext.request.contextPath}/view/project/imgs/${id.picture}" width="100" height="120" id="pic"><br>
			<font size="1">
				<a class="w3-button w3-blue" href="javascript:win_upload()">사진수정</a>
			</font>
		</div>
	  <div class="mb-3">
		<label for="name" class="form-label"></label>
        <input type="text" class="form-control" name="name" placeholder="이름" value="${id.name }">
      </div>
      <div class="mb-3">
		<label for="email" class="form-label"></label>
        <input type="email" class="form-control" name="email" placeholder="이메일" value="${id.email }">
      </div>
      <div class="mb-3">
        <label for="password" class="form-label"></label>
        <input type="password" class="form-control" name="password" placeholder="비밀번호">
      </div>
      <div class="mt-3">
        <div class="form-check-inline">
          <input class="form-check-input" type="radio" name="gender" id="male" value="1" ${id.gender==1 ? "checked" : "" }>
          <label class="form-check-label" for="male">남성</label>
        </div>
          <div class="form-check-inline">
          <input class="form-check-input" type="radio" name="gender" id="female" value="2" ${id.gender==2 ? "checked" : "" }>
          <label class="form-check-label" for="female">여성</label>
        </div>
      </div>
      <div class="mb-3">
        <label for="height" class="form-label"></label>
        <input type="text" class="form-control" id="height" name="bodyheight" placeholder="키" value="${id.bodyheight }">
      </div>
      <div class="mb-3">
        <label for="weight" class="form-label"></label>
        <input type="text" class="form-control" id="weight" name="bodyweight" placeholder="체중" value="${id.bodyweight }">
      </div>
      <div class="mb-3">
        <label for="fat" class="form-label"></label>
        <input type="text" class="form-control" id="fat" name="bodyfat" placeholder="체지방률" value="${id.bodyfat }">
      </div>
      <div class="mb-3">
        <label for="boneMuscle" class="form-label"></label>
        <input type="text" class="form-control" id="boneMuscle" name="muscul" placeholder="골격근량" value="${id.muscul }">
      </div>
      <br>
      <div class="d-flex justify-content-end">
      	<a class="btn btn-black" href="${pageContext.request.contextPath }/project/passChangeForm">비밀번호 수정</a>
      	<a class="btn btn-black" href="${pageContext.request.contextPath }/project/deleteUser">회원 탈퇴</a>
      	<button type="submit" class="btn btn-dark">저장</button>
      </div>
    </form>
  </div>
</body>
</html>

