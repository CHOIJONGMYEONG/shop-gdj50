<%@page import="shop.vo.Customer"%>
<%@page import="shop.repository.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

request.setCharacterEncoding("utf-8");
String customerId = request.getParameter("customerId");
String customerPass = request.getParameter("customerPass");
String customerName = request.getParameter("customerName");
String customeTelephone = request.getParameter("customeTelephone");
String customerAddress = request.getParameter("customerAddress");

System.out.print(customerId);
System.out.print(customerPass);
System.out.print(customerName);
System.out.print(customeTelephone);
System.out.print(customerAddress);

//사용가능한 ID인지 분기
  
   
	/*String returnId = customerdao.selectMemberId(id);
   if(returnId != null) {
      response.sendRedirect(request.getContextPath()+"/insertMemberForm.jsp?errorMsg="+id+"already exist ID");
      return;
   }*/


   Customer customer = new Customer();

   customer.setCustomerId(customerId);
   customer.setCustomerPass(customerPass);
   customer.setCustomerName(customerName);
   customer.setCustomerAddress(customerAddress);
   customer.setCustomerTelephone(customeTelephone);

   CustomerDao customerdao = new CustomerDao();
   customerdao.CustomeInsert(customer);


response.sendRedirect(request.getContextPath()+"/loginForm.jsp");



%>