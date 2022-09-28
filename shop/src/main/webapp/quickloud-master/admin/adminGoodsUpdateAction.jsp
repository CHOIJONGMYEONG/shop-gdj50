<%@page import="service.GoodsService"%>
<%@page import="shop.vo.Goods"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(!(session.getAttribute("loginType").equals("employee"))){
	response.sendRedirect(request.getContextPath()+"/quickloud-master/loginForm.jsp");		
	return;
}

request.setCharacterEncoding("utf-8");
int goodsPrice = Integer.parseInt(request.getParameter("goodsPrice"));
String goodsName = request.getParameter("goodsName");
int goodsNo = Integer.parseInt(request.getParameter("goodsNo"));

System.out.println(goodsPrice);
System.out.println(goodsNo);
Goods goods = new Goods();

goods.setGoodsNo(goodsNo);
goods.setGoodsPrice(goodsPrice);
goods.setGoodsName(goodsName);

GoodsService goodsService =new GoodsService();
goodsService.goodsOneModify(goods);
response.sendRedirect(request.getContextPath()+"/quickloud-master/admin/adminGoodsOneForm.jsp?goodsNo="+goodsNo);
%>