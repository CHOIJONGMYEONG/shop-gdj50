<%@page import="shop.vo.Employee"%>
<%@page import="service.EmployeeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

Employee paramEmployee = ((Employee)session.getAttribute("loginEmployee"));

EmployeeService deleteService = new EmployeeService();

deleteService.removeEmployee(paramEmployee);


response.sendRedirect(request.getContextPath()+"/loginForm.jsp");

%>