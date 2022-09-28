<%@page import="service.OrderService"%>
<%@page import="shop.vo.Orders"%>
<%@page import="shop.vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
if (!(session.getAttribute("loginType").equals("customer"))) {
	response.sendRedirect(request.getContextPath() + "/quickloud-master/loginForm.jsp");
	return;
}


String customerId= ((Customer)session.getAttribute("loginCustomer")).getCustomerId();
int goodsNo = Integer.parseInt(request.getParameter("goodsNo"));
int orderQuantity = Integer.parseInt(request.getParameter("p_num1"));
int goodsPrice = Integer.parseInt(request.getParameter("p_price"));
int orderPrice = goodsPrice*orderQuantity;
String orderAddr= request.getParameter("customerAddress")+ " "+request.getParameter("customerDetailAddress");
String orderState = "상품준비중";


System.out.println(goodsNo);
System.out.println(orderQuantity);
Orders orders = new Orders();

orders.setGoodsNo(goodsNo);
orders.setCustomerId(customerId);
orders.setOrderQuantity(orderQuantity);
orders.setOrderPrice(orderPrice);
orders.setOrderAddr(orderAddr);
orders.setOrderState(orderState);

OrderService orderService =new OrderService();
orderService.ordesrAdd(orders);
response.sendRedirect(request.getContextPath()+"/quickloud-master/loginForm.jsp");
%>



