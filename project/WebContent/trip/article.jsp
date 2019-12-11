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
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>메인</title>
<meta charset="utf-8">

<script src="<%=cp %>/project/js/jquery-3.2.1.min.js"></script>
<script src="<%=cp %>/project/styles/bootstrap4/popper.js"></script>
<script src="<%=cp %>/project/styles/bootstrap4/bootstrap.min.js"></script>
<script src="<%=cp %>/project/plugins/greensock/TweenMax.min.js"></script>
<script src="<%=cp %>/project/plugins/greensock/TimelineMax.min.js"></script>
<script src="<%=cp %>/project/plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="<%=cp %>/project/plugins/greensock/animation.gsap.min.js"></script>
<script src="<%=cp %>/project/plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="<%=cp %>/project/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="<%=cp %>/project/plugins/easing/easing.js"></script>
<script src="<%=cp %>/project/plugins/parallax-js-master/parallax.min.js"></script>
<script src="<%=cp %>/project/js/offers_custom.js"></script>

<link rel="stylesheet" type="text/css" href="<%=cp %>/project/styles/bootstrap4/bootstrap.min.css">
<link href="<%=cp %>/project/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/project/styles/offers_styles.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/project/styles/offers_responsive.css">

<script type="text/javascript">

function purchase(){
	var f = document.apply;
	var url ="<%=cp %>/travel/purchase.km?id="+f.id.value+"&num="+f.num.value;
	var name="id";
	var option= "width = 500, height = 500, top = 100, left = 200, location = no"
    window.open(url, name, option);
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

		<div class="home">
			<div class="home_background"
				style="background-image: url(<%=cp %>/project/images/home.jpg)"></div>
			<div class="home_content">
				<div class="home_content_inner">
							<div class="home_text_large">KMTOUR</div>
							<div class="home_text_small" style="padding-left: 150px; color: #EAEAEA;">Discover new worlds</div>
				</div>
			</div>
		</div>

		<!-- Find Form -->

		<div class="find">
			<!-- Image by https://unsplash.com/@garciasaldana_ -->
			<div class="find_background parallax-window" data-parallax="scroll"
				data-image-src="<%=cp %>/project/images/find.jpg" data-speed="0.8"></div>
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="find_title text-center">Find the Adventure of a
							lifetime</div>
					</div>
					<div class="col-12">
						<div class="find_form_container">
							<form action="#" id="find_form"
								class="find_form d-flex flex-md-row flex-column align-items-md-center align-items-start justify-content-md-between justify-content-start flex-wrap">
								<div class="find_item">
									<div>Destination:</div>
									<input type="text" class="destination find_input" required="required" placeholder="Keyword here">
								</div>
								<div class="find_item">
									<div>Adventure type:</div>
									<select name="adventure" id="adventure" class="dropdown_item_select find_input">
										<option>Categories</option>
										<option>Categories</option>
										<option>Categories</option>
									</select>
								</div>
								<div class="find_item">
									<div>Min price</div>
									<select name="min_price" id="min_price"
										class="dropdown_item_select find_input">
										<option>&nbsp;</option>
										<option>Price</option>
										<option>Price</option>
									</select>
								</div>
								<div class="find_item">
									<div>Max price</div>
									<select name="max_price" id="max_price"
										class="dropdown_item_select find_input">
										<option>&nbsp;</option>
										<option>Price</option>
										<option>Price</option>
									</select>
								</div>
								<button class="button find_button">Find</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
<br><Br><Br>

	<!-- Offers -->

	<div class="offers">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="section_title text-center">
						<br><h2>여행 상품 리스트</h2>
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
							<div class="detail_view"><i class="fa fa-bars" aria-hidden="true"></i></div>
							<div class="box_view"><i class="fa fa-th-large" aria-hidden="true"></i></div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="items item_grid clearfix">
						<!-- Item -->
						<div class="item clearfix rating_5">
						
							<div class="item_image" style="float: left; width: 50%"><a href="${downloadPath}?num=${dto.num }"><img src="${imagePath }/${dto.filename }" alt=""  width="600" ></a></div>
							<div class="item_content" style="float: left; width: 50%">
								<div class="item_price">From ${dto.num }</div>
								<div class="item_title">${dto.title }</div>
								<ul>
									<li>${dto.inwon }</li>
									<li>${dto.startdate }</li>
									<li>${dto.enddate }</li>
									<li>${dto.price }</li>
								</ul>
								<div class="rating rating_5" data-rating="5">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
								
								<div class="item_text">${fn:replace(dto.content, replaceChar, "<br>")}</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
			<form action="" name="apply">
			<c:if test="${sessionScope.CustomInfo.type=='user' }">
			<input type="hidden" name="id" value="${sessionScope.CustomInfo.id }">
			<input type="hidden" name="num" value="${dto.num }">
			<div><input type="button" class="btn btn-danger" value="신청" onclick="purchase();"> </div>
			</c:if>
			</form>
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