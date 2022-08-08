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
<form action ="<%=request.getContextPath()%>/idCheckAction.jsp" method="post">
	<div>
		ID 체크 
		<input type="text" name = "ckId">
		<button type ="submit">아이디중복검사</button>
		<input type=hidden name = "jb" value="customer">
	</div>


</form>

<!-- 고객가입form -->
<%
	String ckId= "";
	if(request.getParameter("ckId")!=null){
		ckId= request.getParameter("ckId");
		
	}
	String errorMsg="";
	if (request.getParameter("errorMsg")!=null){
		errorMsg = request.getParameter("errorMsg");
	}
	
%>

<%=errorMsg %>

<form action ="<%=request.getContextPath()%>/customerInsertAction.jsp" method="post" id ="writeForm">
<table border="1">
<tr>
    <td>고객아이디</td>
    <td><input type="text" name ="customerId" id="customerId" readonly="readonly" value="<%=ckId%>">
    </td>
  </tr>


  <tr>
    <td>패스워드</td>
    <td><input type="password" name ="customerPass" id="customerPass"></td>
  </tr>
  <tr>
    <td>이름</td>
    <td><input type="text" name ="customerName" id="customerName"></td>
  </tr>
  <tr>
    <td>주소</td>
    <td><input type="text" name ="customerAddress" id="customerAddress"></td>
  </tr>
   <tr>
    <td>전화번호</td>
    <td><input type="text" name ="customeTelephone" id="customeTelephone"></td>
  </tr>
 
  
  <tr>
   <td colspan="2" align="center">
   		<input type="submit" value="가입" class="btn btn-primary"/>
   		<input type="reset" value="취소" class="btn btn-warning"/>
    </td>
  </tr>
  </tbody>
</table>
</form>


</body>
<script>
$(function(){
    $("#writeForm").submit(function(){
       if($("#customerId").val()==""){
           alert("아이디가 빈칸입니다!");
           $("#customerId").focus();
           return false;
        }
       
       if($("#customerPass").val()==""){
          alert("비밀번호가 빈칸입니다!");
          $("#customerPass").focus();
          return false;
       }
       if($("#customerName").val()==""){
          alert("이름이 빈칸입니다!");
          $("#customerName").focus();
          return false;
       }
       if($("#customerAddress").val()==""){
           alert("주소가 빈칸입니다!");
           $("#customerAddress").focus();
           return false;
        }
       if($("#customeTelephone").val()==""){
           alert("전화번호가 빈칸입니다!");
           $("#customeTelephone").focus();
           return false;
        }
       
       
    });
 });





</script>
</html>