<%@page import="service.ReviewService"%>
<%@page import="shop.vo.Review"%>
<%@page import="shop.vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%



if (!(session.getAttribute("loginType").equals("customer"))) {
	response.sendRedirect(request.getContextPath() + "/quickloud-master/loginForm.jsp");
	return;
}

Customer SessionCustomer = (Customer) session.getAttribute("loginCustomer");
String Id = SessionCustomer.getCustomerId();
String Name = SessionCustomer.getCustomerName();

int ordersNo = Integer.parseInt(request.getParameter("ordersNo"));
String reviewContent = request.getParameter("reviewContent");

Review review = new Review();
review.setCustomerId(Id);
review.setOrderNo(ordersNo);
review.setReviewContent(reviewContent);

ReviewService reviewService = new ReviewService();
reviewService.addReview(review);

response.sendRedirect(request.getContextPath()+"/quickloud-master/customerOrderList.jsp");

%>