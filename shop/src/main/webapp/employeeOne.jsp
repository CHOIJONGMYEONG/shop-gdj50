<%@page import="shop.vo.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%
Employee paramEmployee = ((Employee)session.getAttribute("loginEmployee"));

String  employeeId =paramEmployee.getEmployeeId();
String employeeName  = paramEmployee.getEmployeeName();
String createDate = paramEmployee.getCreateDate();
%> 
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="1">
<tr>
    <td>아이디</td>
    <td><%=employeeId %></td>
  </tr>


  <tr>
  <td>이름</td>
    <td><%=employeeName %></td>
   
  </tr>
  
   <tr>
    <td>아이디생성일자</td>
    <td><%=createDate %></td>
  </tr>
 
  </tbody>
</table>
</body>
</html>