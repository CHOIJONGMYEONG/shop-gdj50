<%@page import="service.EmployeeService"%>
<%@page import="shop.vo.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String approval = request.getParameter("approval");
String employeeId = request.getParameter("employeeId");

Employee paramEmpolyee = new Employee();

paramEmpolyee.setActive(approval);
paramEmpolyee.setEmployeeId(employeeId);

EmployeeService employeeService =new EmployeeService();
employeeService.modifyAppovalEmpolyee(paramEmpolyee);
response.sendRedirect(request.getContextPath()+"/quickloud-master/admin/employeeList.jsp");

%>