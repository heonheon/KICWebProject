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
  
  <script type="text/javascript">
	function dietDelete() {
		const check = document.querySelector("#checkDiet:checked").value;
		let chk = confirm("삭제하시겠습니까?")
		if (chk) {
    		const xhttp = new XMLHttpRequest();
    		xhttp.onreadystatechange = function() {
      			if (this.readyState === 4 && this.status === 200) {
        			if(xhttp.responseText == 1) {
        				let row = document.querySelector("#a" + check)
        				row.parentNode.removeChild(row)
        				}
      				}
    			};
    			xhttp.open("POST", "${pageContext.request.contextPath}/diet/dietDeletePro?num=" + check, true);
    			xhttp.send();
			}
		}
	const xhttp = new XMLHttpRequest();
	function startSuggest() {
		setTimeout("sendKeyword()", 500);
	}
	
	function sendKeyword() {
		let keyword = document.querySelector("#foodName").value
		if (keyword != '') {
			console.log(keyword)
			const params = encodeURIComponent(keyword)
			xhttp.open("GET", "${pageContext.request.contextPath}/diet/foodName?foodname=" + params, true)
			xhttp.send()
			xhttp.onreadystatechange = displayResult
		}
	}
	
	function displayResult() {
		if(this.readyState == 4 && this.status == 200) {
			const listView = document.querySelector("#suggestList")
			listView.innerHTML = this.responseText
		}
	}
	
	function putPara(name) {
		const url = "${pageContext.request.contextPath}/diet/foodName2?foodname="+name;
		fetch(url)
			.then(function (response) {
				if(!response.ok) {
					throw new Error("not ok")
				}
				return response.text()
				const data = response.text()
			})
			.then(function (data) {
				const dataArray = data.split(",")
				document.querySelector('#foodName').value = dataArray[0];
				document.querySelector('#foodWeight').value = dataArray[1];
				document.querySelector('#carbo').value = dataArray[2];
				document.querySelector('#protine').value = dataArray[3];
				document.querySelector('#fat').value = dataArray[4];
				document.querySelector('#calorie').value = dataArray[5];
			})
	}
  </script>
  
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
</style>


</head>
<body>
<div class="container">
	<!-- 달력 시작 -->
	<div class="d-flex" id="calendarBox">
    	<div class="input-group">
    		<form action="${pageContext.request.contextPath }/diet/diet">
    			<h2>Diet</h2>
    			<input type="text" class="form-control" id="selectedDate" name="mealDate" readonly>
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
</div>
<!-- 달력 끝 -->
  <hr>
  <div class="container">
    <div class="d-flex">
        <button class="btn btn-dark me-2" data-bs-toggle="modal" data-bs-target="#myModal">추가</button>
        <a href="${pageContext.request.contextPath }/diet/dietInfo" class="btn btn-dark">식단 기록</a>
    </div>
  </div>
  <hr>
<div class="container bg-white rounded border border-2">
    <div class="align-items-center">
    <h4 class="border-dark">식단 리스트</h4>
    <h4>${date }</h4>
 	<table class="table table-striped">
	 <thead>
	  <tr>
	   <th scope="col">식사</th>
	   <th scope="col">이름</th>
	   <th scope="col">무게</th>
	   <th scope="col">탄수화물</th>
	   <th scope="col">단백질</th>
	   <th scope="col">지방</th>
	   <th scope="col">칼로리</th>
	   <th scope="col">삭제</th>
	  </tr>
     </thead>
     <tbody>
     	<c:forEach var="item" items="${dList }">
     		<tr id="a${item.num }">
     	 		<td id="mealName">${item.mealType }</td>
     	 		<td>${item.foodName }</td>
     	 		<td>${item.foodWeight }</td>
     	 		<td>${item.carbo }</td>
     	 		<td>${item.protine }</td>
     			<td>${item.fat }</td>
     			<td>${item.calorie }</td>
     			<td>
     				<input type="checkbox" class="form-check-input" value="${item.num }" id="checkDiet" 
     				onchange="dietDelete()"
     				name="checkDiet">
     			</td>
     		</tr>
     	</c:forEach>
     </tbody>
	</table>
	<div class="container">
		<h4>합계</h4>
		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col">탄수화물</th>
					<th scope="col">단백질</th>
					<th scope="col">지방</th>
					<th scope="col">칼로리</th>
				</tr>
			</thead>
				<tr>
					<td>${cartot }</td>
					<td>${protot }</td>
					<td>${fattot }</td>
					<td>${caltot }</td>
				</tr>
		</table>
	</div>
   </div>
  </div>

  <!-- 추가 모달 창 -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">추가 창</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <!-- 추가 모달 내용 -->
        <div class="container">
        		  <div class="container mt-5">
    				<h2>식단 추가</h2>
    					<form action="${pageContext.request.contextPath }/diet/dietPro" method="POST">
      			 			<div class="mb-3">
        						<div class="mb-3">
        							<label for="dietTime" class="form-label">시간대</label>
        							<select class="form-select" id="dietTime" name="meal" autocomplete="on">
        								<option value="0" name="0">선택</option>
          								<option value="1" name="breakfast">아침</option>
          								<option value="2" name="lunch">점심</option>
          								<option value="3" name="dinner">저녁</option>
          								<option value="4" name="snack">간식</option>
        							</select>
        						</div>
      						</div>
      						<div class="mb-3">
        						<label for="paraone" class="form-label" id="foodNameLabel">이름</label>
        						<input type="text" class="form-control" id="foodName" name="foodName" required onkeydown="startSuggest()">
        						<div id="suggestList" style="text-align : left;"></div>
      						</div>
      						<div class="mb-3">
        						<label for="paraone" class="form-label" id="foodWeightLabel">무게</label>
        						<input type="text" class="form-control" id="foodWeight" name="foodWeight" required>
      						</div>
      						<div class="mb-3">
        						<label for="paraone" class="form-label" id="carboLabel">탄수화물</label>
        						<input type="text" class="form-control" id="carbo" name="carbo" required>
      						</div>
      						<div class="mb-3">
        						<label for="paratwo" class="form-label" id="protineLabel">단백질</label>
        						<input type="text" class="form-control" id="protine" name="protine" required>
      						</div>
      						<div class="mb-3">
        						<label for="parathr" class="form-label" id="fatLabel">지방</label>
        						<input type="text" class="form-control" id="fat" name="fat" required>
      						</div>
      						<div class="mb-3">
        						<label for="parathr" class="form-label" id="calorieLabel">칼로리</label>
        						<input type="text" class="form-control" id="calorie" name="calorie" required>
      						</div>
      						<button type="submit" class="btn btn-dark">식단 추가</button>
    					</form>
 					 </div>
        		</div>
    </div>
  </div>
  
     <script>
   
 	/* 달력 스크립트 시작 */
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
      const currentMonth = currentDate.getMonth();
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
	/* 달력 스크립트 끝 */
    
    
  </script>
  
</body>
</html>
