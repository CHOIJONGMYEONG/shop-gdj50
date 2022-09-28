<%@page import="service.GoodsService"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
if (!(session.getAttribute("loginType").equals("employee"))) {
	response.sendRedirect(request.getContextPath() + "/quickloud-master/loginForm.jsp");
	return;
}

int goodsNo = Integer.parseInt(request.getParameter("goodsNo"));
String fileName = request.getParameter("fileName");

String dir = request.getServletContext().getRealPath("/upload");

GoodsService goodsService = new GoodsService();
goodsService.removeGoods(goodsNo);

File f = new File(dir + "/" + fileName);
if (f.exists()) {
	f.delete();
}
response.sendRedirect(request.getContextPath() + "//quickloud-master/admin/adminGoodsList.jsp");
%>