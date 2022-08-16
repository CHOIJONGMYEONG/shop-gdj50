<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
</script>
<script>
$(document).ready(function() {
	let x = [];
    let y = [];
    let x1 = [];
    let y1 = [];
    
   $.ajax({
      url : '/shop/controller/getCountByHiredate',
      type : 'get',
      success : function(json) {
         console.log(json);
         $(json).each(function(index, item) {
			x.push(item.m);
			y.push(item.cnt);
        	 let html = '<tr>';
            html += '<td>'+item.m+'</td>';
            html += '<td>'+item.cnt+'</td>';
            html += '</tr>';
            $('#deptCnt').append(html);
         });
         
        
         let barColors = ["red", "green","blue","orange","brown"];

         new Chart("myChart1", {
           type: "bar",
           data: {
             labels: x,
             datasets: [{
               backgroundColor: barColors,
               data: y
             }]
           },
           options: {
             legend: {display: false},
             title: {
               display: true,
               text: "Goodee2022"
             },
             scales: {
       	      yAxes: [{ticks: {min: 0, max:10}}]
       	    }
           }
         });
         
      }
   });
  
   $.ajax({
      url : '/shop/controller/getCountByCustomer',
      type : 'get',
      data : {year : $('#year').val()},
      success : function(json) {
         console.log(json);
         $(json).each(function(index, item) {
        	x1.push(item.m);
 			y1.push(item.cnt);
            let html = '<tr>';
            html += '<td>'+item.m+'</td>';
            html += '<td>'+item.cnt+'</td>';
            html += '</tr>';
            $('#hiredateCnt').append(html);
         });
         

         new Chart("myChart2", {
        	  type: "line",
        	  data: {
        	    labels: x1,
        	    datasets: [{
        	      fill: false,
        	      lineTension: 0,
        	      backgroundColor: "rgba(0,0,255,1.0)",
        	      borderColor: "rgba(0,0,255,0.1)",
        	      data: y1
        	    }]
        	  },
        	  options: {
        	    legend: {display: false},
        	    scales: {
        	      yAxes: [{ticks: {min: 0, max:10}}],
        	    }
        	  }
        	});
         
         
      }
   });
   
});
</script>
</head>
<body>
   <div>
      <h2>부서별 인원</h2>
      <table border="1">
         <thead>
            <tr>
               <th>부서명</th>
               <th>인원수</th>
            </tr>   
         </thead>
         <tbody id="deptCnt">
         </tbody>
      </table>
      <canvas id="myChart1" style="width:100%;max-width:700px"></canvas>
   </div>
   
   <div>
      <h2>월별 입사인원</h2>
      <select id="year">
         <option value="2022">2022</option>
      </select>
      <table border="1">
         <thead>
            <tr>
               <th>월</th>
               <th>인원수</th>
            </tr>   
         </thead>
         <tbody id="hiredateCnt">
         </tbody>
      </table>
      <canvas id="myChart2" style="width:100%;max-width:700px"></canvas>
   </div>
</body>
</html>