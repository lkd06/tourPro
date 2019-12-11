<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	pageContext.setAttribute("replaceChar", "\n");
%>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	String cpPath=cp+"/project/";
	String pageNum = request.getParameter("pageNum");
	if(pageNum==null || pageNum.equals("")) pageNum="1";
%>
<!-- 아직 삭제 구현 X -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>메인</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">


<link rel="stylesheet" type="text/css" href="<%=cp %>/project/styles/bootstrap4/bootstrap.min.css">
<link href="<%=cp %>/project/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/project/styles/offers_styles.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/project/styles/offers_responsive.css">


<script type="text/javascript">
	function choose() {
		var f = document.select;	
		f.action="<%=cp %>/travel/tripboard.km";
		f.submit();
		
	}

</script>


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
						<li class="menu_item menu_mm"><a href="<%=cp %>/main/main.km">메인화면</a></li>
						<li class="menu_item menu_mm"><a href="<%=cp %>/project/about.html">소개</a></li>
						<!-- 추가 -->
						<li class="main_nav_item"><a href="<%=cpPath %>about.html">상품</a>
							<ul>
								<li><a href="travel/tripboard.km"><p style="color: black;">여행지</p></a></li>
								<li><a href="goods/goodsboard.km"><p style="color: black;">굿즈(Comming Soon)</p></a></li>
							</ul>
						</li>
						<!-- 추가 -->
						<li class="menu_item menu_mm"><a href="<%=cp %>/project/offers.html">커뮤니티</a></li>
						<li class="menu_item menu_mm"><a href="<%=cp %>/project/news.html">뉴스</a></li>
						<li class="menu_item menu_mm"><a href="<%=cp %>/project/contact.html">상담</a></li>
					</ul>

				</div>

			</div>

		</div>

		<!-- Home -->
		<div class="home" style="height: 700px;">
			<div class="home_background" style="background-image: url(<%=cp %>/project/images/home.jpg)"></div>
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
		
		
							<!-- 추가 -->
	<br><BR>				
	<div class="find">
		<!-- Image by https://unsplash.com/@garciasaldana_ -->
		<div class="find_background parallax-window" data-parallax="scroll" data-image-src="<%=cpPath %>images/find.jpg" data-speed="0.8"></div>
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="find_title text-center"><p></p></div>
				</div>
				<div class="col-12">
					<div class="find_form_container">
						<form action="" id="find_form" name="select" class="find_form d-flex flex-md-row flex-column align-items-md-center align-items-start justify-content-md-between justify-content-start flex-wrap" method="post">
							<div class="find_item" style="width: 50px;">
							</div>
							<div class="find_item" style="padding-top: 50px;">
								<div>Adventure type:</div>
								
								<select name="product" id="adventure" class="dropdown_item_select find_input">
									<option value="">나라선택</option>
									<c:forEach var="dto" items="${lists }">
										<option>${dto.country }</option>
									</c:forEach>
								</select>
							</div>
							<button class="button find_button" onclick="choose();">Find</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	
	<!-- Offers -->

	

	<div class="offers">
		<div class="container">
			<div class="row">
				<div class="col">

					

					
				<!-- 추가 -->
					<c:if test="${sessionScope.CustomInfo.type=='company' }">
					<div align="right"><%-- <a href="<%=cp %>/travel/upload.km"><font size="3pt;" color="#000000" >▶LIST 추가</font></a> --%></div>
					</c:if>
				<div class="section_title text-center" style="padding-top: 150px;">
					<br><h2>여행 상품 리스트</h2>
				</div>
				</div>
			</div>
			<div class="row filtering_row">
				<div class="col"><br>
					<div class="sorting_group_2 clearfix">
						<div class="sorting_icons clearfix">
							<c:if test="${sessionScope.CustomInfo.type=='company' }">
								<div align="right"><a href="<%=cp %>/travel/upload.km"><font size="3pt;" color="#000000" >▶LIST 추가</font></a></div>
							</c:if>
							<div class="detail_view"><i class="fa fa-bars" aria-hidden="true"></i></div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="items item_grid clearfix">
					
						<!-- Item -->
						<c:forEach var="dto" items="${lists }">
						<div class="item clearfix rating_5">
							
							<div class="item_image" style="float: left; width: 40%;">
								<a href="<%=cp %>/travel/article.km?num=${dto.num }&pageNum=<%=pageNum %>"><img src="${imagePath }/${dto.filename }" style="width: 500px;"></a>
							</div>
							<div class="item_content" style="float: left; width: 60%;">
							
								<div class="item_num">From ${dto.num }</div>
								<div class="item_title">${dto.title }</div>
								<ul>
									<li>${dto.country }</li>
								</ul>
								<ul>
									<li>남은 인원 ${dto.inwon }</li>
									<li>${dto.startdate } ~ ${dto.enddate }</li>
									<li>${dto.guide }</li>
								</ul>
								<ul>
									<li>${dto.price }</li>
								</ul>
								<div class="rating rating_5" data-rating="5">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
								
								<div class="item_more_link"><a href="<%=cp %>/travel/article.km?num=${dto.num }&pageNum=<%=pageNum %>">Read More</a></div>
								<c:if test="${sessionScope.CustomInfo.type=='company' }">
								<div><a href="${deletePath }?num=${dto.num }&pageNum=<%=pageNum %>">삭제</a></div>	<!-- if(dto.id==관리자) 일경우 보여주기.. 넣기-->
								</c:if>
							</div>
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
							<img src="<%=cp %>/project/proImage/coming soon.png" width="300" height="300"/>
						</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

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
</div>
</body>
</html>