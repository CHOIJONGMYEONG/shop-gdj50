<%@page import="service.OrderService"%>
<%@page import="shop.vo.Orders"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
if (!(session.getAttribute("loginType").equals("employee"))) {
	response.sendRedirect(request.getContextPath() + "/quickloud-master/loginForm.jsp");
	return;
}

request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
String orderState = request.getParameter("orderState");
int orderNo = Integer.parseInt(request.getParameter("orderNo"));

Orders orders = new Orders();
orders.setOrderState(orderState);
orders.setOrderNo(orderNo);
OrderService orderService = new OrderService();
orderService.adminStateModify(orders);

response.sendRedirect(request.getContextPath() + "/quickloud-master/admin/adminOrdersList.jsp");
%>