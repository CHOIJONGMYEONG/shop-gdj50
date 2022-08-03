<%@page import="shop.vo.Customer"%>
<%@page import="shop.model.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	
	request.setCharacterEncoding("utf-8");
	
	String customerId = request.getParameter("customerId");
	String customerPass = request.getParameter("customerPass");
	
	System.out.print(customerId);
	System.out.print(customerPass);
	
	/*if(session.getAttribute("loginMember")==null) {
		response.sendRedirect(request.getContextPath()+"/index.jsp?errorMsg=Invalid Access");
		return; // retrun; 대신 else 블록을 사용해도 된다.
	} */
	
	CustomerDao login = new CustomerDao();
	Customer customer = new Customer();
	
	
	customer.setCustomerId(customerId);
	customer.setCustomerPass(customerPass);	
	
	if ((customer = login.Customerlogin(customer))==null){
	response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
		
	}
	
	
	if(customer.getCustomerId()!=null){
	// Object <-다형성 String 추상화,상속,다형성,캡슐화
	session.setAttribute("loginCustomer", customer); // Object <-다형성 Integer <-오토박싱 int
	session.setAttribute("loginType", "customer");
	response.sendRedirect(request.getContextPath()+"/index.jsp");
	
	}else{response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
	
	}
	
%>
