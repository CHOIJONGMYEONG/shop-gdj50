<%@page import="service.NoticeService"%>
<%@page import="shop.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

if(!(session.getAttribute("loginType").equals("employee"))){
	response.sendRedirect(request.getContextPath()+"/quickloud-master/loginForm.jsp");		
	return;
}



request.setCharacterEncoding("utf-8");
int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
String noticeTitle = request.getParameter("noticeTitle");
String noticeContent = request.getParameter("noticeContent");

System.out.println(noticeNo);
System.out.println(noticeTitle);
Notice noticeParam = new Notice();

noticeParam.setNoticeNo(noticeNo);
noticeParam.setNoticeTitle(noticeTitle);
noticeParam.setNoticeContent(noticeContent);

NoticeService noticeService =new NoticeService();
noticeService.modifyNotice(noticeParam);
response.sendRedirect(request.getContextPath()+"/quickloud-master/admin/adminNoticeOneForm.jsp?noticeNo="+noticeNo);
%>