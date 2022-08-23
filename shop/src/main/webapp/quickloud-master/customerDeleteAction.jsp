<%@page import="service.CustomerService"%>
<%@page import="shop.vo.Customer"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String customerPass= request.getParameter("customerPass");
System.out.println("비번:"+customerPass);

Customer paramCustomer = ((Customer)session.getAttribute("loginCustomer"));

CustomerService deleteService = new CustomerService();

paramCustomer.setCustomerPass(customerPass);

deleteService.removeCustomer(paramCustomer);

response.sendRedirect(request.getContextPath()+"/quickloud-master/logout.jsp");

%>