<%@page import="shop.vo.Employee"%>
<%@page import="shop.vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<% 
 
	if(session.getAttribute("loginType")==null){
		response.sendRedirect(request.getContextPath()+"/loginForm.jsp");		
		return;
	}
 	
 
 
   String loginType = (String)session.getAttribute("loginType");
	String Id = "";
	String Name = "";
	String delete = "";
   if (loginType.equals("customer")){
	    Id= ((Customer)session.getAttribute("loginCustomer")).getCustomerId();
	  Name= ((Customer)session.getAttribute("loginCustomer")).getCustomerName(); 
	  delete = "customerDeleteForm.jsp";
   }else if ( loginType.equals("employee")) {
	   
	   Id=((Employee)session.getAttribute("loginEmployee")).getEmployeeId();
	    Name=((Employee)session.getAttribute("loginEmployee")).getEmployeeName();
	    delete = "employeeDeleteForm.jsp";
   }
 
   
%>       
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
	<ul>
	<li><a href="<%=request.getContextPath()%>/admin/employeeList.jsp">사원관리</a></li>
	<li><a href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp">상품관리</a></li> <!-- 상품목록/등록/수정(품절)/삭제(장바구니 ,주문이 없는 경우) -->
	<li><a href="<%=request.getContextPath()%>/admin/adminOrdersList.jsp">주문관리</a></li><!-- 주문목록/수정 -->
	<li><a href="<%=request.getContextPath()%>/admin/adminCustomerList.jsp">고객관리</a></li><!-- 고객목록/강제탈퇴/비밀번호수정(전달구현X) -->
	<li><a href="<%=request.getContextPath()%>/admin/adminNoticeList.jsp">공지관리</a></li><!-- CRUD -->
</ul>
</div>



<div> 
	<%=Name%>님 환영합니다
	당신의 Id는<%=Id %>입니다.
	<a href="<%=request.getContextPath()%>/logout.jsp">로그아웃</a>
	<a href="<%=request.getContextPath()%>/employeeOne.jsp">정보보기</a>
	<a href="<%=request.getContextPath()%>/<%=delete%>">회원탈퇴</a>
</div>
	
	
</body>
</html>