<%@page import="service.CustomerService"%>
<%@page import="shop.vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

request.setCharacterEncoding("utf-8");
String customerId = request.getParameter("customerId");



System.out.println(customerId);



   Customer paramCustomer = new Customer();

   paramCustomer.setCustomerId(customerId);

   CustomerService customerService = new CustomerService();
   customerService.deleteAdminCustomer(paramCustomer);


response.sendRedirect(request.getContextPath()+"/quickloud-master/admin/adminCustomerList.jsp");



%>