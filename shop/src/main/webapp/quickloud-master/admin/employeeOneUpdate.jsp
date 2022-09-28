<%@page import="service.EmployeeService"%>
<%@page import="shop.vo.Employee"%>
<%@page import="service.CustomerService"%>
<%@page import="shop.vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
if (!(session.getAttribute("loginType").equals("employee"))) {
	response.sendRedirect(request.getContextPath() + "/quickloud-master/loginForm.jsp");
	return;
}

Employee employee = (Employee) session.getAttribute("loginEmployee");
String Id = employee.getEmployeeId();
String Name = employee.getEmployeeName();
int lev = employee.getLev();

request.setCharacterEncoding("utf-8");
String employeePass = request.getParameter("employeePw");
String employeeName = request.getParameter("employeeName");

System.out.println(employeePass);
System.out.println(employeeName);

//사용가능한 ID인지 분기

Employee paramEmployee = new Employee();

paramEmployee.setEmployeeId(Id);
paramEmployee.setEmployeePass(employeePass);
paramEmployee.setEmployeeName(employeeName);

EmployeeService employeeService = new EmployeeService();
employeeService.modifyEmployee(paramEmployee);

response.sendRedirect(request.getContextPath() + "/quickloud-master/admin/adminOneForm.jsp");
%>