<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
	String ckId= "";
	if(request.getParameter("ckId")!=null){
		ckId= request.getParameter("ckId");
		
	}
	String errorMsg="";
	if (request.getParameter("errorMsg")!=null){
		errorMsg = request.getParameter("errorMsg");
	}
	
	
	
	
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
.row {
    display: -ms-flexbox;
    display: flex;
    justify-content: center;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    margin-right: -15px;
    margin-left: -15px;
}

</style>
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
				<a class="navbar-brand" href="index.html">
					<img src="images/logo-hosting.png" alt="" />
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbars-host" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
					<span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbars-host">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="about.html">About Us</a></li>
						<li class="nav-item"><a class="nav-link" href="features.html">Features </a></li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="dropdown-a" data-toggle="dropdown">Hosting </a>
							<div class="dropdown-menu" aria-labelledby="dropdown-a">
								<a class="dropdown-item" href="hosting.html">Web Hosting </a>
								<a class="dropdown-item" href="hosting.html">WordPress Hosting </a>
								<a class="dropdown-item" href="hosting.html">Cloud Server </a>
								<a class="dropdown-item" href="hosting.html">Reseller Package </a>
								<a class="dropdown-item" href="hosting.html">Dedicated Hosting </a>
							</div>
						</li>
						<li class="nav-item"><a class="nav-link" href="domain.html">Domain</a></li>
						<li class="nav-item"><a class="nav-link" href="pricing.html">Pricing</a></li>
						<li class="nav-item active"><a class="nav-link" href="contact.html">Contact</a></li>
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
			<form action ="<%=request.getContextPath()%>/quickloud-master/idCheckAction.jsp" method="post">
			<div>
				ID 체크 
				<input type="text" name = "ckId">
				<button type ="submit">아이디중복검사</button>
				<input type=hidden name = "jb" value="customer">
			</div>


			</form>


            <div class="row">
                <div class="col-xl-6 col-md-12 col-sm-12">
                <%=errorMsg %>
                    <div class="contact_form">
                        <div id="message"></div>
                        <form id="writeForm" class="" action="<%=request.getContextPath()%>/quickloud-master/customerInsertAction.jsp" name="contactform" method="post">
                            <fieldset class="row row-fluid">
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                    <input type="text" value="고객아이디" name="first_name" id="first_name" class="form-control" readonly>
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" value = "<%=ckId%>" name="customerId" id="customerId" class="form-control" readonly placeholder="">
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                    <input type="email"value="비밀번호" name="email" id="email" class="form-control" readonly>
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" name="CustomerPass" id="CustomerPass" class="form-control" placeholder="">
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                    <input type="text" value="이름" name="first_name" id="first_name" class="form-control" readonly>
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" name="customerName" id="customerName" class="form-control" placeholder="">
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                    <input type="email"value="주소" name="email" id="email" class="form-control"readonly>
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" name="customerAddress" id="customerAddress" class="form-control" placeholder="">
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                    <input type="email"value="전화번호" name="email" id="email" class="form-control"readonly>
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
$(function(){
    $("#writeForm").submit(function(){
       if($("#customerId").val()==""){
           alert("아이디가 빈칸입니다!");
           $("#customerId").focus();
           return false;
        }
       
       if($("#CustomerPass").val()==""){
           alert("비밀번호가 빈칸입니다!");
           $("#CustomerPass").focus();
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
</html>