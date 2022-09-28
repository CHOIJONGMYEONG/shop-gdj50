<%@page import="service.CounterService"%>
<%@page import="service.CartService"%>
<%@page import="shop.vo.Cart"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="service.GoodsService"%>
<%@page import="shop.vo.Employee"%>
<%@page import="shop.vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
if (!(session.getAttribute("loginType").equals("customer"))) {
	response.sendRedirect(request.getContextPath() + "/quickloud-master/loginForm.jsp");
	return;
}

String loginType = (String) session.getAttribute("loginType");
String Id = "";
String Name = "";

CounterService counterService = new CounterService();

int totalCounter = counterService.getTotalCount();
int todayCounter = counterService.getTodayCount();
int currentCount = (Integer) (application.getAttribute("currentCounter"));

if (loginType.equals("customer")) {
	Id = ((Customer) session.getAttribute("loginCustomer")).getCustomerId();
	Name = ((Customer) session.getAttribute("loginCustomer")).getCustomerName();
} else if (loginType.equals("employee")) {

	Id = ((Employee) session.getAttribute("loginEmployee")).getEmployeeId();
	Name = ((Employee) session.getAttribute("loginEmployee")).getEmployeeName();

}

if ((request.getParameter("buy")).equals("cart")) {
	System.out.println("---------------- addCartAction.jsp");
	// 세션 유효성 검사
	// goodsNo, customerId, cartQuantity
	int goodsNo = Integer.parseInt(request.getParameter("goodsNo"));
	if (loginType.equals("customer")) {
		Id = ((Customer) session.getAttribute("loginCustomer")).getCustomerId();
		Name = ((Customer) session.getAttribute("loginCustomer")).getCustomerName();
	} else if (loginType.equals("employee")) {

		Id = ((Employee) session.getAttribute("loginEmployee")).getEmployeeId();
		Name = ((Employee) session.getAttribute("loginEmployee")).getEmployeeName();

	}
	// 상세페이지 접근 전 리스트에서 바로 장바구니에 추가한 경우 기본값 1
	int p_num1 = 1;
	// 상세 페이지 등에서 수량을 입력한 경우
	if (request.getParameter("p_num1") != null) {
		p_num1 = Integer.parseInt(request.getParameter("p_num1"));
	}
	// vo 세팅
	Cart cart = new Cart();
	cart.setGoodsNo(goodsNo);
	cart.setCustomerId(Id);
	cart.setCartQuantity(p_num1);
	System.out.println(cart);
	// 서비스 호출
	CartService cartService = new CartService();
	boolean result = cartService.addCart(cart);
	response.sendRedirect(request.getContextPath() + "/quickloud-master/cart/cartList.jsp?id=" + Id);
}

String buy = request.getParameter("buy");
System.out.print("buy값" + buy);
int goodsNo = Integer.parseInt(request.getParameter("goodsNo"));
int orderQuantity = Integer.parseInt(request.getParameter("p_num1"));
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
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
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
<title>이벤트 리스너로 장바구니 수량 변경 및 자동 합계 구하기</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<link rel="stylesheet" href="./10-11.css" />
<script type="text/javascript" src="./10-11.js"></script>
<style>
utton, input {
	overflow: visible;
	height: 30px;
}

.basketdiv .data {
	border-bottom: 1px dashed #888;
	box-sizing: border-box;
	cursor: pointer;
	float: left;
	width: 100%;
	height: 90px;
}

.basketdiv .data .pname {
	text-align: left !important;
	line-height: 4 !important;
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
<body>
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
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<ul class="navbar-nav">
			<li class="nav-item active"><a class="nav-link">총접속자:<%=totalCounter%></a>
			</li>
			<li class="nav-item active"><a class="nav-link">오늘접속자:<%=todayCounter%></a></li>
			<li class="nav-item active"><a class="nav-link">현재접속자:<%=currentCount%></a></li>
		</ul>
	</nav>
	<form
		action="<%=request.getContextPath()%>/quickloud-master/customerOrderBuyAction.jsp"
		name="orderform" id="orderform" method="post" class="orderform"
		action="/Page" onsubmit="return false;">
		<input type="hidden" name="goodsNo" value="<%=goodsNo%>"> <input
			type="hidden" name="cmd" value="order">
		<div class="basketdiv" id="basket">
			<div class="row head">
				<div class="subdiv">
					<div class="check">선택</div>
					<div class="img">이미지</div>
					<div class="pname">상품명</div>
				</div>
				<div class="subdiv">
					<div class="basketprice">가격</div>
					<div class="num">수량</div>
					<div class="sum">합계</div>
				</div>
				<div class="subdiv">

					<div class="basketcmd">삭제</div>
				</div>
				<div class="split"></div>
			</div>

			<div class="row data">
				<div class="subdiv">
					<div class="check">
						<input type="checkbox" name="buy" value="260" checked=""
							onclick="javascript:basket.checkItem();">&nbsp;
					</div>
					<div class="img">
						<img src="<%=request.getContextPath()%>/upload/<%=fileName%>"
							width="60">
					</div>
					<div class="pname">
						<span><%=goodsName%></span>
					</div>
				</div>
				<div class="subdiv">
					<div class="basketprice">
						<input type="hidden" name="p_price" id="p_price1" class="p_price"
							value="<%=goodsPrice%>"><%=goodsPrice%></div>
					<div class="num">
						<div class="updown">
							<input type="text" name="p_num1" id="p_num1" size="2"
								maxlength="4" class="p_num" value="<%=orderQuantity%>"
								onkeyup="javascript:basket.changePNum(1);"> <span
								onclick="javascript:basket.changePNum(1);"><i
								class="fas fa-arrow-alt-circle-up up"></i></span> <span
								onclick="javascript:basket.changePNum(1);"><i
								class="fas fa-arrow-alt-circle-down down"></i></span>
						</div>
					</div>
					<div class="sum"><%=goodsPrice * orderQuantity%>원
					</div>
				</div>
				<div class="subdiv">
					<div class="basketcmd">
						<a href="javascript:void(0)"
							class="btn btn-primary grd1 effect-1 btn-radius btn-brd"
							onclick="javascript:basket.delItem();">삭제</a>
					</div>
				</div>
			</div>

		</div>

		<div class="right-align basketrowcmd">
			<a href="javascript:void(0)"
				class="btn btn-primary grd1 effect-1 btn-radius btn-brd"
				onclick="javascript:basket.delCheckedItem();">선택상품삭제</a> <a
				href="javascript:void(0)"
				class="btn btn-primary grd1 effect-1 btn-radius btn-brd"
				onclick="javascript:basket.delAllItem();">장바구니비우기</a>
		</div>

		<div class="bigtext right-align sumcount" id="sum_p_num">
			상품갯수:
			<%=orderQuantity%>개
		</div>
		<div class="bigtext right-align box blue summoney" id="sum_p_price">
			합계금액:
			<%=goodsPrice * orderQuantity%>원
		</div>
		<div class="row">
			<div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
				<input type="text" value="주소" class="form-control" readonly>
				<input type="text" value="" name="customerAddress" readonly
					style="background-color: white" id="customerAddress"
					class="form-control" placeholder="">
			</div>

			<div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
				<input type="text" value="상세주소입력" class="form-control" readonly>
				<input type="text" value="" name="customerDetailAddress"
					id="customerDetailAddress" class="form-control"
					placeholder="상세주소를 입력해주세요">
			</div>
		</div>
		<div id="goorder" class="">
			<div class="clear"></div>
			<div class="buttongroup center-align cmd">
				<button id="submitbutton"
					class="btn btn-primary grd1 effect-1 btn-radius btn-brd"
					type="button">선택한 상품 주문</button>
			</div>
		</div>

	</form>


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
	<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
	<div id="layer"
		style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
		<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
			id="btnCloseLayer"
			style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
			onclick="closeDaumPostcode()" alt="닫기 버튼">
	</div>
	<script>
		$(function() {
			$('#submitbutton').click(function() {
				if ($('#customerAddress').val() == "") {
					alert("주소가 빈칸입니다");
					$('#customerAddress').focus();
					return false;
				}

				if ($('#customerDetailAddress').val() == "") {
					alert("상세주소가 빈칸입니다");
					$('#customerDetailAddress').focus();
					return false;
				} else {
					orderform.submit();
				}

			});
		});
	</script>



	<script>
		$('#customerAddress').click(function() {
			sample2_execDaumPostcode();
		});
	</script>


	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		// 우편번호 찾기 화면을 넣을 element
		var element_layer = document.getElementById('layer');

		function closeDaumPostcode() {
			// iframe을 넣은 element를 안보이게 한다.
			element_layer.style.display = 'none';
		}

		function sample2_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								// document.getElementById("sample2_extraAddress").value = extraAddr;

							} else {
								// document.getElementById("sample2_extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							// document.getElementById('sample2_postcode').value = data.zonecode;
							// document.getElementById("sample2_address").value = addr;

							// $('#addr').val(data.zonecode + ' ' + addr);
							document.getElementById('customerAddress').value = data.zonecode
									+ ' ' + addr;

							// 커서를 상세주소 필드로 이동한다.
							// document.getElementById("sample2_detailAddress").focus();

							// iframe을 넣은 element를 안보이게 한다.
							// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
							element_layer.style.display = 'none';
						},
						width : '100%',
						height : '100%',
						maxSuggestItems : 5
					}).embed(element_layer);

			// iframe을 넣은 element를 보이게 한다.
			element_layer.style.display = 'block';

			// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
			initLayerPosition();
		}

		// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
		// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
		// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
		function initLayerPosition() {
			var width = 300; //우편번호서비스가 들어갈 element의 width
			var height = 400; //우편번호서비스가 들어갈 element의 height
			var borderWidth = 5; //샘플에서 사용하는 border의 두께

			// 위에서 선언한 값들을 실제 element에 넣는다.
			element_layer.style.width = width + 'px';
			element_layer.style.height = height + 'px';
			element_layer.style.border = borderWidth + 'px solid';
			// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
			element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
					+ 'px';
			element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth)
					+ 'px';
		}
	</script>
</body>
</html>
