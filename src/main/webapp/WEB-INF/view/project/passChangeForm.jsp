<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
    function passCheck(form) {
      if (form.changepass1.value != form.changepass2.value) {
        alert("변경 비밀번호가 서로 다릅니다.");
        form.changepass2.value = "";
        form.changepass2.focus();
        return false;
      } else {
        return true;
      }
    }
</script>
</head>
<body>
	<div class="container mt-4">
    	<h1 class="mb-4">비밀번호 수정</h1>
    	<form action="${pageContext.request.contextPath}/project/passChangePro" method="post" onsubmit="return passCheck(this)">
      		<div class="mb-3">
        		<label for="currentPassword" class="form-label">현재 비밀번호</label>
        		<input type="password" class="form-control" id="currentPassword" name="pass" required>
      		</div>
      		<div class="mb-3">
        		<label for="newPassword" class="form-label">새로운 비밀번호</label>
        		<input type="password" class="form-control" id="newPassword" name="changepass1" required>
      		</div>
      		<div class="mb-3">
        		<label for="confirmPassword" class="form-label">비밀번호 확인</label>
        		<input type="password" class="form-control" id="confirmPassword" name="changepass2" required>
      		</div>
      		<div class="mb-3">
        		<button type="submit" class="btn btn-dark">비밀번호 변경</button>
      		</div>
    	</form>
  	</div>
</body>
</html>