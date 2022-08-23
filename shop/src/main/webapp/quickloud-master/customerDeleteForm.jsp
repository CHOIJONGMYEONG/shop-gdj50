<%@page import="java.util.Map"%>
<%@page import="service.CustomerService"%>
<%@page import="shop.vo.Employee"%>
<%@page import="shop.vo.Customer"%>
<%@page import="shop.vo.Goods"%>
<%@page import="java.util.List"%>
<%@page import="service.GoodsService"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%
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
Customer paramCustomer = ((Customer) session.getAttribute("loginCustomer"));

Customer customer = new Customer();
CustomerService customerservice = new CustomerService();

String customerId = paramCustomer.getCustomerId();
String customerPass = paramCustomer.getCustomerPass();
System.out.print("확인1" + customerId);

customer.setCustomerId(customerId);

customer = customerservice.getCustomer(customer);
System.out.print("확인" + customer.getCustomerId());
%>
<!DOCTYPE html>
<html lang="en">

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

.container {
	max-width: 1200px;
	text-align: center;
}

.pricing-table-header {
	padding: 0 0 0 0;
	background: #ffffff;
}

.pricing-table-highlighted {
	margin-top: 60px;
}

.row {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
	margin-right: -15px;
	margin-left: -15px;
	justify-content: center;
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
				<a class="navbar-brand" href="index.html"> <img
					src="images/logo-hosting.png" alt="" />
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
						<li class="nav-item"><a class="nav-link" href="features.html">장바구니</a></li>
						<li class="nav-item"><a class="nav-link"> <%=Name%>님
								환영합니다
						</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/quickloud-master/customerOne.jsp" >내정보</a></li>

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




	<div id="pricing" class="section lb">
		<div class="container">
			<div class="section-title text-center">
				<h3>내정보</h3>
			</div>
			<!-- end title -->
			<div id="overviews" class="section lb">
				<div class="container">
					<div class="section-title row text-center">
						<div class="col-md-12">
							<div class="list-domain">
								<div class="row">

									<div class="contact_form">
										<div id="message"></div>
										<form id="writeForm" action="<%=request.getContextPath()%>/quickloud-master/customerDeleteAction.jsp" class="" method="post">
											<fieldset class="row row-fluid">


												<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
													<input type="text" value="비밀번호" class="form-control"
														readonly>
												</div>
												<div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
													<input type="password" value=""
														name="customerPass" id="customerPass" class="form-control"
														placeholder="">
												</div>
												

												<div class="text-center pd">
													<button type="submit" id="submit" class="btn btn-light btn-radius btn-brd grd1 btn-block">회원탈퇴</button>
												</div>
															
												<div class="text-center pd">
													<a href="<%=request.getContextPath()%>/quickloud-master/customerOne.jsp"><button type="button" id="submit"
															class="btn btn-light btn-radius btn-brd grd1 btn-block">내정보</button></a>
												</div>
											</fieldset>
										</form>
									</div>
									<!-- end row -->

								</div>



							</div>
						</div>
					</div>
					<!-- end title -->
				</div>
				<!-- end container -->
			</div>
			<!-- end section -->



			<hr class="invis">

			<div class="row">
				<div class="col-md-12">
					<div class="tab-content">
						<div class="tab-pane active fade show" id="tab1">
							<div class="row text-center"></div>

						</div>
						<!-- end row -->


					</div>
					<!-- end pane -->

					<div class="tab-pane fade" id="tab2">
						<!-- end row -->
					</div>
					<!-- end pane -->
				</div>
				<!-- end content -->
			</div>
			<!-- end col -->
		</div>
		<!-- end row -->
	</div>
	<!-- end container -->
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
	<script src="js/timeline.min.js"></script>
	<script>
		timeline(document.querySelectorAll('.timeline'), {
			forceVerticalMode : 700,
			mode : 'horizontal',
			verticalStartPosition : 'left',
			visibleItems : 4
		});
	</script>
	
</body>
</html>