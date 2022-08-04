<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>




<form action ="<%=request.getContextPath()%>/employeeInsertAction.jsp" method="post">
<table border="1">
<tr>
    <td>고객아이디</td>
    <td><input type="text" name ="employeeId">
    </td>
  </tr>

  <tr>
    <td>패스워드</td>
    <td><input type="password" name ="employeePass"></td>
  </tr>
  <tr>
    <td>이름</td>
    <td><input type="text" name ="employeeName"></td>
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
</html>