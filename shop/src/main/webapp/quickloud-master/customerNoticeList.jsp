<%@page import="service.CounterService"%>
<%@page import="service.NoticeService"%>
<%@page import="shop.vo.Notice"%>
<%@page import="shop.vo.Employee"%>
<%@page import="shop.vo.Customer"%>
<%@page import="shop.vo.Goods"%>
<%@page import="java.util.List"%>
<%@page import="service.GoodsService"%>
<%@page import="java.util.ArrayList"%>
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

CounterService counterService = new CounterService();

int totalCounter = counterService.getTotalCount();
int todayCounter = counterService.getTodayCount();
int currentCount = (Integer) (application.getAttribute("currentCounter"));

int rowPerPage = 5;
int currentPage = 1;
if (request.getParameter("currentPage") != null) {
	currentPage = Integer.parseInt(request.getParameter("currentPage"));
}

List<Notice> NoticeList = new ArrayList<Notice>();
NoticeService noticeService = new NoticeService();

NoticeList = noticeService.getNoticeListByPage(rowPerPage, currentPage);
int totalRow = noticeService.getNoticeAllCount();
int lastPage = totalRow / rowPerPage;
if (totalRow % rowPerPage != 0) {
	lastPage += 1;
}

int pageBegin = ((currentPage - 1) / rowPerPage) * rowPerPage + 1; // 페이지 시작 넘버
int pageEnd = pageBegin + rowPerPage - 1; // 페이지 끝 글 구하는 공식
pageEnd = Math.min(pageEnd, lastPage); // 둘 중에 작은 값이 pageEnd
%>

<!DOCTYPE html>
<html lang="ko">

<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Site Metas -->
<title>QuickCloud - Hosting Responsive HTML5 Template</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
<link rel="apple-touch-icon" href="images/apple-touch-icon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="style.css">
<!-- ALL VERSION CSS -->
<link rel="stylesheet" href="css/versions.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="css/custom.css">

<!-- Modernizer for Portfolio -->
<script src="js/modernizer.js"></script>

<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body class="host_version">


	<!-- LOADER -->
	<div id="preloader">
		<div class="loader-container">
			<div class="progress-br float shadow">
				<div class="progress__item"></div>
			</div>
		</div>
	</div>
	<!-- END LOADER -->

	<!-- Start header -->
	<header class="top-navbar">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">
				<a class="navbar-brand"
					href="<%=request.getContextPath()%>/quickloud-master/index.jsp">
					<img style="width: 150px; height: 70px;"
					src="images/electshop2.png" alt="" />
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbars-host" aria-controls="navbars-rs-food"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbars-host">
					<ul class="navbar-nav ml-auto">

						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/quickloud-master/customerGoodsList.jsp">상품리스트</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/quickloud-master/customerNoticeList.jsp">공지사항</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/quickloud-master/cart/cartList.jsp">장바구니</a></li>
						<li class="nav-item"><a class="nav-link"> <%=Name%>님
								환영합니다
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/quickloud-master/customerOrderList.jsp">주문목록</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/quickloud-master/customerOne.jsp">내정보</a></li>

					</ul>
					<ul class="nav navbar-nav navbar-right">

						<li><a class="hover-btn-new log"
							href="<%=request.getContextPath()%>/quickloud-master/logout.jsp"><span>Customer
									LogOut</span></a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<!-- End header -->

	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<ul class="navbar-nav">
			<li class="nav-item active"><a class="nav-link">총접속자:<%=totalCounter%></a>
			</li>
			<li class="nav-item active"><a class="nav-link">오늘접속자:<%=todayCounter%></a></li>
			<li class="nav-item active"><a class="nav-link">현재접속자:<%=currentCount%></a></li>
		</ul>
	</nav>


	<div class="section lb">

		<div class="container">
			<div class="section-title text-center">
				<h3>공지사항</h3>

				<div class="dmoain-pricing">
					<div class="table-responsive-sm">
						<table>
							<thead>
								<tr class="domain-head">
									<th scope="col">번호</th>
									<th scope="col" colspan="2">제목</th>
									<th scope="col">등록날짜</th>

								</tr>
							</thead>
							<tbody>


								<%
								for (Notice a : NoticeList) {
								%>

								<tr>
									<td data-label="DOMAIN NAME"><%=a.getNoticeNo()%></td>
									<td data-label="DOMAIN NAME" colspan="2"><a
										href="<%=request.getContextPath()%>/quickloud-master/customerNoticeOneForm.jsp?noticeNo=<%=a.getNoticeNo()%>"><button
												class="btn btn-success"><%=a.getNoticeTitle()%></button></a></td>

									<td data-label="DOMAIN NAME"><%=a.getUpdateDate()%></td>

								</tr>

								<%
								}
								%>


							</tbody>
						</table>
					</div>
				</div>


				<%
				/*int lastPage = boardDao.selectBoardLastPage(ROW_PER_PAGE);*/
				System.out.println(lastPage);
				if (pageBegin > rowPerPage) {
				%>

				<a class="btn grd1 effect-1 btn-radius btn-brd"
					href="<%=request.getContextPath()%>/quickloud-master/customerNoticeList.jsp?currentPage=<%=pageBegin - rowPerPage%>">이전</a>

				<%
				}

				for (int i = pageBegin; i <= pageEnd; i++) {
				%>
				<a class="btn grd1 effect-1 btn-radius btn-brd"
					href="<%=request.getContextPath()%>/quickloud-master/customerNoticeList.jsp?currentPage=<%=i%>"><%=i%></a>
				<%
				}

				if (pageEnd < lastPage) {
				%>

				<a class="btn grd1 effect-1 btn-radius btn-brd"
					href="<%=request.getContextPath()%>/quickloud-master/customerNoticeList.jsp?currentPage=<%=pageBegin + rowPerPage%>">다음</a>
				<%
				}
				%>


			</div>
			<!-- end title -->
		</div>
		<!-- end container -->
	</div>
	<!-- end section -->


	<div class="parallax section dbcolor">
		<div class="container">
			<div class="row logos">
				<div class="col-md-2 col-sm-2 col-xs-6 wow fadeInUp">
					<a href="#"><img src="images/logo_01.png" alt=""
						class="img-repsonsive"></a>
				</div>
				<div class="col-md-2 col-sm-2 col-xs-6 wow fadeInUp">
					<a href="#"><img src="images/logo_02.png" alt=""
						class="img-repsonsive"></a>
				</div>
				<div class="col-md-2 col-sm-2 col-xs-6 wow fadeInUp">
					<a href="#"><img src="images/logo_03.png" alt=""
						class="img-repsonsive"></a>
				</div>
				<div class="col-md-2 col-sm-2 col-xs-6 wow fadeInUp">
					<a href="#"><img src="images/logo_04.png" alt=""
						class="img-repsonsive"></a>
				</div>
				<div class="col-md-2 col-sm-2 col-xs-6 wow fadeInUp">
					<a href="#"><img src="images/logo_05.png" alt=""
						class="img-repsonsive"></a>
				</div>
				<div class="col-md-2 col-sm-2 col-xs-6 wow fadeInUp">
					<a href="#"><img src="images/logo_06.png" alt=""
						class="img-repsonsive"></a>
				</div>
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</div>
	<!-- end section -->

	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-4 col-xs-12">
					<div class="widget clearfix">
						<div class="widget-title">
							<h3>About US</h3>
						</div>
						<p>Integer rutrum ligula eu dignissim laoreet. Pellentesque
							venenatis nibh sed tellus faucibus bibendum. Sed fermentum est
							vitae rhoncus molestie. Cum sociis natoque penatibus et magnis
							dis montes.</p>
						<p>Sed fermentum est vitae rhoncus molestie. Cum sociis
							natoque penatibus et magnis dis montes.</p>
					</div>
					<!-- end clearfix -->
				</div>
				<!-- end col -->

				<div class="col-lg-4 col-md-4 col-xs-12">
					<div class="widget clearfix">
						<div class="widget-title">
							<h3>Information Link</h3>
						</div>
						<ul class="footer-links">
							<li><a href="#">Home</a></li>
							<li><a href="#">Blog</a></li>
							<li><a href="#">Pricing</a></li>
							<li><a href="#">About</a></li>
							<li><a href="#">Faq</a></li>
							<li><a href="#">Contact</a></li>
						</ul>
						<!-- end links -->
					</div>
					<!-- end clearfix -->
				</div>
				<!-- end col -->

				<div class="col-lg-4 col-md-4 col-xs-12">
					<div class="widget clearfix">
						<div class="widget-title">
							<h3>Contact Details</h3>
						</div>

						<ul class="footer-links">
							<li><a href="mailto:#">info@yoursite.com</a></li>
							<li><a href="#">www.yoursite.com</a></li>
							<li>PO Box 16122 Collins Street West Victoria 8007 Australia</li>
							<li>+61 3 8376 6284</li>
						</ul>
						<!-- end links -->
					</div>
					<!-- end clearfix -->
				</div>
				<!-- end col -->

			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</footer>
	<!-- end footer -->

	<div class="copyrights">
		<div class="container">
			<div class="footer-distributed">
				<div class="footer-left">
					<p class="footer-company-name">
						All Rights Reserved. &copy; 2018 <a href="#">QuickCloud</a> Design
						By : <a href="https://html.design/">html design</a>
					</p>
				</div>

				<div class="footer-right">
					<ul class="footer-links-soi">
						<li><a href="#"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#"><i class="fa fa-github"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
						<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
					</ul>
					<!-- end links -->
				</div>
			</div>
		</div>
		<!-- end container -->
	</div>
	<!-- end copyrights -->

	<a href="#" id="scroll-to-top" class="dmtop global-radius"><i
		class="fa fa-angle-up"></i></a>

	<!-- ALL JS FILES -->
	<script src="js/all.js"></script>
	<!-- ALL PLUGINS -->
	<script src="js/custom.js"></script>

</body>
</html>