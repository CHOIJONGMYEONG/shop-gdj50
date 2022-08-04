<%@page import="service.CustomerService"%>
<%@page import="shop.vo.Customer"%>
<%@page import="shop.repository.CustomerDao"%>
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
		return; // 
	} */
	
	CustomerService loginCustomer =new CustomerService();
	Customer paramCustomer = new Customer();
	
	paramCustomer.setCustomerId(customerId);
	paramCustomer.setCustomerPass(customerPass);	
	
	if ((paramCustomer = loginCustomer.getCustomer(paramCustomer))==null){
	response.sendRedirect(request.getContextPath()+"/quickloud-master/loginForm.jsp");
		
	}
	
	
	if(paramCustomer.getCustomerId()!=null){
	// Object <-다형성 String 추상화,상속,다형성,캡슐화
	session.setAttribute("loginCustomer", paramCustomer); // Object <-다형성 Integer <-오토박싱 int
	session.setAttribute("loginType", "customer");
	response.sendRedirect(request.getContextPath()+"/quickloud-master/index.jsp");
	
	}else{response.sendRedirect(request.getContextPath()+"/quickloud-master/loginForm.jsp");
	
	}
	
%>
