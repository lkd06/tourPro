<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	String ch = request.getParameter("ch");
	String id = request.getParameter("id");
	String cpPath=cp+"/project/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Destino project">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css" href="<%=cp %>/project/styles/bootstrap4/bootstrap.min.css">
<link href="<%=cp %>/project/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/project/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/project/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/project/plugins/OwlCarousel2-2.2.1/animate.css">
<link href="<%=cp %>/project/plugins/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/project/styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/project/styles/responsive.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/project/styles/dropmenu.css">

<script src="<%=cp %>/project/js/jquery-3.2.1.min.js"></script>
<script src="<%=cp %>/project/styles/bootstrap4/popper.js"></script>
<script src="<%=cp %>/project/styles/bootstrap4/bootstrap.min.js"></script>
<script src="<%=cp %>/project/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="<%=cp %>/project/plugins/easing/easing.js"></script>
<script src="<%=cp %>/project/plugins/parallax-js-master/parallax.min.js"></script>
<script src="<%=cp %>/project/plugins/magnific-popup/jquery.magnific-popup.min.js"></script>
<script src="<%=cp %>/project/js/custom.js"></script>

</head>
<body onload="mes();">

<form action="" name="myForm" method="post">

<div class="super_container">
	
		<!-- Header -->
		<header class="header">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="header_container d-flex flex-row align-items-center justify-content-start">

						<!-- Logo -->
						<div class="logo_container">
							<div class="logo">
								<div>KM 투어</div>
								<div class="logo_image">
									<img src="<%=cp %>/project/images/logo.png" alt="">
								</div>
							</div>
						</div>

						<!-- Main Navigation -->
						<nav class="main_nav ml-auto">
							<ul class="main_nav_list">
								<li class="main_nav_item active"><a href="<%=cp %>/main/main.km">Home</a></li>
								<li class="main_nav_item"><a href="<%=cpPath %>about.html">About us</a></li>
								<!-- 추가 -->
								<li class="main_nav_item"><a href="<%=cpPath %>about.html">상품</a>
									<ul>
										<li><a href="travel/tripboard.km"><p style="color: black;">여행지</p></a></li>
										<li><a href="goods/goodsboard.km"><p style="color: black;">굿즈(Comming Soon)</p></a></li>
									</ul>
								</li>
								<li class="main_nav_item active"><a href="<%=cp %>/kmtour/c_list.km">장바구니</a></li>
								<!-- 추가 -->
								
								<li class="main_nav_item"><a href="<%=cpPath %>community.jsp">Community</a>
									<ul>
										<li><a href="comment.jsp"></a>후기</li>
									</ul>			
								</li>
								
							</ul>
						</nav>

						<!-- Search -->
						<div class="search">
							<form action="#" class="search_form">
								<input type="search" name="search_input" class="search_input ctrl_class" required="required" placeholder="검색">
								<button type="submit" class="search_button ml-auto ctrl_class">
									<img src="<%=cp %>/project/images/search.png" alt="">
								</button>
							</form>
						</div>

						<!-- Hamburger -->
						<div class="hamburger ml-auto">
							<i class="fa fa-bars" aria-hidden="true"></i>
						</div>

					</div>
				</div>
			</div>
		</div>
		</header>

		<!-- Menu -->
		<div class="menu_container menu_mm">

			<!-- Menu Close Button -->
			<div class="menu_close_container">
				<div class="menu_close"></div>
			</div>

			<!-- Menu Items -->
			<div class="menu_inner menu_mm">
				<div class="menu menu_mm">
					<div class="menu_search_form_container">
						<form action="#" id="menu_search_form">
							<input type="search" class="menu_search_input menu_mm">
							<button id="menu_search_submit" class="menu_search_submit"
								type="submit">
								<img src="<%=cp %>/project/images/search_2.png" alt="">
							</button>
						</form>
					</div>
					
					<ul class="menu_list menu_mm">
						<li class="menu_item menu_mm"><a href="#">메인화면</a></li>
						<li class="menu_item menu_mm"><a href="<%=cp %>/project/about.html">소개</a></li>
						<li class="menu_item menu_mm"><a href="<%=cp %>/kmtour/list.km">여행상품</a></li>
						<li class="menu_item menu_mm"><a href="<%=cp %>/project/offers.html">커뮤니티</a></li>
						<li class="menu_item menu_mm"><a href="<%=cp %>/project/news.html">뉴스</a></li>
						<li class="menu_item menu_mm"><a href="<%=cp %>/kmtour/c_list.km">장바구니</a></li>
					</ul>

				</div>
			</div>
			
		</div>

		<!-- Home -->
		<div class="home">
			<div class="home_background"
				style="background-image: url(<%=cp %>/project/images/home.jpg)"></div>
			<div class="home_content">
				<div class="home_content_inner">
					<div class="home_text_large">KM 투어</div>
					<div class="home_text_small">경도야 미안해</div>
				</div>
			</div>
		</div>

	<div class="">
		<div class="special_content" align="center" style="width: 500; height: 1200px;">
			<div class="">
				<div class="" style="display: table; width: 33%;border: 0px solid; color: #fe534b;"  align="center">
					<div style="color: #000000;"  align="left" >
						<h2><b>장바구니</b></h2>
					</div>
					
					<br><br>
					
					<!-- 장바구니 list -->
					<table align="center" width="1200">
					    <tr align="center" height="50" valign="middle" bgcolor="#e6e6e6">
					      <th scope="c_num" width="200">상품번호</th>
					      <th scope="c_name" width="400">상&nbsp;품&nbsp;명</th>
					      <th scope="c_price" width="200">가&nbsp;&nbsp;격</th>
					      <th scope="c_inwon" width="100">수&nbsp;&nbsp;량</th>
					      <th width="100">결제하기</th>
					      <th width="100">수정하기</th>
					      <th width="100">삭제하기</th>
					      
					    </tr>
					    
						<tr cols bgcolor="e7e7e7" height="2">
							<th colspan="7"></th>
						</tr>
						
						<c:forEach var="dto" items="${lists }">
							
							<tr align="center" height="70" valign="middle" >
							    <td>${dto.c_num }</td>
							    <td>${dto.c_name }</td>
							    <td>${dto.c_price }</td>
							    <td>${dto.c_inwon }</td>
							    <td><a href="<%=cp %>/kmtour/aaaa/km">결제하기</a></td>
							    <td><a href="<%=cp %>/kmtour/update/km?c_num=${dto.c_num }">수정하기</a></td>
							    <td><a href="<%=cp %>/kmtour/delete_ok/km">삭제하기</a></td>
						    </tr>
						    
							<tr cols bgcolor="e7e7e7" height="2">
								<th colspan="7"></th>
							</tr>
							
						</c:forEach>
						
						<tr cols bgcolor="e7e7e7" height="5">
							<th colspan="7"></th>
						</tr>
					</table>

				</div>
			</div>
		</div>
	</div>
	
</form>


	<!-- Footer -->
	<footer class="footer">
		<div class="container">
			<div class="row">

				<!-- Footer Column -->
				<div class="col-lg-4 footer_col">
					<div class="footer_about">
						<!-- Logo -->
						<div class="logo_container">
							<div class="logo">
								<div>KM 투어</div>
								<div class="logo_image"><img src="<%=cp %>/project/images/logo.png" alt=""></div>
							</div>
						</div>
						<div class="footer_about_text">소개글.......</div>
						<div class="copyright">
							Copyright &copy;
							<script>document.write(new Date().getFullYear());</script>
							 All rights reserved | 경도야 미안해
						</div>
					</div>
				</div>

				<!-- Footer Column -->
				<div class="col-lg-4 footer_col">
					<div class="footer_latest">
						<div class="footer_title">Latest News</div>
						<div class="footer_latest_content">

							<!-- Footer Latest Post -->
							<div class="footer_latest_item">
								<div class="footer_latest_image"><img src="<%=cp %>/project/images/latest_1.jpg" alt="https://unsplash.com/@peecho"></div>
								<div class="footer_latest_item_content">
									<div class="footer_latest_item_title"><a href="news.html">Brazil Summer</a></div>
									<div class="footer_latest_item_date">Jan 09, 2018</div>
								</div>
							</div>

							<!-- Footer Latest Post -->
							<div class="footer_latest_item">
								<div class="footer_latest_image"><img src="<%=cp %>/project/images/latest_2.jpg" alt="https://unsplash.com/@sanfrancisco"></div>
								<div class="footer_latest_item_content">
									<div class="footer_latest_item_title"><a href="news.html">A perfect vacation</a></div>
									<div class="footer_latest_item_date">Jan 09, 2018</div>
								</div>
							</div>
							
						</div>
					</div>
				</div>

				<!-- Footer Column -->
				<div class="col-lg-4 footer_col">
					<div class="tags footer_tags">
						<div class="footer_title">Tags</div>
						<ul class="tags_content d-flex flex-row flex-wrap align-items-start justify-content-start">
							<li class="tag"><a href="#">travel</a></li>
							<li class="tag"><a href="#">summer</a></li>
							<li class="tag"><a href="#">cruise</a></li>
							<li class="tag"><a href="#">beach</a></li>
							<li class="tag"><a href="#">offer</a></li>
							<li class="tag"><a href="#">vacation</a></li>
							<li class="tag"><a href="#">trip</a></li>
							<li class="tag"><a href="#">city break</a></li>
							<li class="tag"><a href="#">adventure</a></li>
						</ul>
					</div>
				</div>

			</div>
		</div>
	</footer>
	
	
</body>
</html>