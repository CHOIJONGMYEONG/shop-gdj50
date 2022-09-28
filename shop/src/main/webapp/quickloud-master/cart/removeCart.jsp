<%@page import="shop.vo.Cart"%>
<%@page import="service.CartService"%>
<%@page import="shop.vo.Employee"%>
<%@page import="shop.vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if (session.getAttribute("loginType") == null) {
	response.sendRedirect(request.getContextPath() + "/quickloud-master/loginForm.jsp");
	return;
}
String loginType = (String) session.getAttribute("loginType");
String Id = "";
String Name = "";
if (loginType.equals("customer")) {
	Id = ((Customer) session.getAttribute("loginCustomer")).getCustomerId();
	Name = ((Customer) session.getAttribute("loginCustomer")).getCustomerName();
} else if (loginType.equals("employee")) {

	Id = ((Employee) session.getAttribute("loginEmployee")).getEmployeeId();
	Name = ((Employee) session.getAttribute("loginEmployee")).getEmployeeName();

}
request.setCharacterEncoding("utf-8");
Cart cart = new Cart();

int goodsNo = Integer.parseInt(request.getParameter("goodsNo"));
cart.setCustomerId(Id);
cart.setGoodsNo(goodsNo);
CartService cartService = new CartService();
cartService.removeCart(cart);

response.sendRedirect(request.getContextPath()+"/quickloud-master/cart/cartList.jsp");

%>
