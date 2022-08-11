
<%@page import="shop.vo.Customer"%>
<%@page import="shop.repository.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Customer paramCustomer = ((Customer)session.getAttribute("loginCustomer"));

paramCustomer.getCustomerId();
paramCustomer.getCustomerName();
paramCustomer.getCustomerTelephone();
paramCustomer.getCreateDate();

%>
	

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>


</body>
</html>