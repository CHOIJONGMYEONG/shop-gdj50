<%@page import="service.GoodsService"%>
<%@page import="shop.vo.Goods"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String soldOut = request.getParameter("soldOut");
int goodsNo = Integer.parseInt(request.getParameter("goodsNo"));

System.out.println(soldOut);
System.out.println(goodsNo);
Goods goods = new Goods();

goods.setGoodsNo(goodsNo);
goods.setSoldOut(soldOut);

GoodsService goodsService =new GoodsService();
goodsService.goodsSoldOutModify(goods);
response.sendRedirect(request.getContextPath()+"/quickloud-master/admin/adminGoodsList.jsp");

%>