<%@page import="java.net.URLEncoder"%>
<%@page import="com.tourImage.TourImageDAO"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	pageContext.setAttribute("replaceChar", "\n");
%>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	String cpPath = cp + "/project/";
	String pageNum = request.getParameter("pageNum");
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	
	if (pageNum == null || pageNum.equals(""))
		pageNum = "1";
	
	//검색
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		
		if(searchValue!=null){	//검색을 하면
			if(request.getMethod().equalsIgnoreCase("GET")){
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
			}else{	//검색 안하면
				searchKey = "num";
				searchValue="";
			}
			
			//db연결
			Connection conn = DBConn.getConnenction();
			TourImageDAO dao = new TourImageDAO(conn);
			

			//searchkey, searchvalue 주소를 정리
		   String param="";
		   if(!searchValue.equals("")){
			   param="&searchKey=" + searchKey +"&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		   }
		   
		   DBConn.close();	
		}
%>
<!-- 아직 삭제 구현 X -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>메인</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Destino project">
<meta name="viewport" content="width=device-width, initial-scale=1">


<link href="<%=cp%>/project/plugins/font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/project/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/project/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/project/plugins/OwlCarousel2-2.2.1/animate.css">
<link href="<%=cp%>/project/plugins/magnific-popup/magnific-popup.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/project/styles/main_styles.css">
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/project/styles/responsive.css">

<script src="<%=cp%>/project/js/jquery-3.2.1.min.js"></script>
<script src="<%=cp%>/project/styles/bootstrap4/popper.js"></script>
<script src="<%=cp%>/project/styles/bootstrap4/bootstrap.min.js"></script>
<script src="<%=cp%>/project/plugins/greensock/TweenMax.min.js"></script>
<script src="<%=cp%>/project/plugins/greensock/TimelineMax.min.js"></script>
<script src="<%=cp%>/project/plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="<%=cp%>/project/plugins/greensock/animation.gsap.min.js"></script>
<script src="<%=cp%>/project/plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="<%=cp%>/project/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="<%=cp%>/project/plugins/easing/easing.js"></script>
<script src="<%=cp%>/project/plugins/parallax-js-master/parallax.min.js"></script>
<script src="<%=cp%>/project/js/offers_custom.js"></script>

<script type="text/javascript">
	
</script>

<link rel="stylesheet" type="text/css"
	href="<%=cp%>/project/styles/bootstrap4/bootstrap.min.css">
<link href="<%=cp%>/project/plugins/font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/project/styles/offers_styles.css">
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/project/styles/offers_responsive.css">
</head>


<body>

	<div class="super_container">

		<!-- Header -->

		<header class="header">
		<jsp:include page="../project/header.jsp" />
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
						<li class="menu_item menu_mm"><a href="<%=cp %>/product/list.km">여행상품</a></li>
						<li class="menu_item menu_mm"><a href="<%=cp %>/project/offers.html">커뮤니티</a></li>
						<li class="menu_item menu_mm"><a href="<%=cp %>/project/news.html">뉴스</a></li>
						<li class="menu_item menu_mm"><a href="<%=cp %>/project/contact.html">상담</a></li>
					</ul>

				</div>

			</div>

		</div>
		


		<!-- Home -->
		<div class="home" style="height: 700px;">
			<div class="home_background" style="background-image:url(<%=cpPath %>images/home.jpg)"></div>
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="home_content">
							<div class="home_content_inner">
								<div class="home_title"></div>
								<div class="home_breadcrumbs">
									<div class="home_text_large">KMTOUR</div>
									<div class="home_text_small" style="padding-left: 150px; color: #EAEAEA;">Discover new worlds</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
						<!-- 머리글 -->
		<div class="find">
			<!-- Image by https://unsplash.com/@garciasaldana_ -->
			<div class="find_background_container prlx_parent">
				<div class="find_background prlx" style="background-image:url(<%=cp %>/project/images/find.jpg)"></div>
			</div>
			<!-- <div class="find_background parallax-window" data-parallax="scroll" data-image-src="images/find.jpg" data-speed="0.8"></div> -->
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="find_title text-center">사진을 검색해보세요</div>
					</div>
					<div class="col-12">
						<div class="find_form_container">
							
							<form action="#" name="searchForm" id="find_form" class="find_form d-flex flex-md-row flex-column align-items-md-center align-items-start justify-content-md-between justify-content-start flex-wrap">
								<select name="searchKey" style="height: 40px; width: 100px;">
									<option value="name">제목</option>
									<option value="id">아이디</option>
								</select>
								<input type="text" style="height: 40px; width: 870px;" name="searchValue">
								<button class="button find_button" onclick="seach();">Find</button>
							</form>
						</div>
					</div>
					
				</div>
			</div>
		</div>

		<!-- Offers -->

		<div class="offers" style="height: 1500px;">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="section_title text-center">
							<br>
							<h2>사진후기</h2>
						</div>
						<div align="right">
						<c:if test="${sessionScope.CustomInfo.type=='user' }">
							<a href="<%=cp%>/tourImages/write.km"><font size="3pt;" color="#000000">▶LIST 추가</font> </a>
							</c:if>
						</div>
					</div>
				</div>
				<div class="row filtering_row">
					<div class="col">
						<div class="sorting_group_2 clearfix">
							<ul>
								<li>Airplane X</li>
								<li>5 stars X</li>
								<li>Romantic X</li>
							</ul>
							<div class="sorting_icons clearfix">
								<div class="detail_view">
									<i class="fa fa-bars" aria-hidden="true"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row"  align="center" style="border: 0px;">
					<div class="col">
						<div class="items item_grid clearfix" style="width: 95%; height:800px; border: 0px solid;" >
							<!-- Item -->

							<c:forEach var="dto" items="${lists }">
							<div class="item clearfix rating_5" align="center" style="border: 0px solid; float: left">
								<a href="${downloadPath}?num=${dto.num }"><img src="${imagePath }/${dto.fileName }" style="width: 250px; height: 200px;"  /></a>&nbsp;&nbsp;&nbsp;<br>
								${dto.name }<br>
								<c:if test="${sessionScope.CustomInfo.type=='company'}">
								${dto.id }/
								</c:if>
								${dto.created }&nbsp;
								<c:if test="${sessionScope.CustomInfo.id==dto.id || sessionScope.CustomInfo.type=='company'}">
								<input type="hidden" name="num" value="num" />
								<input type="hidden" name="name" value="<%=name %>"/>
								<a href="<%=cp %>/tourImages/update.km?num=${dto.num }&pageNum=<%=pageNum %>">수정</a>/
								<a href="${deletePath }?num=${dto.num }&pageNum=<%=pageNum %>">삭제</a>
								</c:if>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col">
						<div class="pages" align="center">
							<ul class="pages_list">
								<c:if test="${dataCount!=0 }">
									<li class="page active"><a href="#">${pageIndexList }&nbsp;</a></li>
								</c:if>
								<c:if test="${dataCount==0 }">
									<img src="<%=cp%>/image/coming soon.png" width="300" height="300" />
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br><br>
		
		
	<!-- 바닥글 -->
	<footer class="footer">
		<div class="container">
			<div class="row">

				<!-- 바닥 왼쪽 -->
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

				<!-- 바닥 중앙 -->
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

				<!-- 바닥 오른쪽 -->
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
	</div>
	
</body>
</html>