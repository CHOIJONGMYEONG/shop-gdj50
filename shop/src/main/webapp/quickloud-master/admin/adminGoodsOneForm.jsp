<%@page import="shop.vo.Employee"%>
<%@page import="shop.vo.Customer"%>
<%@page import="shop.vo.Goods"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="service.GoodsService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
if (!(session.getAttribute("loginType").equals("employee"))) {
	response.sendRedirect(request.getContextPath() + "/quickloud-master/loginForm.jsp");
	return;
}

Employee employee = (Employee) session.getAttribute("loginEmployee");
String Id = employee.getEmployeeId();
String Name = employee.getEmployeeName();
int lev = employee.getLev();
int goodsNo = Integer.parseInt(request.getParameter("goodsNo"));
System.out.print(goodsNo);
GoodsService service = new GoodsService();
Map<String, Object> map = new HashMap<String, Object>();

map = service.getCustomerOneGoods(goodsNo);
System.out.print("네임" + map.get("goodsName"));
String goodsName = (String) map.get("goodsName");
int goodsPrice = (int) map.get("goodsPrice");
String updateDate = (String) map.get("updateDate");
String createDate = (String) map.get("createDate");
String soldOut = (String) map.get("soldOut");
String fileName = (String) map.get("fileName");
String originFilename = (String) map.get("originFilename");
String contentType = (String) map.get("contentType");
String creatDate = (String) map.get("createDate");

System.out.println(fileName + "경로");
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
<style>
.img-fluid {
	max-width: 100%;
	height: 500px;
}

.contact_form .form-control {
	background-color: #fff;
	margin-bottom: 30px;
	border: 1px solid #ebebeb;
	box-sizing: border-box;
	color: black;
	font-size: 16px;
	outline: 0 none;
	padding: 10px 25px;
	height: 55px;
	resize: none;
	box-shadow: none !important;
	width: 100%;
}

.row {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
	margin-right: -15px;
	margin-left: -15px;
	justify-content: center;
	align-items: center;
}
</style>
</head>
<body class="host_version">

	<!-- Modal -->

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
					href="<%=request.getContextPath()%>/quickloud-master/admin/adminIndex.jsp">
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
						<%
						if (lev == 1) {
						%>
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/quickloud-master/admin/employeeList.jsp">사원관리</a></li>
						<%
						}
						%>
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/quickloud-master/admin/adminGoodsList.jsp">상품관리</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/quickloud-master/admin/adminOrdersList.jsp">주문관리
						</a></li>

						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/quickloud-master/admin/adminCustomerList.jsp">고객관리</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/quickloud-master/admin/adminNoticeList.jsp">공지관리</a></li>
						<li class="nav-item"><a class="nav-link"> <%=Name%>님
								환영합니다
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/quickloud-master/admin/adminOneForm.jsp">내정보</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/quickloud-master/logout.jsp">로그아웃</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<!-- End header -->


	<div id="overviews" class="section lb">
		<div class="container">
			<div class="section-title row text-center">
				<div class="col-md-8 offset-md-2">
					<h3>상품상세보기</h3>
				</div>
			</div>
			<!-- end title -->


			<div class="row">
				<div class="col-xl-5 col-lg-5 col-md-12 col-sm-12">
					<div class="post-media wow fadeIn">
						<img src="<%=request.getContextPath()%>/upload/<%=fileName%>"
							alt="" class="img-fluid img-rounded">
					</div>
					<!-- end media -->
				</div>
				<!-- end col -->

				<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12">


					<div class="contact_form">
						<div id="message"></div>
						<form id="writeForm" class=""
							action="<%=request.getContextPath()%>/quickloud-master/employeeInsertAction.jsp"
							name="contactform" method="post">
							<fieldset class="row row-fluid">




								<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
									<input type="text" value="상품번호" name="first_name"
										id="first_name" class="form-control" readonly>
								</div>
								<div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
									<input type="text" value="<%=goodsNo%>" name="employeeId"
										id="employeeId" class="form-control" readonly placeholder="">
								</div>
								<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
									<input type="text" value="상품명" name="first_name"
										id="first_name" class="form-control" readonly>
								</div>
								<div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
									<input type="text" value="<%=goodsName%>" name="employeeId"
										id="employeeId" class="form-control" readonly placeholder="">
								</div>
								<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
									<input type="text" value="상품가격" name="first_name"
										id="first_name" class="form-control" readonly>
								</div>
								<div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
									<input type="text" value="<%=goodsPrice%>" name="employeeId"
										id="employeeId" class="form-control" readonly placeholder="">
								</div>
								<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
									<input type="text" value="등록날짜" name="email" id="email"
										class="form-control" readonly>
								</div>
								<div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
									<input type="text" value="<%=createDate%>" name="employeePass"
										id="employeePass" class="form-control" readonly placeholder="">
								</div>
								<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
									<input type="text" value="수정날짜" name="first_name"
										id="first_name" class="form-control" readonly>
								</div>
								<div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
									<input type="text" value="<%=updateDate%>" name="employeeName"
										id="employeeName" class="form-control" readonly placeholder="">
								</div>
								<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
									<input type="text" value="품절여부" name="first_name"
										id="first_name" class="form-control" readonly>
								</div>
								<div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
									<input type="text" value="<%=soldOut%>" name="employeeName"
										id="employeeName" class="form-control" readonly placeholder="">
								</div>


								<div class="text-center pd">
									<a
										href="<%=request.getContextPath()%>/quickloud-master/admin/adminGoodsUpdateForm.jsp?goodsNo=<%=goodsNo%>"><button
											type="button" id="submit"
											class="btn btn-light btn-radius btn-brd grd1 btn-block">수정페이지</button></a>
								</div>

								<div class="text-center pd">
									<a
										href="<%=request.getContextPath()%>/quickloud-master/admin/adminGoodsImgUpdateForm.jsp?goodsNo=<%=goodsNo%>&fileName=<%=fileName%>"><button
											type="button" id="submit"
											class="btn btn-light btn-radius btn-brd grd1 btn-block">이미지수정</button></a>
								</div>
								<div class="text-center pd">
									<a
										href="<%=request.getContextPath()%>/quickloud-master/admin/adminGoodsDeleteAction.jsp?goodsNo=<%=goodsNo%>&fileName=<%=fileName%>"><button
											type="button" id="submit1"
											class="btn btn-light btn-radius btn-brd grd1 btn-block">삭제</button></a>
								</div>
							</fieldset>
						</form>
					</div>
					<!-- end row -->

				</div>
			</div>
			<!-- end col -->



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