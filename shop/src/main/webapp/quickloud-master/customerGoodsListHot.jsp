<%@page import="service.CounterService"%>
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

int rowPerPage = 20;
if (request.getParameter("rowPerPage") != null) {
	rowPerPage = Integer.parseInt(request.getParameter("rowPerPage"));
}

int currentPage = 1;
if (request.getParameter("currentPage") != null) {
	currentPage = Integer.parseInt(request.getParameter("currentPage"));
}

GoodsService goodsService = new GoodsService();
// listll
List<Map<String, Object>> list = goodsService.selectCustomerHotGoodsListByPage(rowPerPage, currentPage);
int totalRow = goodsService.getGoodsAllCount();
int lastPage = totalRow / rowPerPage;
if (totalRow % rowPerPage != 0) {
	lastPage += 1;
}

int pageBegin = ((currentPage - 1) / rowPerPage) * rowPerPage + 1; // 페이지 시작 넘버
int pageEnd = pageBegin + rowPerPage - 1; // 페이지 끝 글 구하는 공식
pageEnd = Math.min(pageEnd, lastPage); // 둘 중에 작은 값이 pageEnd
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
.container {
	max-width: 1600px;
	text-align: center;
}

.pricing-table-header {
	padding: 0 0 0 0;
	background: #ffffff;
}

.pricing-table-highlighted {
	margin-top: 60px;
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



	<div id="pricing" class="section lb">
		<div class="container">
			<div class="section-title text-center">
				<h3>상품리스트</h3>
			</div>
			<!-- end title -->
			<div id="overviews" class="section lb">
				<div class="container">
					<div class="section-title row text-center">
						<div class="col-md-12">
							<div class="list-domain">
								<ul>
									<li><a
										class="btn btn-light grd1 effect-1 btn-radius btn-brd"
										href="<%=request.getContextPath()%>/quickloud-master/customerGoodsList.jsp">누적판매순
									</a></li>

									<li><a
										class="btn btn-light grd1 effect-1 btn-radius btn-brd active"
										href="<%=request.getContextPath()%>/quickloud-master/customerGoodsListHot.jsp">인기순</a>
									</li>

									<li><a
										class="btn btn-light grd1 effect-1 btn-radius btn-brd"
										href="<%=request.getContextPath()%>/quickloud-master/customerGoodsListHighPrice.jsp">높은가격순</a>
									</li>

									<li><a
										class="btn btn-light grd1 effect-1 btn-radius btn-brd"
										href="<%=request.getContextPath()%>/quickloud-master/customerGoodsListRowPrice.jsp">낮은가격순</a>
									</li>

									<li><a
										class="btn btn-light grd1 effect-1 btn-radius btn-brd"
										href="<%=request.getContextPath()%>/quickloud-master/customerGoodsListNew.jsp">최신순</a>
									</li>

									<li>
										<form name="rowform"
											action="<%=request.getContextPath()%>/quickloud-master/customerGoodsListHot.jsp"
											method="post">
											<select onChange="rowform.submit()" name="rowPerPage"
												class="btn grd1 effect-1 btn-radius btn-brd">


												<%
												if (rowPerPage == 20) {
												%>
												<option value="20" selected="selected">20개씩</option>
												<option value="40">40개씩</option>
												<%
												} else {
												%>
												<option value="20">20개씩</option>
												<option value="40" selected="selected">40개씩</option>
												<%
												}
												%>

											</select>
										</form>
									</li>
								</ul>
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
							<div class="row text-center">

								<%
								int i = 1;
								for (Map<String, Object> m : list) {
									System.out.print(m.get("goodsName"));
								%>
								<div class="col-md-3">
									<div class="pricing-table pricing-table-highlighted">
										<div class="pricing-table-header grd1">
											<a
												href="<%=request.getContextPath()%>/quickloud-master/customerGoodsOneForm.jsp?goodsNo=<%=m.get("goodsNo")%>">
												<img
												src='<%=request.getContextPath()%>/upload/<%=m.get("filename")%>'
												width="100%" height="330">
											</a>
										</div>
										<div class="pricing-table-space"></div>
										<div class="pricing-table-features">

											<p>
												<i class="fa fa-life-ring"></i> <strong><%=m.get("goodsName")%></strong>
											</p>
											<p>
												<i class="fa fa-database"> </i><strong><%=m.get("goodsPrice")%>원</strong>
											</p>

											<ul class="list-unstyled d-flex justify-content-center mb-1">

												<li><i class="text-warning fa fa-star"></i> <i
													class="text-warning fa fa-star"></i> <i
													class="text-warning fa fa-star"></i> <i
													class="text-muted fa fa-star"></i> <i
													class="text-muted fa fa-star"></i></li>

											</ul>



										</div>
										<div class="pricing-table-sign-up">
											<a
												href="<%=request.getContextPath()%>/quickloud-master/customerGoodsOneForm.jsp?goodsNo=<%=m.get("goodsNo")%>"
												class="hover-btn-new"><span>Order Now</span></a>
										</div>
									</div>
								</div>
								<%
								}
								%>

							</div>

						</div>
						<!-- end row -->
						<div class="container text-align-center" style="padding: 100px">

							<%
							/*int lastPage = boardDao.selectBoardLastPage(ROW_PER_PAGE);*/
							System.out.println(lastPage);
							if (pageBegin > rowPerPage) {
							%>

							<a class="btn grd1 effect-1 btn-radius btn-brd"
								href="<%=request.getContextPath()%>/customerGoodsList.jsp?currentPage=<%=pageBegin - rowPerPage%>">이전</a>

							<%
							}

							for (int y = pageBegin; y <= pageEnd; y++) {
							%>
							<a class="btn grd1 effect-1 btn-radius btn-brd"
								href="<%=request.getContextPath()%>/customerGoodsList.jsp?currentPage=<%=y%>"><%=y%></a>
							<%
							}

							if (pageEnd < lastPage) {
							%>

							<a class="btn grd1 effect-1 btn-radius btn-brd"
								href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp?currentPage=<%=pageBegin + rowPerPage%>">다음</a>
							<%
							}
							%>
						</div>
						<!-- end pane -->

						<div class="tab-pane fade" id="tab2">
							<div class="row text-center">
								<div class="col-md-4">
									<div class="pricing-table pricing-table-highlighted">
										<div class="pricing-table-header grd1">
											<h2>Shared Hosting</h2>
											<h3>$85/Year</h3>
										</div>
										<div class="pricing-table-space"></div>
										<div class="pricing-table-features">
											<p>
												<i class="fa fa-envelope-o"></i> <strong>250</strong> Email
												Addresses
											</p>
											<p>
												<i class="fa fa-rocket"></i> <strong>125GB</strong> of
												Storage
											</p>
											<p>
												<i class="fa fa-database"></i> <strong>140</strong>
												Databases
											</p>
											<p>
												<i class="fa fa-link"></i> <strong>60</strong> Domains
											</p>
											<p>
												<i class="fa fa-life-ring"></i> <strong>24/7
													Unlimited</strong> Support
											</p>
										</div>
										<div class="pricing-table-sign-up">
											<a href="#" class="hover-btn-new"><span>Order Now</span></a>
										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="pricing-table pricing-table-highlighted">
										<div class="pricing-table-header grd1">
											<h2>WordPress Hosting</h2>
											<h3>$59/Year</h3>
										</div>
										<div class="pricing-table-space"></div>
										<div class="pricing-table-features">
											<p>
												<i class="fa fa-envelope-o"></i> <strong>150</strong> Email
												Addresses
											</p>
											<p>
												<i class="fa fa-rocket"></i> <strong>65GB</strong> of
												Storage
											</p>
											<p>
												<i class="fa fa-database"></i> <strong>60</strong> Databases
											</p>
											<p>
												<i class="fa fa-link"></i> <strong>30</strong> Domains
											</p>
											<p>
												<i class="fa fa-life-ring"></i> <strong>24/7
													Unlimited</strong> Support
											</p>
										</div>
										<div class="pricing-table-sign-up">
											<a href="#" class="hover-btn-new"><span>Order Now</span></a>
										</div>
									</div>
								</div>

								<div class="col-md-4">
									<div class="pricing-table pricing-table-highlighted">
										<div class="pricing-table-header grd1">
											<h2>Reseller Hosting</h2>
											<h3>$85/Year</h3>
										</div>
										<div class="pricing-table-space"></div>
										<div class="pricing-table-features">
											<p>
												<i class="fa fa-envelope-o"></i> <strong>250</strong> Email
												Addresses
											</p>
											<p>
												<i class="fa fa-rocket"></i> <strong>125GB</strong> of
												Storage
											</p>
											<p>
												<i class="fa fa-database"></i> <strong>140</strong>
												Databases
											</p>
											<p>
												<i class="fa fa-link"></i> <strong>60</strong> Domains
											</p>
											<p>
												<i class="fa fa-life-ring"></i> <strong>24/7
													Unlimited</strong> Support
											</p>
										</div>
										<div class="pricing-table-sign-up">
											<a href="#" class="hover-btn-new"><span>Order Now</span></a>
										</div>
									</div>
								</div>
							</div>
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