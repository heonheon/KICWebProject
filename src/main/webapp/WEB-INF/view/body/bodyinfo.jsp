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
    <h2>신체 기록</h2>
 </div>
  <hr>
  <div class="container mt-4">
  <h4>신체 그래프</h4>
<canvas id="myChart" style="width:100%;max-width:600px"></canvas>
<script>
const rawData = [
	  <c:forEach var="item" items="${list}" varStatus="loop">
	    <c:if test="${not loop.first}">,</c:if>
	    {
	      date: "<fmt:formatDate value="${item.bodyDate}" pattern="yyyy-MM-dd" />",
	      weight: ${item.bodyweight},
	      bmi: ${item.bmi},
	      bodyfat: ${item.bodyfat},
	      muscul: ${item.muscul}
	    }
	  </c:forEach>
	];
const recentData = rawData.slice(Math.max(rawData.length - 10, 0));

const xValues = recentData.map(item => item.date);

new Chart("myChart", {
	  type: "line",
	  data: {
	    labels: xValues,
	    datasets: [{
	      label: "체중",
	      data: recentData.map(item => item.weight),
	      borderColor: "red",
	      fill: false,
	      yAxisID: "y-axis-1"
	    },{
	      label: "BMI",
	      data: recentData.map(item => item.bmi),
	      borderColor: "green",
	      fill: false,
	      yAxisID: "y-axis-2"
	    },{
	      label: "체지방률",
	      data: recentData.map(item => item.bodyfat),
	      borderColor: "blue",
	      fill: false,
	      yAxisID: "y-axis-3"
	    },{
	      label: "골격근량",
	      data: recentData.map(item => item.muscul),
	      borderColor: "purple",
	      fill: false,
	      yAxisID: "y-axis-4"
	    }]
	  },
  options: {
    scales: {
      yAxes: [
        {
          type: "linear",
          display: false,
          position: "left",
          id: "y-axis-1",
          ticks: {
        	  beginAtZero: true,
              max: 100
          }
        },
        {
          type: "linear",
          display: false,
          position: "left",
          id: "y-axis-2",
          ticks: {
        	  beginAtZero: true,
              max: 100
          }
        },
        {
          type: "linear",
          display: false,
          position: "left",
          id: "y-axis-3",
          ticks: {
        	  beginAtZero: true,
              max: 100
          }
        },
        {
          type: "linear",
          display: false,
          position: "left",
          id: "y-axis-4",
          ticks: {
        	  beginAtZero: true,
              max: 100
          }
        }
      ]
    },
    legend: {
      display: true,
      position: "bottom"
    },
    tooltips: {
      mode: "index", 
      intersect: false,
      callbacks: {
        label: function(tooltipItem, data) {
          var label = data.datasets[tooltipItem.datasetIndex].label || "";
          var yLabel = tooltipItem.yLabel;
          return label + ": " + yLabel;
        }
      }
    },
    hover: {
      mode: "index",
      intersect: false
    }
  }
});

</script>
  </div>
  <hr>
  <div class="container bg-white rounded border border-2">
    <div class="align-items-center">
    <h4 class="border-dark">날짜별 기록</h4>
	<table class="table table-striped">
	 <thead>
	  <tr>
	   <th scope="col">날짜</th>
	   <th scope="col">키</th>
	   <th scope="col">체중</th>
	   <th scope="col">BMI</th>
	   <th scope="col">체지방률</th>
	   <th scope="col">골격근량</th>
	  </tr>
     </thead>
     <tbody>
     	<c:forEach var="item" items="${list}">
     		<tr>
     	 		<td id="date">
     	 			<fmt:formatDate value="${item.bodyDate}" pattern="yyyy-MM-dd" />
     	 		</td>
     	 		<td id="bh">${item.bodyheight}</td>
     	 		<td id="bw">${item.bodyweight}</td>
     	 		<td id="bmi">${item.bmi}</td>
     			<td id="bf">${item.bodyfat}</td>
     			<td id="mu">${item.muscul}</td>
     		</tr>
     	</c:forEach>
     </tbody>
	</table>
   </div>
  </div>
</body>
</html>
