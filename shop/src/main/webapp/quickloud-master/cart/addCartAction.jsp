<%@page import="shop.vo.Employee"%>
<%@page import="shop.vo.Customer"%>
<%@page import="shop.vo.Cart"%>
<%@page import="service.CartService"%>
<%@page import="shop.vo.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
System.out.println("---------------- addCartAction.jsp");
// 세션 유효성 검사
if(session.getAttribute("id") == null){	
	response.sendRedirect(request.getContextPath() + "/customerLoginForm.jsp?errorMsg=login needed");
	return;
}
if(!(session.getAttribute("user").equals("Customer"))){
	response.sendRedirect(request.getContextPath() + "/admin/adminIndex.jsp?errorMsg=admin user cannot buy products");
	return;
}
// goodsNo, customerId, cartQuantity
int goodsNo = Integer.parseInt(request.getParameter("goodsNo"));
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
// 상세페이지 접근 전 리스트에서 바로 장바구니에 추가한 경우 기본값 1
int cartQuantity = 1;
// 상세 페이지 등에서 수량을 입력한 경우
if(request.getParameter("cartQuantity") != null){
	cartQuantity = Integer.parseInt(request.getParameter("cartQuantity"));
}
// vo 세팅
Cart cart = new Cart();
cart.setGoodsNo(goodsNo);
cart.setCustomerId(Id);
cart.setCartQuantity(cartQuantity);
System.out.println(cart);
// 서비스 호출
CartService cartService = new CartService();
boolean result = cartService.addCart(cart);
response.sendRedirect(request.getContextPath() + "/cart/cartList.jsp?id=" + Id);
%>