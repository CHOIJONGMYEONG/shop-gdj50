<%@page import="service.OrderService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="service.GoodsService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
	int orderNo = Integer.parseInt(request.getParameter("orderNo"));
 	System.out.print("오더넘버체크"+orderNo);
	OrderService service = new OrderService();
	Map<String,Object> map = new HashMap<String,Object>(); 
			
		map = service.getOrdersOne(orderNo);
		
	 System.out.print("네임"+map.get("customerName"));
	int goodsNo = (int) map.get("goodsNo");
	String goodsName = (String)map.get("goodsName");
	int goodsPrice = (int) map.get("goodsPrice");
	String updateDate = (String) map.get("GupdateDate");
	String createDate = (String)map.get("GcreateDate");
	String soldOut = (String)map.get("soldOut");
	
	int orderPrice = (int) map.get("orderPrice");
	String orderAddr = (String)map.get("orderAddr");
	int orderQuantity = (int) map.get("orderQuantity");
	String orderState = (String)map.get("orderState");
	String OupdateDate = (String)map.get("OupdateDate");
	String OcreateDate = (String)map.get("OcreateDate");
	
	String customerId = (String)map.get("customerId");
	String customerPass = (String)map.get("customerPass");
	String customerName = (String)map.get("customerName");
	String customerAddress = (String)map.get("customerAddress");
	String customerTelephone = (String)map.get("customerTelephone");
	String CupdateDate = (String)map.get("CupdateDate");
	String CcreateDate = (String)map.get("CcreateDate");
	
	
	
	
%>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<table border="1">
<tr>
    <td>고객아이디</td>
    <td><%=customerId %></td>
  </tr>


  <tr>
    <td>고객주소</td>
    <td><%=customerAddress %></td>
  </tr>
  <tr>
    <td>고객이름</td>
    <td><%=customerName %></td>
  </tr>
  <tr>
    <td>고객전화번호</td>
    <td><%=customerTelephone %></td>
  </tr>
   <tr>
    <td>고객아이디생긴날</td>
    <td><%=CupdateDate %></td>
  </tr>
 
  </tbody>
</table>



</body>
</html>