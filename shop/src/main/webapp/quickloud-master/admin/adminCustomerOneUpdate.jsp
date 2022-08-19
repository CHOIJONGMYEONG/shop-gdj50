<%@page import="service.CustomerService"%>
<%@page import="shop.vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

request.setCharacterEncoding("utf-8");
String customerId = request.getParameter("customerId");
String customerPass = request.getParameter("customerPw");
String customerName = request.getParameter("customerName");
String customeTelephone = request.getParameter("customerTelephone");
String customerAddress = request.getParameter("customerAddress");
String detailcustomerAddress = request.getParameter("detailcustomerAddress");

System.out.println(customerId);
System.out.println(customerPass);
System.out.println(customerName);
System.out.println(customeTelephone);
System.out.println(customerAddress);

//사용가능한 ID인지 분기
  
   


   Customer paramCustomer = new Customer();

   paramCustomer.setCustomerId(customerId);
   paramCustomer.setCustomerPass(customerPass);
   paramCustomer.setCustomerName(customerName);
   paramCustomer.setCustomerAddress(customerAddress +" "+detailcustomerAddress);
   paramCustomer.setCustomerTelephone(customeTelephone);

   CustomerService customerService = new CustomerService();
   customerService.modifyAdminCustomer(paramCustomer);


response.sendRedirect(request.getContextPath()+"/quickloud-master/admin/adminCustomerOne.jsp?customerId="+customerId);



%>