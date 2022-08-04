<%@page import="shop.vo.Customer"%>
<%@page import="shop.vo.Employee"%>
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
	  delete = "customerDeleteAction.jsp";
   }else if ( loginType.equals("employee")) {
	   
	   Id=((Employee)session.getAttribute("loginEmployee")).getEmployeeId();
	    Name=((Employee)session.getAttribute("loginEmployee")).getEmployeeName();
	    delete = "employeeDeleteAction.jsp";
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
	<%=Name%>님 환영합니다
	당신의 Id는<%=Id %>입니다.
	<a href="<%=request.getContextPath()%>/logout.jsp">로그아웃</a>
	<a href="<%=request.getContextPath()%>/shopOne.jsp">정보보기</a>
	<a href="<%=request.getContextPath()%>/<%=delete%>">회원탈퇴</a>
	</div>

 <!-- 로그인 아이디 -->

  <!-- 로그인 이름 -->
</body>
</html>