
<%@page import="shop.vo.Goods"%>
<%@page import="java.util.List"%>
<%@page import="service.GoodsService"%>
<%@page import="java.util.ArrayList"%>
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
 
 
 

 List<Goods> GoodsList = new ArrayList<Goods>();
 GoodsService goodsService = new GoodsService();
 
 GoodsList = goodsService.getGoodsListByPage(rowPerPage, currentPage);
 int totalRow = goodsService.getGoodsAllCount();
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


 <h1>관리자리스트</h1>
 	<a href="<%=request.getContextPath()%>/admin/addGoodsForm.jsp">상품추가</a>	
			<table border="1">
      <thead>
         <tr>
            <th>상품번호</th>
            <th>이름</th>
            <th>가격</th> 
           
         </tr>
      </thead>
      <tbody>
   
        <%
		for (Goods a : GoodsList ){
		%>

    	         <tr>
    	         
    	        <td><a href="<%=request.getContextPath()%>/adminGoodsOneForm.jsp?goodsNo=<%=a.getGoodsNo()%>"><%=a.getGoodsNo() %></a></td>
    	          <td><%=a.getGoodsName()%> </td>
              	  <td><%=a.getGoodsPrice() %> </td>
              	
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