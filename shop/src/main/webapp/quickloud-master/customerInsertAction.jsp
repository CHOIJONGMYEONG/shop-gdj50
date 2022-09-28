<%@page import="service.CustomerService"%>
<%@page import="shop.vo.Customer"%>
<%@page import="shop.repository.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if (session.getAttribute("loginType")!=null) {
	response.sendRedirect(request.getContextPath() + "/quickloud-master/loginForm.jsp");
	return;
}

else{
request.setCharacterEncoding("utf-8");
String customerId = request.getParameter("customerId");
String customerPass = request.getParameter("CustomerPass");
String customerName = request.getParameter("customerName");
String customeTelephone = request.getParameter("customeTelephone");
String customerAddress = request.getParameter("customerAddress");
String detailcustomerAddress = request.getParameter("detailcustomerAddress");

System.out.println(customerId);
System.out.println(customerPass);
System.out.println(customerName);
System.out.println(customeTelephone);
System.out.println(customerAddress);

//사용가능한 ID인지 분기
  
   
	/*String returnId = customerdao.selectMemberId(id);
   if(returnId != null) {
      response.sendRedirect(request.getContextPath()+"/insertMemberForm.jsp?errorMsg="+id+"already exist ID");
      return;
   }*/


   Customer paramCustomer = new Customer();

   paramCustomer.setCustomerId(customerId);
   paramCustomer.setCustomerPass(customerPass);
   paramCustomer.setCustomerName(customerName);
   paramCustomer.setCustomerAddress(customerAddress +" "+detailcustomerAddress);
   paramCustomer.setCustomerTelephone(customeTelephone);

   CustomerService insertService = new CustomerService();
    insertService.addCustomer(paramCustomer);


response.sendRedirect(request.getContextPath()+"/quickloud-master/loginForm.jsp");
}


%>