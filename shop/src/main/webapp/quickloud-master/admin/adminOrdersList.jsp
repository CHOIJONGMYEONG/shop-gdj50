<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="service.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
if(session.getAttribute("loginType")==null){
	response.sendRedirect(request.getContextPath()+"/quickloud-master/admin/loginForm.jsp");		
	return;
}

int rowPerPage = 5;
int currentPage= 1;
if (request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}


OrderService orderService = new OrderService();


List<Map<String,Object>> list = new ArrayList<>();


list = orderService.getOrderList(rowPerPage, currentPage);

int totalRow = orderService.getOrderAllCount();

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

<div>
	<ul>
	<li><a href="<%=request.getContextPath()%>/admin/employeeList.jsp">사원관리</a></li>
	<li><a href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp">상품관리</a></li> <!-- 상품목록/등록/수정(품절)/삭제(장바구니 ,주문이 없는 경우) -->
	<li><a href="<%=request.getContextPath()%>/admin/adminOrdersList.jsp">주문관리</a></li><!-- 주문목록/수정 -->
	<li><a href="<%=request.getContextPath()%>/admin/adminCustomerList.jsp">고객관리</a></li><!-- 고객목록/강제탈퇴/비밀번호수정(전달구현X) -->
	<li><a href="<%=request.getContextPath()%>/admin/adminNoticeList.jsp">공지관리</a></li><!-- CRUD -->
</ul>
</div>


 <h1>주문리스트</h1>
 
			<table border="1">
      <thead>
         <tr>
            <th>상품번호</th>
            <th>이름</th>
            <th>가격</th> 
          	<th>배송현황</th> 
           
         </tr>
      </thead>
      <tbody>
   
        <%
		for (Map<String,Object> a : list ){
		%>

    	         <tr>
    	         
    	        <td><a href="<%=request.getContextPath()%>/admin/adminOrdersOneForm.jsp?orderNo=<%=a.get("orderNo")%>"><%=a.get("orderNo") %></a></td>
    	          <td><a href="<%=request.getContextPath()%>/admin/adminOrderListByCustomer.jsp?customerId=<%=a.get("customerId")%>"><%=a.get("customerId")%></a> </td>
              	  <td><%=a.get("orderPrice") %> </td>
				 <td>
                   	<form action="<%=request.getContextPath()%>/admin/adminOrderStateAction.jsp" method="post">
                  	<select name ="orderState">

				<%
					if(a.get("orderState").equals("상품준비중")){
				%>
					<option selected="selected">상품준비중</option>
					<option>배송중</option>
					<option>배송완료</option>
					
			
				<%
					}else if(a.get("orderState").equals("배송중")){
				%>
					<option>상품준비중</option>
					<option selected="selected">배송중</option>
					<option>배송완료</option>
					
					
			                  
			    <%
					}else{
				%>	<option>상품준비중</option>
					<option>배송중</option>
					<option selected="selected">배송완료</option>
					
					</select>            
			                
			                
			                   
			         <%      
			            }
			         %>           
			         <input type="hidden" value="<%=a.get("orderNo")%>" name="orderNo">
			         <button type="submit">배송현황변경</button>
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
	
	<a href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp?currentPage=<%=pageBegin - rowPerPage%>">이전</a>

	<%
	}

	for(int i = pageBegin; i <= pageEnd; i++){
		%>
			<a href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp?currentPage=<%=i%>"><%=i%></a>
		<%
		}
	
	
	if (pageEnd < lastPage) {
	%>
	
	<a href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp?currentPage=<%=pageBegin + rowPerPage%>">다음</a>
	<%
	}
	%>




</body>
</html>