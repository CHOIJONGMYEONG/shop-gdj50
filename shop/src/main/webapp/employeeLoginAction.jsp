<%@page import="shop.vo.Employee"%>
<%@page import="shop.model.EmployeeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	
	request.setCharacterEncoding("utf-8");
	
	String employeeId = request.getParameter("employeeId");
	String employeePass = request.getParameter("employeePass");
	
	
	/*if(session.getAttribute("loginMember")==null) {
		response.sendRedirect(request.getContextPath()+"/index.jsp?errorMsg=Invalid Access");
		return; // retrun; 대신 else 블록을 사용해도 된다.
	} */
	
	EmployeeDao login = new EmployeeDao();
	Employee employee = new Employee();
	
	
	employee.setEmployeeId(employeeId);
	employee.setEmployeePass(employeePass);	
	
	if ((employee = login.Employeelogin(employee))==null){
	response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
		
	}
	
	
	if(employee.getEmployeeId()!=null){
	// Object <-다형성 String 추상화,상속,다형성,캡슐화
	session.setAttribute("loginEmployee", employee); // Object <-다형성 Integer <-오토박싱 int
	session.setAttribute("loginType", "employee");
	response.sendRedirect(request.getContextPath()+"/index.jsp");
	
	}else{response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
	
	}
	
%>