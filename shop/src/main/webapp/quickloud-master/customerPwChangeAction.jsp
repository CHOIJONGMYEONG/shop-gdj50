<%@page import="service.CustomerService"%>
<%@page import="shop.vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if (!(session.getAttribute("loginType").equals("customer"))) {
	response.sendRedirect(request.getContextPath() + "/quickloud-master/loginForm.jsp");
	return;
}

request.setCharacterEncoding("utf-8");
String customerId = ((Customer) session.getAttribute("loginCustomer")).getCustomerId();
String nowCustomerPw = request.getParameter("nowCustomerPw");
String changePw = request.getParameter("changePw");



System.out.println(customerId);
System.out.println("현재 비밀번호" + nowCustomerPw);
System.out.println("변경할 비밀번호" + changePw);

//사용가능한 ID인지 분기
  
   boolean ok = false;


   Customer paramCustomer = new Customer();

   paramCustomer.setCustomerId(customerId);
   paramCustomer.setCustomerPass(changePw);
   

   CustomerService customerService = new CustomerService();
   ok = customerService.modifyCustomerPw(paramCustomer, nowCustomerPw);

if (ok =false)
{response.sendRedirect(request.getContextPath()+"/quickloud-master/customerOne.jsp");}
else {response.sendRedirect(request.getContextPath()+"/quickloud-master/logout.jsp");}



%>