<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <title>Top Menu</title>
    <script>
	function aeroRead() {
		const xhttp = new XMLHttpRequest();
		const parms = "?aero=" + document.querySelector("#aero").value;
		xhttp.open("GET", "${pageContext.request.contextPath}/workout/workoutMenu" + parms, true)
		xhttp.send();
		xhttp.onreadystatechange = callBack;
		}
	
	function callBack() {
		if(this.readyState == 4 && this.status == 200) {
			let str = this.responseText.split(':')
			document.querySelector("#woName").innerHTML = str[1]
				if (str[0]==1) {
					document.querySelector("#paraoneName").innerHTML = "무게";
					document.querySelector("#paratwoName").innerHTML = "횟수";
					document.querySelector("#parathrName").innerHTML = "세트";
				} else if(str[0] == 2) {
					document.querySelector("#paraoneName").innerHTML = "거리";
					document.querySelector("#paratwoName").innerHTML = "시간";
					document.querySelector("#parathrName").innerHTML = "평균속력";
				}
			}
		}
	
	function workoutDelete() {
		const check = document.querySelector("#checkWorkout:checked").value;
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
    			xhttp.open("POST", "${pageContext.request.contextPath}/workout/workoutDeletePro?num=" + check, true);
    			xhttp.send();
			}
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
    		<form action="${pageContext.request.contextPath }/workout/workout">
    			<h2>Workout</h2>
    			<input type="text" class="form-control" id="selectedDate" name="woDate" readonly>
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
  <div class="container">
    <div class="d-flex">
        <button class="btn btn-dark me-2" data-bs-toggle="modal" data-bs-target="#myModal">추가</button>
        <a href="${pageContext.request.contextPath }/workout/workoutInfo" class="btn btn-dark" >운동 기록</a>
    </div>
  </div>
  
  <hr>
  <div class="container bg-white rounded border border-2">
    <div class="align-items-center">
    <h4 class="border-dark">운동 리스트</h4>
    <h4>${date }</h4>
 	<table class="table table-striped">
	 <thead>
	  <tr>
	   <th scope="col">운동 이름</th>
	   <th scope="col">무게(거리)</th>
	   <th scope="col">횟수(시간)</th>
	   <th scope="col">세트</th>
	   <th scope="col">삭제</th>
	  </tr>
     </thead>
     <tbody>
     	<c:forEach var="item" items="${woListDate }">
     		<tr id="a${item.num }">
     	 		<td>${item.woName }</td>
     	 		<td>${item.paraone }</td>
     	 		<td>${item.paratwo }</td>
     			<td>${item.parathr }</td>
     			<td>
     				<input type="checkbox" class="form-check-input" value="${item.num }" id="checkWorkout" 
     				onchange="workoutDelete()"
     				name="checkWorkout">
     			</td>
     		</tr>
     	</c:forEach>
     </tbody>
	</table>
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
    				<h2>운동 추가</h2>
    					<form action="${pageContext.request.contextPath }/workout/workoutPro" method="POST">
      			 			<div class="mb-3">
        						<div class="mb-3">
        							<label for="aerobicAnaerobic" class="form-label">무산소/유산소</label>
        							<select class="form-select" id="aero" name="aero" autocomplete="on" onchange="aeroRead()">
        								<option value="0" name="0">선택</option>
          								<option value="1" name="1">무산소</option>
          								<option value="2" name="2">유산소</option>
        							</select>
        						</div>
      						</div>
      						<div class="mb-3">
        						<label for="woName" class="form-label">종류</label>
        						<select class="form-select" name="woName" id="woName">
        							<option value="0" name="0">선택</option>
        						</select>
      						</div>
      						<div class="mb-3">
        						<label for="paraone" class="form-label" id="paraoneName"></label>
        						<input type="text" class="form-control" id="paraone" name="paraone" required>
      						</div>
      						<div class="mb-3">
        						<label for="paratwo" class="form-label" id="paratwoName"></label>
        						<input type="text" class="form-control" id="paratwo" name="paratwo" required>
      						</div>
      						<div class="mb-3">
        						<label for="parathr" class="form-label" id="parathrName"></label>
        						<input type="text" class="form-control" id="parathr" name="parathr" required>
      						</div>
      						<button type="submit" class="btn btn-dark">운동 추가</button>
    					</form>
 					 </div>
        		</div>
        </div>
      </div>
    </div>
  </div>
  
   <script>
   
   
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
	
    
  </script>
</body>
</html>
