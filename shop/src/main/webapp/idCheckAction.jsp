<%@page import="service.SignService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	

	
	String jb = request.getParameter("jb");
	String ckId =request.getParameter("ckId");

	SignService existservice = new SignService();
	
	boolean check = existservice.idCheck(ckId);

	// service -> false 
	
	
	
	if(jb.equals("customer")){
		if (!check){
		response.sendRedirect(request.getContextPath()+"/customerInsertForm.jsp?errorMsg=badId");
		}// service -> true
		
		else if (check){
			response.sendRedirect(request.getContextPath()+"/customerInsertForm.jsp?ckId="+ckId);
		}
	}
	if(jb.equals("employee")){
		if (!check){
		response.sendRedirect(request.getContextPath()+"/employeeInsertForm.jsp?errorMsg=badId");
		}// service -> true
		
		else if (check){
			response.sendRedirect(request.getContextPath()+"/employeeInsertForm.jsp?ckId="+ckId);
		}
	}
	
	
	
	
	
	
	
	
%>   