<%@page import="service.ReviewService"%>
<%@page import="shop.vo.Review"%>
<%@page import="service.CustomerService"%>
<%@page import="shop.vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
if (!(session.getAttribute("loginType").equals("customer"))) {
	response.sendRedirect(request.getContextPath() + "/quickloud-master/loginForm.jsp");
	return;
}

request.setCharacterEncoding("utf-8");
Customer ParamCustomer = ((Customer) session.getAttribute("loginCustomer"));

String customerId = ParamCustomer.getCustomerId();
int goodsNo = Integer.parseInt(request.getParameter("goodsNo"));
int ordersNo = Integer.parseInt(request.getParameter("ordersNo"));



Review paramReview = new Review();

paramReview.setCustomerId(customerId);
paramReview.setOrderNo(ordersNo);

ReviewService reviewService = new ReviewService();

reviewService.removeReview(paramReview);

response.sendRedirect(request.getContextPath() + "/quickloud-master/customerGoodsOneForm.jsp?goodsNo="+goodsNo);
%>