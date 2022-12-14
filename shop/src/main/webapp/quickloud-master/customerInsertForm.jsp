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
										?????? ?????????
									</button>
									<a class="for-pwd" href="<%=request.getContextPath()%>/quickloud-master/customerInsertForm.jsp">?????? ????????????</a>
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
										???????????????
									</button>
										<a class="for-pwd" href="<%=request.getContextPath()%>/quickloud-master/employeeInsertForm.jsp">?????????????????????</a>
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
                <h3>?????? ????????????</h3>
            </div><!-- end title -->
			
			
			


            <div class="row">
                <div class="col-xl-6 col-md-12 col-sm-12">
                    <div class="contact_form">
                        <div id="message"></div>
                        <form id="writeForm" class="" action="<%=request.getContextPath()%>/quickloud-master/customerInsertAction.jsp" name="contactform" method="post">
                            <fieldset class="row row-fluid">
                            
                            
                            	<!-- ????????? ???????????? -->
									
	
	
	
								 <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
								<input type="text" name="idck" id="idck" class="form-control">
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                <button type="button" id="idckBtn"  class="btn btn-light btn-radius btn-brd grd1 btn-block">????????? ????????????</button>
                                </div>
	
	
	
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                    <input type="text" value="???????????????" class="form-control" readonly>
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" name="customerIRe" id="customerIRe" class="form-control" readonly>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                    <input type="email"value="????????????"  class="form-control" readonly>
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                    <input type="password" name="CustomerPassRe" id="CustomerPassRe" class="form-control" placeholder="">
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                    <input type="text" value="??????" class="form-control" readonly>
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" name="customerName" id="customerName" class="form-control" placeholder="">
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                    <input type="text"value="??????"  class="form-control"readonly>
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" name="customerAddress" id="customerAddress" readonly class="form-control" placeholder="">
                                </div>
                                 <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                    <input type="text"value="????????????"  class="form-control"readonly>
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" name="detailcustomerAddress" id="detailcustomerAddress" class="form-control" placeholder="">
                                </div>
                                
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                    <input type="text"value="????????????"  class="form-control"readonly>
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" name="customeTelephone" id="customeTelephone" class="form-control" placeholder="">
                                </div>
                                
                                
                                
                                <div class="text-center pd">
                                    <button type="submit" value="??????" id="submit" class="btn btn-light btn-radius btn-brd grd1 btn-block">??????</button>
                                </div>    
                                 <div class="text-center pd">
                                    <button type="reset" value="??????" id="cancel" class="btn btn-light btn-radius btn-brd grd1 btn-block">??????</button>
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
		alert('id??? 4?????????!');
	} else {
		// ????????? ??????	
		$.ajax({
			url : '/shop/idckController',
			type : 'post',
			data : {idck : $('#idck').val()},
			success : function(json) {
				// alert(json);
				if(json == 'y') {
					$('#customerIRe').val($('#idck').val());
				} else {
					alert('?????? ???????????? ????????? ?????????.');
					$('#customerIRe').val('');
				}
			}
		});
	}
});







$(function(){
    $("#writeForm").submit(function(){
       if($("#customerIRe").val()==""){
           alert("???????????? ???????????????!");
           $("#customerIRe").focus();
           return false;
        }
       
       if($("#CustomerPassRe").val()==""){
           alert("??????????????? ???????????????!");
           $("#CustomerPassRe").focus();
           return false;
        }
       
       if($("#customerName").val()==""){
          alert("????????? ???????????????!");
          $("#customerName").focus();
          return false;
       }
       if($("#customerAddress").val()==""){
           alert("????????? ???????????????!");
           $("#customerAddress").focus();
           return false;
        }
       if($("#detailcustomerAddress").val()==""){
           alert("????????? ???????????????!");
           $("#detailcustomerAddress").focus();
           return false;
        }
       
       if($("#customeTelephone").val()==""){
           alert("??????????????? ???????????????!");
           $("#customeTelephone").focus();
           return false;
        }
       
       
    });
 });
$('#customerBtn').click(function(){
    if($('#customerId').val() == '') {
       alert('?????? ???????????? ???????????????');
    } else if($('#customerPass').val() == '') {
       alert('?????? ??????????????? ???????????????');
    } else {
       customerForm.submit();
    }
 });
 
 $('#employeeBtn').click(function(){
    if($('#employeeId').val() == '') {
       alert('?????? ???????????? ???????????????');
    } else if($('#employeePass').val() == '') {
       alert('?????? ??????????????? ???????????????');
    } else {
       employeeForm.submit();
    }
 });

</script>

<!-- iOS????????? position:fixed ????????? ??????, ???????????? ???????????? ?????? position:absolute ?????? ???????????? top,left??? ?????? ?????? -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="?????? ??????">
</div>

<script>
	$('#customerAddress').click(function(){
		sample2_execDaumPostcode();
	});
</script>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script >

	
    // ???????????? ?????? ????????? ?????? element
    var element_layer = document.getElementById('layer'); 

    function closeDaumPostcode() {
        // iframe??? ?????? element??? ???????????? ??????.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // ???????????? ????????? ??????????????? ????????? ????????? ???????????? ??????.

                // ??? ????????? ?????? ????????? ?????? ????????? ????????????.
                // ???????????? ????????? ?????? ?????? ????????? ??????('')?????? ????????????, ?????? ???????????? ?????? ??????.
                var addr = ''; // ?????? ??????
                var extraAddr = ''; // ???????????? ??????

                //???????????? ????????? ?????? ????????? ?????? ?????? ?????? ?????? ????????????.
                if (data.userSelectedType === 'R') { // ???????????? ????????? ????????? ???????????? ??????
                    addr = data.roadAddress;
                } else { // ???????????? ?????? ????????? ???????????? ??????(J)
                    addr = data.jibunAddress;
                }
            
                // ???????????? ????????? ????????? ????????? ???????????? ??????????????? ????????????.
                if(data.userSelectedType === 'R'){
                    // ??????????????? ?????? ?????? ????????????. (???????????? ??????)
                    // ???????????? ?????? ????????? ????????? "???/???/???"??? ?????????.
                    if(data.bname !== '' && /[???|???|???]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // ???????????? ??????, ??????????????? ?????? ????????????.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // ????????? ??????????????? ?????? ??????, ???????????? ????????? ?????? ???????????? ?????????.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // ????????? ??????????????? ?????? ????????? ?????????.
                    // document.getElementById("sample2_extraAddress").value = extraAddr;
                
                } else {
                    // document.getElementById("sample2_extraAddress").value = '';
                }

                // ??????????????? ?????? ????????? ?????? ????????? ?????????.
                // document.getElementById('sample2_postcode').value = data.zonecode;
                // document.getElementById("sample2_address").value = addr;
                
                // $('#addr').val(data.zonecode + ' ' + addr);
                document.getElementById('customerAddress').value = data.zonecode + ' ' + addr;
                
                
                // ????????? ???????????? ????????? ????????????.
                // document.getElementById("sample2_detailAddress").focus();

                // iframe??? ?????? element??? ???????????? ??????.
                // (autoClose:false ????????? ???????????????, ?????? ????????? ???????????? ???????????? ???????????? ?????????.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe??? ?????? element??? ????????? ??????.
        element_layer.style.display = 'block';

        // iframe??? ?????? element??? ????????? ????????? ???????????? ???????????????.
        initLayerPosition();
    }

    // ??????????????? ?????? ????????? ?????? ???????????? ???????????? ?????????????????? ???????????????
    // resize????????????, orientationchange???????????? ???????????? ?????? ?????????????????? ?????? ????????? ?????? ?????? ????????????,
    // ?????? element_layer??? top,left?????? ????????? ????????? ?????????.
    function initLayerPosition(){
        var width = 300; //???????????????????????? ????????? element??? width
        var height = 400; //???????????????????????? ????????? element??? height
        var borderWidth = 5; //???????????? ???????????? border??? ??????

        // ????????? ????????? ????????? ?????? element??? ?????????.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // ???????????? ????????? ?????? ????????? ?????? ?????? ???????????? ????????? ??? ??? ????????? ????????? ????????????.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>
</html>