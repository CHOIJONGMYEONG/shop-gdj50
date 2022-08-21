<%@page import="service.NoticeService"%>
<%@page import="shop.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

request.setCharacterEncoding("utf-8");
int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));

System.out.println(noticeNo);
Notice noticeParam = new Notice();

noticeParam.setNoticeNo(noticeNo);

NoticeService noticeService =new NoticeService();
noticeService.deleteNotice(noticeParam);
response.sendRedirect(request.getContextPath()+"/quickloud-master/admin/adminNoticeList.jsp");
%>