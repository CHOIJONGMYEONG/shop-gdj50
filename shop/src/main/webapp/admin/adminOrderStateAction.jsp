<%@page import="service.OrderService"%>
<%@page import="shop.vo.Orders"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
String orderState = request.getParameter("orderState");
int orderNo = Integer.parseInt(request.getParameter("orderNo"));



Orders orders = new Orders();
orders.setOrderState(orderState);
orders.setOrderNo(orderNo);
OrderService orderService = new OrderService();
orderService.adminStateModify(orders);


response.sendRedirect(request.getContextPath()+"/admin/adminOrdersList.jsp");

%>