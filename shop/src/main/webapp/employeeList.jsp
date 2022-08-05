
<%@page import="java.util.ArrayList"%>
<%@page import="shop.vo.Employee"%>
<%@page import="service.EmployeeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
 <%
	if(session.getAttribute("loginType")==null){
		response.sendRedirect(request.getContextPath()+"/loginForm.jsp");		
		return;
	}
 
 int rowPerPage = 5;
 int currentPage= 1;
 if (request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
 
 
 

 ArrayList<Employee> employeeList = new ArrayList<Employee>();
 EmployeeService employeeService = new EmployeeService();
 
 employeeList = employeeService.getinfoEmpolyee(rowPerPage,currentPage);
 int totalRow = employeeService.getEmployeeAllCount();
 int lastPage = totalRow/rowPerPage;
 if(totalRow %rowPerPage!=0){
		lastPage +=1;}
 
 int pageBegin = ((currentPage - 1) / rowPerPage) * rowPerPage + 1; // 페이지 시작 넘버
int pageEnd = pageBegin + rowPerPage - 1; // 페이지 끝 글 구하는 공식
pageEnd = Math.min(pageEnd, lastPage); // 둘 중에 작은 값이 pageEnd
 
 
 %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



 <h1>관리자리스트</h1>
 		
			<table border="1">
      <thead>
         <tr>
            <th>관리자아이디</th>
            <th>관리자이름</th>
            <th>승인여부</th> 
           
         </tr>
      </thead>
      <tbody>
   
        <%
		for (Employee a : employeeList ){
		%>

    	           <tr>
                  <td><%=a.getEmployeeId()%></td>
                  <td><%=a.getEmployeeName()%></td>
                  
                   <td>
                   	<form action="<%=request.getContextPath()%>/employeeApprovalAction.jsp" method="post">
                  	<select name ="approval">

				<%
					if(a.getActive().equals("N")){
				%>
			
			
					<option>Y</option>
					<option selected="selected">N</option>
			
				<%
					}else{
				%>
					<option  selected="selected">Y</option>
					<option>N</option>
					</select>
			                  
			                   
			         <%      
			            }
			         %>           
			         <input type="hidden" value="<%=a.getEmployeeId()%>" name="employeeId">
			         <button type="submit">승인변경</button>
			           </form> 
			                    </td> 
			                    
			                  
			               </tr>
			           	
						
			         <%      
			            }
			         %>
 
         </tbody>
   </table>
	
<%
	/*int lastPage = boardDao.selectBoardLastPage(ROW_PER_PAGE);*/
	System.out.println(lastPage);
	if (pageBegin > rowPerPage) {
	%>
	
	<a href="<%=request.getContextPath()%>/employeeList.jsp?currentPage=<%=pageBegin - rowPerPage%>">이전</a>

	<%
	}

	for(int i = pageBegin; i <= pageEnd; i++){
		%>
			<a href="<%=request.getContextPath()%>/employeeList.jsp?currentPage=<%=i%>"><%=i%></a>
		<%
		}
	
	
	
	if (pageEnd < lastPage) {
	%>
	
	<a href="<%=request.getContextPath()%>/employeeList.jsp?currentPage=<%=pageBegin + rowPerPage%>">다음</a>
	<%
	}
	%>




</body>
</html>