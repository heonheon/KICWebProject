<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<h2>${searchUserId } SNS</h2>
</div>
<hr>
<!-- 게시글 -->
<div class="container mt-4 justify-content-center">
  <div class="row justify-content-center">
  	<c:forEach var="item" items="${UserSns }">
  	<input type="hidden" value="${item.num}" name="commentNum">
    <div class="col-md-8 border mb-4">
    <div class="container justify-content-center">
	      <p class="fw-light"></p>
	      <span class="bi bi-calendar-date"></span>
          <span class="ms-2"><fmt:formatDate value="${item.contentDate }" pattern="yyyy-MM-dd"/></span>
      </div>
      <!-- 이미지 슬라이드 -->
      <div id="carouselExampleControls${item.num }" class="carousel slide">
        <div class="carousel-inner p-4">
          	<c:if test="${item.photo1 != null}">
    			<div class="carousel-item active">
      				<img src="${pageContext.request.contextPath}/view/sns/imgs/${item.photo1}" class="d-block w-100" alt="Image 1">
    			</div>
  			</c:if>
          	<c:if test="${item.photo2 != null}">
    			<div class="carousel-item">
      				<img src="${pageContext.request.contextPath}/view/sns/imgs/${item.photo2}" class="d-block w-100" alt="Image 2">
    			</div>
  			</c:if>
          	<c:if test="${item.photo3 != null}">
    			<div class="carousel-item">
      				<img src="${pageContext.request.contextPath}/view/sns/imgs/${item.photo3}" class="d-block w-100" alt="Image 3">
    			</div>
  			</c:if>
          	<c:if test="${item.photo4 != null}">
    			<div class="carousel-item">
      				<img src="${pageContext.request.contextPath}/view/sns/imgs/${item.photo4}" class="d-block w-100" alt="Image 4">
    			</div>
  			</c:if>
          	<c:if test="${item.photo5 != null}">
    			<div class="carousel-item">
      				<img src="${pageContext.request.contextPath}/view/sns/imgs/${item.photo5}" class="d-block w-100" alt="Image 5">
    			</div>
  			</c:if>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls${item.num }"
          data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls${item.num }"
          data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
      

		

	
      <!-- 게시글 내용 -->
      <div class="card mt-4">
        <div class="card-body">
          <p class="card-text">${item.content }</p>
          <div class="d-flex justify-content-between">
	          <div>
		          <button class="btn btn-danger" onclick="heart(${item.num})">
		          	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-balloon-heart-fill" viewBox="0 0 16 16">
		  				<path fill-rule="evenodd" d="M8.49 10.92C19.412 3.382 11.28-2.387 8 .986 4.719-2.387-3.413 3.382 7.51 10.92l-.234.468a.25.25 0 1 0 .448.224l.04-.08c.009.17.024.315.051.45.068.344.208.622.448 1.102l.013.028c.212.422.182.85.05 1.246-.135.402-.366.751-.534 1.003a.25.25 0 0 0 .416.278l.004-.007c.166-.248.431-.646.588-1.115.16-.479.212-1.051-.076-1.629-.258-.515-.365-.732-.419-1.004a2.376 2.376 0 0 1-.037-.289l.008.017a.25.25 0 1 0 .448-.224l-.235-.468ZM6.726 1.269c-1.167-.61-2.8-.142-3.454 1.135-.237.463-.36 1.08-.202 1.85.055.27.467.197.527-.071.285-1.256 1.177-2.462 2.989-2.528.234-.008.348-.278.14-.386Z"/>
					</svg>
					<span id="heartNumber${item.num }"></span>
		          </button>
	          </div>
	          <button class="btn btn-dark" id="commentToggle${item.num }" onclick="commentLoad(${item.num})">
	          	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16">
	  				<path d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
				</svg>
	          </button>
          </div>
          <!-- 댓글 -->
          	<div id="commentSection${item.num }" style="display: none;">
          	<form action="${pageContext.request.contextPath}/sns/snsCommentPro" method="POST" id="commentForm" onsubmit="return false">
          	<input type="hidden" value="${item.num}" name="hiddenNum" id="hiddenNum">
          		<div class="d-flex mt-3">
          			<div class="col-9">
          				<input class="form-control" type="text" name="inputComment" id="inputComment${item.num}" onkeyup="enterkey('${item.num}')">
          			</div>
          			<div class="col-2">
          				<button class="btn btn-dark" type="button" onclick="commentPro('${item.num}')">입력</button>
          			</div>
          		</div>
          	</form>
          	<hr>
          	<!-- 댓글 표시 -->
          		<div class="card">
          			<p id="resultTag${item.num}"></p>
          		</div>
          	</div>
        </div>
      </div>
      </div>
	</c:forEach>
  </div>
</div>
<script>
/* 좋아요 */
function heart(num) {
	let url = `${pageContext.request.contextPath}/sns/heart?hiddenNum=` + num ;
	let formData = new FormData();
    formData.append('hiddenNum', num);
	fetch(url, {
        method: 'POST',
        body: formData
    })
    .then(response => response.text())
    .then(data => {
        let resultTag = document.querySelector("#heartNumber" + num);
        resultTag.innerHTML = data;
    })
}

/* 댓글 엔터키 */
function enterkey(num) {
	if(window.event.keyCode == 13) {
		commentPro(num)
	}
}
/* 댓글 로딩 */
function commentLoad(num) {
	let url = `${pageContext.request.contextPath}/sns/snsComment`;
	let formData = new FormData();
    formData.append('hiddenNum', num);
	fetch(url, {
        method: 'POST',
        body: formData
    })
    .then(response => response.text())
    .then(data => {
        let resultTag = document.querySelector("#resultTag" + num);
        resultTag.innerHTML = data;
    })
    .catch(error => {
        console.error('데이터 전송 실패:', error);
    });
}
/* 댓글 등록 */
function commentPro(num) {
    let comment = document.querySelector("#inputComment" + num).value;
    let formData = new FormData();
    formData.append('hiddenNum', num);
    formData.append('inputComment', comment);
    let url = `${pageContext.request.contextPath}/sns/snsCommentPro`;
    fetch(url, {
        method: 'POST',
        body: formData
    })
    .then(response => response.text())
    .then(data => {
        let resultTag = document.querySelector("#resultTag" + num);
        resultTag.innerHTML = data;
    })
    .catch(error => {
        console.error('데이터 전송 실패:', error);
    });
    document.querySelector("#inputComment" + num).value = '';
}
/* 댓글 삭제 */
function commentDelete(num) {
	const check = document.querySelector("#checkComment:checked").value;
	let formData = new FormData();
    formData.append('hiddenNum', num);
	let chk = confirm("삭제하시겠습니까?")
	let url = "${pageContext.request.contextPath}/sns/commentDeletePro?ser=" + check;
	if(chk) {
		fetch(url, {
			method : 'POST',
			body: formData
			})
			.then(response => response.text())
			.then(data => {
    			let resultTag = document.querySelector("#resultTag" + num);
    			resultTag.innerHTML = data;
		})
	}
}
 // 댓글 섹션 토글 함수
    document.addEventListener('DOMContentLoaded', function () {
        const commentButtons = document.querySelectorAll('[id^="commentToggle"]');
        
        commentButtons.forEach(function (button) {
            button.addEventListener('click', function (event) {
                const num = button.id.replace('commentToggle', '');
                const commentSection = document.getElementById('commentSection' + num);
                
                if (commentSection.style.display === 'none') {
                    commentSection.style.display = 'block';
                } else {
                    commentSection.style.display = 'none';
                }

                event.preventDefault();
            });
        });
    });


</script>

</body>
</html>