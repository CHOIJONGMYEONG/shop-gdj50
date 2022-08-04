<%@page import="shop.vo.Employee"%>
<%@page import="service.EmployeeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String employeePass= request.getParameter("employeePass");
System.out.println("비번:"+employeePass);
Employee paramEmployee = ((Employee)session.getAttribute("loginEmployee"));

EmployeeService deleteService = new EmployeeService();

paramEmployee.setEmployeePass(employeePass);

deleteService.removeEmployee(paramEmployee);

response.sendRedirect(request.getContextPath()+"/loginForm.jsp");

%>