<%@page import="service.CustomerService"%>
<%@page import="shop.vo.Customer"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


Customer paramCustomer = ((Customer)session.getAttribute("loginCustomer"));

CustomerService deleteService = new CustomerService();

deleteService.removeCustomer(paramCustomer);


response.sendRedirect(request.getContextPath()+"/loginForm.jsp");

%>