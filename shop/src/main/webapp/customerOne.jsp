<%@page import="service.CustomerService"%>
<%@page import="shop.vo.Customer"%>
<%@page import="shop.repository.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Customer paramCustomer = ((Customer)session.getAttribute("loginCustomer"));

Customer customer = new Customer();
CustomerService customerservice =new CustomerService();

String customerId =paramCustomer.getCustomerId();
String customerPass = paramCustomer.getCustomerPass();
System.out.print("확인1"+customerId);


customer.setCustomerId(customerId);

customer = customerservice.getCustomer(customer);
System.out.print("확인"+customer.getCustomerId());


%>
	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

<form action="<%=request.getContextPath()%>/customerUpdate.jsp" method= "post" >
<table border="1">
<tr>
    <td>아이디</td>
    <td><%=customerId %></td>
  </tr>


  <tr>
  <td>이름</td>
    <td><input name ="customerName" value="<%=customer.getCustomerName() %>"></td>
   
  </tr>
  <tr>
     <td>주소</td>
    <td><input name ="customerAddress" value="<%=customer.getCustomerAddress() %>"></td>
  </tr>
  <tr>
    <td>전화번호</td>
    <td><input name ="customerTelephone" value="<%=customer.getCustomerTelephone() %>"></td>
  </tr>
   <tr>
    <td>아이디생성일자</td>
    <td><%=customer.getCreateDate() %></td>
  </tr>
  <tr>
  <td colspan="2" align="center">
   		<input type="submit" value="수정" class="btn btn-primary" />
   		<input type="reset" value="취소" class="btn btn-warning"/>
    </td>
    </tr>
  </tbody>
  
</table>
</form>
</body>
</html>