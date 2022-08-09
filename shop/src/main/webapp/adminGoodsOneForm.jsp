<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="service.GoodsService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
	int goodsNo = Integer.parseInt(request.getParameter("goodsNo"));
 	System.out.print(goodsNo);
	GoodsService service = new GoodsService();
	Map<String,Object> map = new HashMap<String,Object>(); 
			
		map = service.getGoodsAndImgOne(goodsNo);
	 System.out.print("네임"+map.get("goodsName"));
	String goodsName = (String)map.get("goodsName");
	int goodsPrice = (int) map.get("goodsPrice");
	String updateDate = (String) map.get("updateDate");
	String createDate = (String)map.get("createDate");
	String soldOut = (String)map.get("soldOut");
	String fileName= (String)map.get("fileName");
	String originFilename = (String)map.get("originFilename");
	String contentType = (String)map.get("contentType");
	String creatDate =(String) map.get("createDate");
	
	System.out.println(fileName +"경로");
	
%>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>




	<div>
		<a href="<%=request.getContextPath()%>/upload/<%=fileName%>" 
			download="<%=originFilename%>">
			<img src="<%=request.getContextPath()%>/upload/<%=fileName%>">
		</a>
	</div>

	<div>
		<a href="<%=request.getContextPath()%>/updateGoodsImgForm.jsp">수정</a>
		<a href="<%=request.getContextPath()%>/deleteGoodsImgForm.jsp">삭제</a>
	</div>


</body>
</html>