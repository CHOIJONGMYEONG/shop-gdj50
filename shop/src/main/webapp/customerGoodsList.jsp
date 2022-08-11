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
	List<Map<String,Object>> list = goodsService.selectCustomerGoodsListByPage(rowPerPage, currentPage);
	
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
		<a href="">인기순</a>
		<a href="">판매량순</a>
		<a href="">낮은가격순</a>
		<a href="">높은가격순</a>
		<a href="">최신순</a>
	</div>

	<table border="1">
		<tr>
			<%
				int i = 1; 
				for(Map<String,Object> m : list){
				System.out.print(m.get("goodsName"));			
				
			%>
					<td>
					<div><a href="">
					<img src='<%=request.getContextPath()%>/upload/<%=m.get("filename")%>' width="200" height="200"></a></div>
					<div><%=m.get("goodsName") %></div>
					<div><%=m.get("goodsPrice") %></div>
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

</body>
</html>