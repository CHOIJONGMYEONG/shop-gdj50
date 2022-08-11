<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<!-- id ck form -->
<div>
	<!-- 아이디 중복검사 -->
		ID 체크 
		<input type="text" name="idck" id="idck">
	<button type="button" id="idckBtn">아이디 중복검사</button>
		
		
	
	</div>



<!-- 고객가입form -->




<form action ="<%=request.getContextPath()%>/employeeInsertAction.jsp" method="post" id = "writeForm">
<table border="1">
<tr>
    <td>고객아이디</td>
    <td><input type="text" name ="employeeId" id="employeeId" readonly="readonly">
    </td>
  </tr>

  <tr>
    <td>패스워드</td>
    <td><input type="password" name ="employeePass" id ="employeePass"></td>
  </tr>
  <tr>
    <td>이름</td>
    <td><input type="text" name ="employeeName" id ="employeeName"></td>
  </tr>
  
 
  
  <tr>
   <td colspan="2" align="center">
   		<input type="submit" value="가입" class="btn btn-primary" id = "employeeBtn"/>
   		<input type="reset" value="취소" class="btn btn-warning"/>
    </td>
  </tr>
  </tbody>
</table>
</form>
</body>
<script>

$('#idckBtn').click(function() {
	if($('#idck').val().length < 4) {
		alert('id는 4자이상!');
	} else {
		// 비동기 호출	
		$.ajax({
			url : '/shop/idckController',
			type : 'post',
			data : {idck : $('#idck').val()},
			success : function(json) {
				// alert(json);
				if(json == 'y') {
					$('#employeeId').val($('#idck').val());
				} else {
					alert('이미 사용중인 아이디 입니다.');
					$('#employeeId').val('');
				}
			}
		});
	}
});







$(function(){
    $("#writeForm").submit(function(){
       if($("#employeeId").val()==""){
           alert("아이디가 빈칸입니다!");
           $("#employeeId").focus();
           return false;
        }
       
       if($("#employeePass").val()==""){
          alert("비밀번호가 빈칸입니다!");
          $("#employeePass").focus();
          return false;
       }
       if($("#employeeName").val()==""){
          alert("이름이 빈칸입니다!");
          $("#employeeName").focus();
          return false;
       }
    });
 });


</script>

</html>