<%@page import="shop.vo.Customer"%>
<%@page import="shop.vo.Employee"%>
<%@page import="service.EmployeeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(!(session.getAttribute("loginType").equals("employee"))){
	response.sendRedirect(request.getContextPath()+"/quickloud-master/loginForm.jsp");		
	return;
}


String employeePass= request.getParameter("employeePass");
System.out.println("비번:"+employeePass);
Employee paramEmployee = ((Employee)session.getAttribute("loginEmployee"));

EmployeeService deleteService = new EmployeeService();

paramEmployee.setEmployeePass(employeePass);

deleteService.removeEmployee(paramEmployee);

response.sendRedirect(request.getContextPath()+"/quickloud-master/admin/loginForm.jsp");

%>