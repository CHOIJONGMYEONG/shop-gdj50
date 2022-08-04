<%@page import="shop.repository.EmployeeDao"%>
<%@page import="shop.vo.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

request.setCharacterEncoding("utf-8");
String employeeId = request.getParameter("employeeId");
String employeePass = request.getParameter("employeePass");
String employeeName = request.getParameter("employeeName");

System.out.print(employeeId);
System.out.print(employeePass);
System.out.print(employeeName);


//사용가능한 ID인지 분기
  
   
	/*String returnId = customerdao.selectMemberId(id);
   if(returnId != null) {
      response.sendRedirect(request.getContextPath()+"/insertMemberForm.jsp?errorMsg="+id+"already exist ID");
      return;
   } */


   Employee employee = new Employee();

   employee.setEmployeeId(employeeId);
   employee.setEmployeePass(employeePass);
   employee.setEmployeeName(employeeName);


   EmployeeDao employeedao = new EmployeeDao();
   employeedao.EmployeeInsert(employee);


response.sendRedirect(request.getContextPath()+"/loginForm.jsp");



%>