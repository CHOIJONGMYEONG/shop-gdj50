<%@page import="shop.vo.Employee"%>
<%@page import="shop.vo.Customer"%>
<%@page import="shop.vo.Orders"%>
<%@page import="java.util.*"%>
<%@page import="service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
System.out.println("=======orderAllAction========");
//세션 유효성 검사
request.setCharacterEncoding("utf-8");


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
String orderAddr= request.getParameter("customerAddress")+ " "+request.getParameter("customerDetailAddress");
CartService cartService = new CartService();
List<Map<String, Object>> list = cartService.getCartList(Id);
int itemCount = 1; 
System.out.println("map: " + list.get(0));
for(Map<String, Object> m : list){
	
	
	Orders order = new Orders();
	order.setGoodsNo((int)m.get("goodsNo"));
	order.setCustomerId(Id);
	int OrderQuantity=Integer.parseInt(request.getParameter("p_num"+itemCount));
	itemCount+=1;
	order.setOrderQuantity(OrderQuantity);
	int totalPrice = (int)m.get("goodsPrice") * order.getOrderQuantity();
	order.setOrderPrice(totalPrice);
	order.setOrderAddr(orderAddr);
	order.setOrderState("상품준비중");
	
	m.get("goodsNo");
	m.put("customerId", Id);
	
	boolean result = cartService.orderCartOne(m,order);
	
	if(result){
		continue;
	}
}
response.sendRedirect(request.getContextPath() + "/quickloud-master/cart/cartList.jsp");
%>