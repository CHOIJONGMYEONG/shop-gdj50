<%@page import="service.CustomerService"%>
<%@page import="shop.vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
Customer ParamCustomer = ((Customer)session.getAttribute("loginCustomer"));

String customerId = ParamCustomer.getCustomerId();
String customerName =request.getParameter("customerName");
String customerAddress= request.getParameter("customerAddress") + " " +request.getParameter("customerDetailAddress");
String customerTelephone=request.getParameter("customerTelephone");


Customer paramCustomer = new Customer();
paramCustomer.setCustomerName(customerName);
paramCustomer.setCustomerAddress(customerAddress);
paramCustomer.setCustomerTelephone(customerTelephone);
paramCustomer.setCustomerId(customerId);

CustomerService customerService = new CustomerService();

customerService.modifyCustomer(paramCustomer);

response.sendRedirect(request.getContextPath()+"/quickloud-master/customerOne.jsp");
%>