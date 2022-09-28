<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
    
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
.row {
    display: -ms-flexbox;
    display: flex;
    justify-content: center;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    margin-right: -15px;
    margin-left: -15px;
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
</style>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body class="host_version"> 

	<!-- Modal -->
	<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header tit-up">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">Customer Login</h4>
			</div>
			<div class="modal-body customer-box">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs">
					<li><a class="active" href="#Login" data-toggle="tab">Customer</a></li>
					<li><a href="#Registration" data-toggle="tab">employee</a></li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content">
					<div class="tab-pane active" id="Login">
					
					
						<form role="form" class="form-horizontal" id="customerForm" method="post" action="<%=request.getContextPath()%>/quickloud-master/customerLoginAction.jsp">
							<div class="form-group">
								<div class="col-sm-12">
									<input class="form-control" id="customerId" placeholder="ID" type="text" name="customerId">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-12">
									<input class="form-control" id="customerPass" name="customerPass" placeholder="password" type="password">
								</div>
							</div>
							<div class="row">
								<div class="col-sm-10">
									<button type="button" id="customerBtn" class="btn btn-light btn-radius btn-brd grd1">
										고객 로그인
									</button>
									<a class="for-pwd" href="<%=request.getContextPath()%>/quickloud-master/customerInsertForm.jsp">고객 회원가입</a>
									<a class="for-pwd" href="javascript:;">Forgot password?</a>
								</div>
							</div>
						</form>
						
						
						
					</div>
					<div class="tab-pane " id="Registration">
						<form role="form" class="form-horizontal" id="employeeForm" method="post" action="<%=request.getContextPath()%>/quickloud-master/employeeLoginAction.jsp">
							<div class="form-group">
								<div class="col-sm-12">
									<input class="form-control" name="employeeId" id="employeeId" placeholder="ID" type="text">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-12">
									<input class="form-control" id="employeePass" placeholder="password" type="password" name="employeePass">
								</div>
							</div>
						
							<div class="row">							
								<div class="col-sm-10">
									<button type="button" id="employeeBtn" class="btn btn-light btn-radius btn-brd grd1">
										스텝로그인
									</button>
										<a class="for-pwd" href="<%=request.getContextPath()%>/quickloud-master/employeeInsertForm.jsp">관리자회원가입</a>
								</div>
							</div>
						</form>
					
					
					</div>
				</div>
			</div>
		</div>
	  </div>
	</div>
	
	
	

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
			<a class="navbar-brand" href="<%=request.getContextPath()%>/quickloud-master/index.jsp">
					<img style="width:150px;height:70px;" src="images/electshop2.png" alt="" />
				</a>
				<div class="collapse navbar-collapse" id="navbars-host">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/quickloud-master/loginForm.jsp">Home</a></li>
					</ul>
				</div>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbars-host" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
					<span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbars-host">
					<ul class="navbar-nav ml-auto">
					</ul>
					<ul class="nav navbar-nav navbar-right">
                        <li><a class="hover-btn-new log" href="#" data-toggle="modal" data-target="#login"><span>Customer Login</span></a></li>
                    </ul>
				</div>
			</div>
		</nav>
	</header>
	<!-- End header -->
	
	<div class="all-title-box">
		<div class="container text-center">
			<h1>Contact<span class="m_1">Lorem Ipsum dolroin gravida nibh vel velit.</span></h1>
		</div>
	</div>
	
    <div id="support" class="section wb">
        <div class="container-fulid">
            <div class="section-title text-center">
                <h3>고객 회원가입</h3>
            </div><!-- end title -->
			
			
			


            <div class="row">
                <div class="col-xl-6 col-md-12 col-sm-12">
                    <div class="contact_form">
                        <div id="message"></div>
                        <form id="writeForm" class="" action="<%=request.getContextPath()%>/quickloud-master/customerInsertAction.jsp" name="contactform" method="post">
                            <fieldset class="row row-fluid">
                            
                            
                            	<!-- 아이디 중복검사 -->
									
	
	
	
								 <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
								<input type="text" name="idck" id="idck" class="form-control">
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                <button type="button" id="idckBtn"  class="btn btn-light btn-radius btn-brd grd1 btn-block">아이디 중복검사</button>
                                </div>
	
	
	
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                    <input type="text" value="고객아이디" class="form-control" readonly>
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" name="customerIRe" id="customerIRe" class="form-control" readonly>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                    <input type="email"value="비밀번호"  class="form-control" readonly>
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                    <input type="password" name="CustomerPassRe" id="CustomerPassRe" class="form-control" placeholder="">
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                    <input type="text" value="이름" class="form-control" readonly>
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" name="customerName" id="customerName" class="form-control" placeholder="">
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                    <input type="text"value="주소"  class="form-control"readonly>
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" name="customerAddress" id="customerAddress" readonly class="form-control" placeholder="">
                                </div>
                                 <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                    <input type="text"value="상세주소"  class="form-control"readonly>
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" name="detailcustomerAddress" id="detailcustomerAddress" class="form-control" placeholder="">
                                </div>
                                
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                    <input type="text"value="전화번호"  class="form-control"readonly>
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" name="customeTelephone" id="customeTelephone" class="form-control" placeholder="">
                                </div>
                                
                                
                                
                                <div class="text-center pd">
                                    <button type="submit" value="가입" id="submit" class="btn btn-light btn-radius btn-brd grd1 btn-block">가입</button>
                                </div>    
                                 <div class="text-center pd">
                                    <button type="reset" value="취소" id="cancel" class="btn btn-light btn-radius btn-brd grd1 btn-block">취소</button>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div><!-- end col -->
				
            </div><!-- end row -->
        </div><!-- end container -->
    </div><!-- end section -->
	
	<div class="parallax section dbcolor">
        <div class="container">
            <div class="row logos">
                <div class="col-md-2 col-sm-2 col-xs-6 wow fadeInUp">
                    <a href="#"><img src="images/logo_01.png" alt="" class="img-repsonsive"></a>
                </div>
                <div class="col-md-2 col-sm-2 col-xs-6 wow fadeInUp">
                    <a href="#"><img src="images/logo_02.png" alt="" class="img-repsonsive"></a>
                </div>
                <div class="col-md-2 col-sm-2 col-xs-6 wow fadeInUp">
                    <a href="#"><img src="images/logo_03.png" alt="" class="img-repsonsive"></a>
                </div>
                <div class="col-md-2 col-sm-2 col-xs-6 wow fadeInUp">
                    <a href="#"><img src="images/logo_04.png" alt="" class="img-repsonsive"></a>
                </div>
                <div class="col-md-2 col-sm-2 col-xs-6 wow fadeInUp">
                    <a href="#"><img src="images/logo_05.png" alt="" class="img-repsonsive"></a>
                </div>
                <div class="col-md-2 col-sm-2 col-xs-6 wow fadeInUp">
                    <a href="#"><img src="images/logo_06.png" alt="" class="img-repsonsive"></a>
                </div>
            </div><!-- end row -->
        </div><!-- end container -->
    </div><!-- end section -->

    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-xs-12">
                    <div class="widget clearfix">
                        <div class="widget-title">
                            <h3>About US</h3>
                        </div>
                        <p> Integer rutrum ligula eu dignissim laoreet. Pellentesque venenatis nibh sed tellus faucibus bibendum. Sed fermentum est vitae rhoncus molestie. Cum sociis natoque penatibus et magnis dis montes.</p>
                        <p>Sed fermentum est vitae rhoncus molestie. Cum sociis natoque penatibus et magnis dis montes.</p>
                    </div><!-- end clearfix -->
                </div><!-- end col -->

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
                        </ul><!-- end links -->
                    </div><!-- end clearfix -->
                </div><!-- end col -->
				
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
                        </ul><!-- end links -->
                    </div><!-- end clearfix -->
                </div><!-- end col -->
				
            </div><!-- end row -->
        </div><!-- end container -->
    </footer><!-- end footer -->

    <div class="copyrights">
        <div class="container">
            <div class="footer-distributed">
                <div class="footer-left">                   
                    <p class="footer-company-name">All Rights Reserved. &copy; 2018 <a href="#">QuickCloud</a> Design By : <a href="https://html.design/">html design</a></p>
                </div>

                <div class="footer-right">
                    <ul class="footer-links-soi">
						<li><a href="#"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#"><i class="fa fa-github"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
						<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
					</ul><!-- end links -->
                </div>
            </div>
        </div><!-- end container -->
    </div><!-- end copyrights -->

    <a href="#" id="scroll-to-top" class="dmtop global-radius"><i class="fa fa-angle-up"></i></a>

    <!-- ALL JS FILES -->
    <script src="js/all.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyCKjLTXdq6Db3Xit_pW_GK4EXuPRtnod4o"></script>
	<!-- Mapsed JavaScript -->
	<script src="js/mapsed.js"></script>
	<script src="js/01-custom-places-example.js"></script>
    <!-- ALL PLUGINS -->
    <script src="js/custom.js"></script>

</body>

<script>

$('#idckBtn').click(function() {
	if($('#idck').val().length < 4) {
		alert('id는 4자이상!');
	} else {
		// 비동기 호출	
		$.ajax({
			url : '/shop/idckController',
			type : 'post',
			data : {idck : $('#idck').val()},
			success : function(json) {
				// alert(json);
				if(json == 'y') {
					$('#customerIRe').val($('#idck').val());
				} else {
					alert('이미 사용중인 아이디 입니다.');
					$('#customerIRe').val('');
				}
			}
		});
	}
});







$(function(){
    $("#writeForm").submit(function(){
       if($("#customerIRe").val()==""){
           alert("아이디가 빈칸입니다!");
           $("#customerIRe").focus();
           return false;
        }
       
       if($("#CustomerPassRe").val()==""){
           alert("비밀번호가 빈칸입니다!");
           $("#CustomerPassRe").focus();
           return false;
        }
       
       if($("#customerName").val()==""){
          alert("이름이 빈칸입니다!");
          $("#customerName").focus();
          return false;
       }
       if($("#customerAddress").val()==""){
           alert("주소가 빈칸입니다!");
           $("#customerAddress").focus();
           return false;
        }
       if($("#detailcustomerAddress").val()==""){
           alert("주소가 빈칸입니다!");
           $("#detailcustomerAddress").focus();
           return false;
        }
       
       if($("#customeTelephone").val()==""){
           alert("전화번호가 빈칸입니다!");
           $("#customeTelephone").focus();
           return false;
        }
       
       
    });
 });
$('#customerBtn').click(function(){
    if($('#customerId').val() == '') {
       alert('고객 아이디를 입력하세요');
    } else if($('#customerPass').val() == '') {
       alert('고객 패스워드를 입력하세요');
    } else {
       customerForm.submit();
    }
 });
 
 $('#employeeBtn').click(function(){
    if($('#employeeId').val() == '') {
       alert('스텝 아이디를 입력하세요');
    } else if($('#employeePass').val() == '') {
       alert('스텝 패스워드를 입력하세요');
    } else {
       employeeForm.submit();
    }
 });

</script>

<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>

<script>
	$('#customerAddress').click(function(){
		sample2_execDaumPostcode();
	});
</script>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script >

	
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer'); 

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
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
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
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
                document.getElementById('customerAddress').value = data.zonecode + ' ' + addr;
                
                
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
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>
</html>