<%@page import="service.CustomerService"%>
<%@page import="shop.vo.Customer"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if (!(session.getAttribute("loginType").equals("customer"))) {
	response.sendRedirect(request.getContextPath() + "/quickloud-master/loginForm.jsp");
	return;
}


String customerPass= request.getParameter("customerPass");


Customer paramCustomer = new Customer();



CustomerService deleteService = new CustomerService();
String customerId = ((Customer) session.getAttribute("loginCustomer")).getCustomerId();
System.out.println("아이디:"+customerId); // 디버깅
System.out.println("비번:"+customerPass); // 디버깅

paramCustomer.setCustomerId(customerId);
paramCustomer.setCustomerPass(customerPass);

deleteService.removeCustomer(paramCustomer);

response.sendRedirect(request.getContextPath()+"/quickloud-master/logout.jsp");

%>