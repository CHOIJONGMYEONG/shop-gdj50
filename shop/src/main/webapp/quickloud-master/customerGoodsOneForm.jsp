<%@page import="shop.vo.Review"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="service.ReviewService"%>
<%@page import="service.CounterService"%>
<%@page import="shop.vo.Employee"%>
<%@page import="shop.vo.Customer"%>
<%@page import="shop.vo.Goods"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="service.GoodsService"%>
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





int rowPerPage = 5;
int currentPage = 1;
if (request.getParameter("currentPage") != null) {
	currentPage = Integer.parseInt(request.getParameter("currentPage"));
}

List<Review> ReviewList = new ArrayList<Review>();
ReviewService reviewService = new ReviewService();


ReviewList = reviewService.getReviewListByPage(goodsNo, rowPerPage, currentPage);
int totalRow = reviewService.getReviewAllCount();
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
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<link rel="stylesheet" href="10-11.css" />
<script type="text/javascript" src="10-11.js"></script>
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

.fa-arrow-alt-circle-up:before {
	content: "\f35b";
	color: white;
}

.fa-arrow-alt-circle-down:before {
	content: "\f358";
	color: white;
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
					src="images/electshop2.png" alt="" />s
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

	<div id="overviews" class="section lb">
		<div class="container">
			<div class="section-title row text-center">
				<div class="col-md-8 offset-md-2">
					<h3>상품구매</h3>
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
							action="<%=request.getContextPath()%>/quickloud-master/customerOrderBuyForm.jsp"
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
									<input type="text" value="품절여부" name="first_name"
										id="first_name" class="form-control" readonly>
								</div>
								<div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
									<input type="text" value="<%=soldOut%>" name="employeeName"
										id="employeeName" class="form-control" readonly placeholder="">
								</div>
								<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
									<input type="text" value="수량" name="first_name" id="first_name"
										class="form-control" readonly>
								</div>
								<div class="subdiv">
									<div class="num">
										<div class="updown">
											<input type="text" name="p_num1" id="p_num1" size="2"
												maxlength="10" class="p_num " value="1"
												onkeyup="javascript:basket.changePNum(1);"> <span
												onclick="javascript:basket.changePNum(1);"><i
												class="fas fa-arrow-alt-circle-up up"></i></span> <span
												onclick="javascript:basket.changePNum(1);"><i
												class="fas fa-arrow-alt-circle-down down"></i></span> <input
												type="hidden" name="goodsNo" value="<%=goodsNo%>">
										</div>
									</div>
									
								</div>
								<div class="text-center pd">
									<button type="submit" name="buy" id="submit" value="buy"
										class="btn btn-light btn-radius btn-brd grd1 btn-block">구매하기</button>
								</div>
								<div class="text-center pd">
									<button id="frm" type="submit" name="buy" value="cart"
										id="submit"
										class="btn btn-light btn-radius btn-brd grd1 btn-block">장바구니담기</button>
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
	<!-- 리뷰 -->
	<div class="section lb">

		<div class="container">
			<div class="section-title text-center">
				<h3>리뷰</h3>

				<div class="dmoain-pricing">
					<div class="table-responsive-sm">
						<table>
							<thead>
								<tr class="domain-head">

									<th scope="col">고객아이디</th>
									<th scope="col" colspan="3">리뷰내용</th>
									<th scope="col">작성날짜</th>

								</tr>
							</thead>
							<tbody>


								<%
								for (Review a : ReviewList) {
								%>

								<tr>


									<td data-label="DOMAIN NAME"><%=a.getCustomerId()%></td>
									<td data-label="DOMAIN NAME" colspan="3"><%=a.getReviewContent()%>
									
									<%
									if(a.getCustomerId().equals(Id)){
									%>
									<a class="btn grd1 effect-1 btn-radius btn-brd"
									href="<%=request.getContextPath()%>/quickloud-master/customerReviewUpdateForm.jsp?goodsNo=<%=goodsNo%>&ordersNo=<%=a.getOrderNo()%>">수정</a>
										<a class="btn grd1 effect-1 btn-radius btn-brd"
									href="<%=request.getContextPath()%>/quickloud-master/ReviewDeleteAction.jsp?goodsNo=<%=goodsNo%>&ordersNo=<%=a.getOrderNo()%>">삭제</a>
									<%
									}
									%>										
									
									
									</td>
									<td data-label="DOMAIN NAME"><%=a.getCreateDate()%></td>

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
					href="<%=request.getContextPath()%>/quickloud-master/customerOrderList.jsp?currentPage=<%=pageBegin - rowPerPage%>&goodsNo=<%=goodsNo%>">이전</a>

				<%
				}

				for (int i = pageBegin; i <= pageEnd; i++) {
				%>
				<a class="btn grd1 effect-1 btn-radius btn-brd"
					href="<%=request.getContextPath()%>/quickloud-master/customerOrderList.jsp?currentPage=<%=i%>&goodsNo=<%=goodsNo%>"><%=i%></a>
				<%
				}

				if (pageEnd < lastPage) {
				%>

				<a class="btn grd1 effect-1 btn-radius btn-brd"
					href="<%=request.getContextPath()%>/quickloud-master/customerOrderList.jsp?currentPage=<%=pageBegin + rowPerPage%>&goodsNo=<%=goodsNo%>">다음</a>
				<%
				}
				%>


			</div>
			<!-- end title -->
		</div>
		<!-- end container -->
	</div>
	
	
	
	
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
	<script>
		function submit2(frm) {
			frm.action = 'customerCartInsertAction.jsp';
			frm.submit();
			return true;
		}
	</script>
</body>
</html>