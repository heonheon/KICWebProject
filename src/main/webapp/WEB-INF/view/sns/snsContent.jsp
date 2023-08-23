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
  <style>
   #calendarBox {
      max-width: 400px;
      margin-top: 50px;
    }
    .calendar {
      display: none;
      position: absolute;
      z-index: 9999;
      background: #fff;
      border: 1px solid #ccc;
      padding: 10px;
      font-family: Arial, sans-serif;
    }
    .calendar .header {
      display: flex;
      justify-content: space-between;
      margin-bottom: 10px;
    }
    .calendar .header select {
      padding: 5px;
    }
    .calendar .weekdays {
      display: flex;
      justify-content: space-between;
      font-weight: bold;
      text-align: center;
      margin-bottom: 10px;
    }
    .calendar .weekdays .day {
      flex: 1;
    }
    .calendar .days {
      display: grid;
      grid-template-columns: repeat(7, 1fr);
      gap: 5px;
    }
    .calendar .day {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 30px;
      border-radius: 5px;
      cursor: pointer;
    }
    .calendar .day:hover {
      background-color: #eee;
    }
    .calendar .day.disabled {
      color: #ccc;
      cursor: not-allowed;
    }
    .calendar .day.selected {
      background-color: #007bff;
      color: #fff;
    }
    .custom-img {
    width: 200px; 
    height: 150px; 
  }
</style>
</head>
<body>
<div class="container">
	<!-- 달력 시작 -->
	<div class="d-flex" id="calendarBox">
    	<div class="input-group">
    		<form action="${pageContext.request.contextPath }/sns/snsContent">
    			<h2>SNS</h2>
    			<input type="text" class="form-control" id="selectedDate" name="snsDate" readonly>
      			<a class="btn btn-outline-dark" id="datePickerBtn">날짜</a>
   				<button type="submit" class="btn btn-outline-dark">확인</button>
      		</form>
    	</div>
    	<div class="calendar" id="calendarContainer">
      	<div class="header">
        	<select id="yearSelect"></select>
        	<select id="monthSelect"></select>
      	</div>
      	<div class="weekdays">
        	<div class="day">Sun</div>
        	<div class="day">Mon</div>
        	<div class="day">Tue</div>
        	<div class="day">Wed</div>
        	<div class="day">Thu</div>
        	<div class="day">Fri</div>
        	<div class="day">Sat</div>
      	</div>
      	<div class="days" id="calendarDays"></div>
    	</div>
  	</div>
 	<!-- 달력 끝 -->
</div>
<hr>
	<!-- 게시글 추가 버튼 -->
	<div class="container">
		<div class="d-flex">
			<button class="btn btn-dark me-2" id="addContent" data-bs-toggle="modal" data-bs-target="#myModal">추가</button>
		</div>
	</div>

	  <!-- 게시글 추가 모달 -->
	 <form id="imageForm" action="${pageContext.request.contextPath}/sns/snsContentPro" class="container" method="post" enctype="multipart/form-data" >
	  <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  		<div class="modal-dialog">
    		<div class="modal-content">
      			<div class="modal-header">
        			<h5 class="modal-title" id="exampleModalLabel">등록</h5>
        			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      			</div>
      			<div class="modal-body">
					<div class="container mt-4">
						<input type="hidden" name="imageFileNames" id=imageFileNames value="">
						<button id="addImageButton" class="btn btn-dark mb-2">Add Image</button>
						<div id="imageContainer" class="d-flex flex-column align-items-start"></div>
					</div>
					<div>
						<label for="contentText"></label>
						<textarea class="form-control" rows="4" cols="" id="contentText" name="contentText" style="resize:none"></textarea>
					</div>
      			</div>
      			<div class="modal-footer">
        			<button type="submit" class="btn btn-dark">등록</button>
      			</div>
    		</div>
  		</div>
	  </div>
	</form>
<hr>
<!-- 게시글 -->
<div class="container mt-4 justify-content-center">
  <div class="row justify-content-center">
  	<c:forEach var="item" items="${sns }">
  	<input type="hidden" value="${item.num}" name="commentNum">
    <div class="col-md-8 border mb-4">
      <div class="container justify-content-center">
	      <p class="fw-light"></p>
	      <span class="bi bi-calendar-date"></span>
          <span class="ms-2"><fmt:formatDate value="${item.contentDate }" pattern="yyyy-MM-dd"/></span>
	          <!-- 게시글 삭제 버튼 -->
		  <div class="mt-4 d-flex justify-content-end">
	        <form action="${pageContext.request.contextPath}/sns/snsDeletePro?num=${item.num}" method="post">
	        	<button class="btn btn-dark" id="subtractContent" type="submit">삭제</button>
	        </form>
	      </div>
      </div>
      <!-- 이미지 슬라이드 -->
      <div id="carouselExampleControls${item.num }" class="carousel slide">
        <div class="carousel-inner p-4">
          	<c:if test="${item.photo1 != null}">
    			<div class="carousel-item active p-4">
      				<img src="${pageContext.request.contextPath}/view/sns/imgs/${item.photo1}" class="d-block w-100" alt="Image 1">
    			</div>
  			</c:if>
          	<c:if test="${item.photo2 != null}">
    			<div class="carousel-item p-4">
      				<img src="${pageContext.request.contextPath}/view/sns/imgs/${item.photo2}" class="d-block w-100" alt="Image 2">
    			</div>
  			</c:if>
          	<c:if test="${item.photo3 != null}">
    			<div class="carousel-item p-4">
      				<img src="${pageContext.request.contextPath}/view/sns/imgs/${item.photo3}" class="d-block w-100" alt="Image 3">
    			</div>
  			</c:if>
          	<c:if test="${item.photo4 != null}">
    			<div class="carousel-item p-4">
      				<img src="${pageContext.request.contextPath}/view/sns/imgs/${item.photo4}" class="d-block w-100" alt="Image 4">
    			</div>
  			</c:if>
          	<c:if test="${item.photo5 != null}">
    			<div class="carousel-item p-4">
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
	          
		      <button class="btn <c:if test="${1==1 }" > btn-danger</c:if> <c:if test="" > btn-dark</c:if>" onclick="heart(${item.num})" id="colorChangeButton">
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
          		<div class="d-flex justify-content-between mt-3">
          			<div class="col-10">
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


/* 댓글 엔터키 작동*/
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

/* 이미지 추가 */
    const imageContainer = document.getElementById('imageContainer');
    const addImageButton = document.getElementById('addImageButton');
    const imageNamesInput = document.getElementById('imageFileNames'); 
    let imageCount = 0;
    let imageNames = [];
    function updateImageNames() {
    	document.getElementById('imageFileNames').value = imageNames.join(',');
    }
    function addInputWithPreview() {
      if (imageCount < 5) {
        const input = document.createElement('input');
        input.type = 'file';
        input.accept = 'image/*';
        input.className = 'form-control mb-2';
        input.name = 'imageFile' + imageCount; 
        input.addEventListener('change', function() {
          const file = input.files[0];
          if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
              const img = document.createElement('img');
              img.src = e.target.result;
              img.style.maxWidth = '200px';
              img.style.maxHeight = '200px';
              const resetButton = document.createElement('button');
              resetButton.textContent = 'Reset';
              resetButton.className = 'btn btn-danger btn-sm mt-1';
              resetButton.addEventListener('click', function() {
                img.parentNode.removeChild(img);
                input.parentNode.removeChild(input);
                resetButton.parentNode.removeChild(resetButton);
                imageCount--;
                imageNames = imageNames.filter(name => name !== file.name);
                updateImageNames();
                addImageButton.disabled = false;
              });
              const container = document.createElement('div');
              container.className = 'mb-2';
              container.appendChild(img);
              container.appendChild(resetButton);
              imageContainer.appendChild(container);
              imageCount++;
              imageNames.push(file.name);
              alert(imageNames)
              //input.disabled = true;
              addImageButton.disabled = imageCount >= 5;
            }
            reader.readAsDataURL(file);
          }
        });
        imageContainer.appendChild(input);
        addImageButton.disabled = true;
      }
    }
    addImageButton.addEventListener('click', addInputWithPreview);
    const imageForm = document.getElementById('imageForm');
    imageForm.addEventListener('submit', function(event) {
      updateImageNames();
    });
    
    
    /* 달력 스크립트 */
       window.addEventListener('load', function() {
 	  const selectedDateInput = document.getElementById('selectedDate');
 	  const currentDate = new Date();
 	  const utcCurrentDate = new Date(Date.UTC(
 			  currentDate.getFullYear(),
 			  currentDate.getMonth(),
 			  currentDate.getDate(),
 			  currentDate.getHours(),
 			  currentDate.getMinutes(),
 			  currentDate.getSeconds(),
 			  currentDate.getMilliseconds()
 			));
 	  const formattedDate = utcCurrentDate.toISOString().split('T')[0];
 	  selectedDateInput.value = formattedDate;
 	});
   
    const datePickerBtn = document.getElementById('datePickerBtn');
    const selectedDateInput = document.getElementById('selectedDate');
    const calendarContainer = document.getElementById('calendarContainer');
    const yearSelect = document.getElementById('yearSelect');
    const monthSelect = document.getElementById('monthSelect');
    const calendarDays = document.getElementById('calendarDays');

    datePickerBtn.addEventListener('click', function() {
      calendarContainer.style.display = 'block';
    });

    function closeCalendar() {
      calendarContainer.style.display = 'none';
    }

    function updateSelectedDate(year, month, day) {
    	  const selectedDate = new Date(year, month, day + 1);
    	  const formattedDate = selectedDate.toISOString().split('T')[0];
    	  selectedDateInput.value = formattedDate;
    	  closeCalendar();
    }

    function renderCalendar() {
    	const currentDate = new Date();
    	const currentYear = currentDate.getFullYear();
    	const currentMonth = currentDate.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줌
    	const currentDay = currentDate.getDate();

      const selectedYear = parseInt(yearSelect.value);
      const selectedMonth = parseInt(monthSelect.value);
      const totalDays = new Date(selectedYear, selectedMonth + 1, 0).getDate();
      const startDayIndex = new Date(selectedYear, selectedMonth, 1).getDay();

      calendarDays.innerHTML = '';

      for (let i = 0; i < startDayIndex; i++) {
        const emptyDay = document.createElement('div');
        emptyDay.classList.add('day', 'disabled');
        calendarDays.appendChild(emptyDay);
      }

      for (let i = 1; i <= totalDays; i++) {
        const day = document.createElement('div');
        day.classList.add('day');
        if (
          selectedYear === currentYear &&
          selectedMonth === currentMonth &&
          i === currentDay
        ) {
          day.classList.add('selected');
        }
        day.textContent = i;
        day.addEventListener('click', function() {
          updateSelectedDate(selectedYear, selectedMonth, i);
        });
        calendarDays.appendChild(day);
      }
    }

    function populateYearSelect() {
      const currentYear = new Date().getFullYear();
      for (let year = currentYear - 10; year <= currentYear + 10; year++) {
        const option = document.createElement('option');
        option.value = year;
        option.textContent = year;
        yearSelect.appendChild(option);
      }
      yearSelect.value = currentYear;
    }

    function populateMonthSelect() {
      const monthNames = [
        'January', 'February', 'March', 'April', 'May', 'June',
        'July', 'August', 'September', 'October', 'November', 'December'
      ];
      for (let month = 0; month < 12; month++) {
        const option = document.createElement('option');
        option.value = month;
        option.textContent = monthNames[month];
        monthSelect.appendChild(option);
      }
      monthSelect.value = new Date().getMonth();
    }

    yearSelect.addEventListener('change', function() {
      renderCalendar();
    });

    monthSelect.addEventListener('change', function() {
      renderCalendar();
    });

    document.addEventListener('click', function(event) {
      const target = event.target;
      if (
        !calendarContainer.contains(target) &&
        target !== datePickerBtn
      ) {
        closeCalendar();
      }
    });

    populateYearSelect();
    populateMonthSelect();
    renderCalendar();
    
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