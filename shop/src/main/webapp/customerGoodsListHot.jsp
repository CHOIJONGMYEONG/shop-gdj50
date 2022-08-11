<%@page import="service.GoodsService"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "service.CustomerService" %>
<%
	// Controller : java class <- Servlet
	int rowPerPage = 20;
	if(request.getParameter("rowPerPage")!=null){
		rowPerPage = Integer.parseInt(request.getParameter("rowPerPage"));
	}
	
	int currentPage = 1;
	if(request.getParameter("currentPage")!=null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	GoodsService goodsService =new GoodsService();
	// listll
	List<Map<String,Object>> list = goodsService.selectCustomerHotGoodsListByPage(rowPerPage, currentPage);
	 int totalRow = goodsService.getGoodsAllCount();
	 int lastPage = totalRow/rowPerPage;
	 if(totalRow %rowPerPage!=0){
			lastPage +=1;}
	 
	 int pageBegin = ((currentPage - 1) / rowPerPage) * rowPerPage + 1; // 페이지 시작 넘버
	int pageEnd = pageBegin + rowPerPage - 1; // 페이지 끝 글 구하는 공식
	pageEnd = Math.min(pageEnd, lastPage); // 둘 중에 작은 값이 pageEnd
	
%>    
<!--  분리하면 servlet / 중계 forword(request,response /jsp -->
    
<!-- View : 태그--> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<!-- for / if 대체기술 : 커스텀태그(JSTL & EL) JSP -->
	<div>
		<a href="<%=request.getContextPath()%>/customerGoodsListHot.jsp">인기순</a>
		<a href="<%=request.getContextPath()%>/customerGoodsList.jsp">판매량순</a>
		<a href="<%=request.getContextPath()%>/customerGoodsListRowPrice.jsp">낮은가격순</a>
		<a href="<%=request.getContextPath()%>/customerGoodsListHighPrice.jsp">높은가격순</a>
		<a href="<%=request.getContextPath()%>/customerGoodsListNew.jsp">최신순</a>
	</div>

	<table border="1">
		<tr>
			<%
				int i = 1; 
				for(Map<String,Object> m : list){
				System.out.print(m.get("goodsName"));			
				
			%>
					<td>
					<div><a href="<%=request.getContextPath()%>/customerGoodsOneForm.jsp?goodsNo=<%=m.get("goodsNo")%>">
					<img src='<%=request.getContextPath()%>/upload/<%=m.get("filename")%>' width="200" height="200"></a></div>
					<div><%=m.get("goodsName") %></div>
					<div><%=m.get("goodsPrice") %>원</div>
					<!-- 리뷰개수 -->
					</td>
			<%
				if(i%4==0){
					
				
			%>
			
					</tr><tr>
			
			<%
					}
					i++;
				}
				int tdCnt = 4 - (list.size()% 4);
				if (tdCnt == 4){
					tdCnt = 0;
				}
				for(int j= 0; j<tdCnt;j++){
			%>		
					<td>&nbsp;</td>
			<%		
				}
			%>
			
			
		</tr>	
	</table>


<%
	/*int lastPage = boardDao.selectBoardLastPage(ROW_PER_PAGE);*/
	System.out.println(lastPage);
	if (pageBegin > rowPerPage) {
	%>
	
	<a href="<%=request.getContextPath()%>/customerGoodsList.jsp?currentPage=<%=pageBegin - rowPerPage%>">이전</a>

	<%
	}

	for(int y = pageBegin; y <= pageEnd; y++){
		%>
			<a href="<%=request.getContextPath()%>/customerGoodsList.jsp?currentPage=<%=y%>"><%=y%></a>
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