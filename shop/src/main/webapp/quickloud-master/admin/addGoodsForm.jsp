<%@page import="shop.vo.Employee"%>
<%@page import="shop.vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
 
	if(!(session.getAttribute("loginType").equals("employee"))){
		response.sendRedirect(request.getContextPath()+"/quickloud-master/loginForm.jsp");		
		return;
	}

 
    Employee employee = (Employee)session.getAttribute("loginEmployee");
	String Id = employee.getEmployeeId();
	String Name = employee.getEmployeeName();
	int lev =  employee.getLev();
   
 
   
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
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
				<a class="navbar-brand" href="<%=request.getContextPath()%>/quickloud-master/admin/adminIndex.jsp">
					<img style="width:150px;height:70px;" src="images/electshop2.png" alt="" />
				</a>
				<div class="collapse navbar-collapse" id="navbars-host">
				
					<ul class="navbar-nav ml-auto">
						
						<%if(lev==1) 
						{%>
						<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/quickloud-master/admin/employeeList.jsp">????????????</a></li>
						<%
						}
						%>
						<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/quickloud-master/admin/adminGoodsList.jsp">????????????</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/quickloud-master/admin/adminCustomerList.jsp">???????????? </a></li>
					
						<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/quickloud-master/admin/adminCustomerList.jsp">????????????</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/quickloud-master/admin/adminNoticeList.jsp">????????????</a></li>
						
						<li class="nav-item"><a class="nav-link" > <%=Name %>??? ???????????????</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/quickloud-master/admin/adminOneForm.jsp" >?????????</a></li>
					   
					</ul>
					<ul class="nav navbar-nav navbar-right">
					
                        <li><a class="hover-btn-new log" href="<%=request.getContextPath()%>/quickloud-master/logout.jsp" ><span>Customer LogOut</span></a></li>
                    </ul>
                    
                    
				</div>
			</div>
		</nav>
	</header>
	<!-- End header -->
	
    <div id="support" class="section wb">
        <div class="container-fulid">
            <div class="section-title text-center">
                <h3>????????????</h3>
            </div><!-- end title -->
		


            <div class="row">
                <div class="col-xl-6 col-md-12 col-sm-12">
          
                    <div class="contact_form">
                        <div id="message"></div>
                        <form id="writeForm" enctype="multipart/form-data" class="" action="<%=request.getContextPath()%>/quickloud-master/admin/addGoodsAction.jsp" name="contactform" method="post">
                            <fieldset class="row row-fluid">
                            	
	
                             
                            
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                    <input type="text" value="?????????" class="form-control" readonly>
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                    <input type="text"  name="goodsName" id="goodsName" class="form-control"  placeholder="">
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                    <input type="email"value="????????????" class="form-control" readonly>
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" name="goodsPrice" id="goodsPrice" class="form-control" placeholder="">
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                    <input type="text" value="???????????????"  class="form-control" readonly>
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                    <input type="file" name="goodsImg" id="goodsImg" class="form-control" placeholder="">
                                </div>
                           
                                
                                
                                <div class="text-center pd">
                                    <button type="submit" value="????????????" id="submit" class="btn btn-light btn-radius btn-brd grd1 btn-block">????????????</button>
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

</html>  
    
