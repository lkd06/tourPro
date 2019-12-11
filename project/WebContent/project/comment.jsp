<%@page import="com.mem.CustomInfo"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	CustomInfo cinfo = (CustomInfo)session.getAttribute("cinfo");
	
	Cookie[] ck = request.getCookies();
	
	String popUrl = "";
	String strUrl,str;
	
	strUrl = cp+"/project/popup.jsp";
	str = "window.open('" +strUrl +"', 'event1', " ;
	 str    = str + "'left=610, ";
	  str    = str + "top=10, ";
	  str    = str + "width=590, ";
	  str    = str + "height=500, ";
	  str    = str + "toolbar=no, ";
	  str    = str + "menubar=no, ";
	  str    = str + "status=no, ";
	  str    = str + "scrollbars=no, ";
	  str    = str + "resizable=no')";
	
	  popUrl = str;
	   
	  if(ck != null) {
		  for(Cookie c : ck) {
			 if(c.getName().equals("popup") && c.getValue().equals("no")) {
				 popUrl = "";
		         break;
			 }
		}
	  }
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>후기게시판</title>
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
<link rel="stylesheet" type="text/css" href="<%=cp %>project/styles/dropmenu.css">
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/project/styles/bootstrap4/bootstrap.min.css">
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
	
<style>

.page{
	clear: both;
	text-align: center;
}

</style>

<script type="text/javascript">

	function checkid(){
	
	var f = document.commentform;
	
	<c:if test="${empty sessionScope.CustomInfo}">
		alert("로그인이 필요합니다.");
		return;
	</c:if>
	
	f.action = "<%=cp%>/kmtour/commentwrite.km";
	f.submit();	
	}

</script>

</head>
<body onload="<%=popUrl %>" leftmargin="8">

<div class="super_container">
	
	<!-- Header -->
	<header class="header">
	<jsp:include page="header.jsp" />
	</header>

	<!-- Menu -->
	<div class="menu_container menu_mm">

		<!-- Menu Close Button -->
		<div class="menu_close_container">
			<div class="menu_close"></div>
		</div>

		<!-- Menu Items -->
		<div class="dropmenu">
			<div class="menu_inner menu_mm">
				<div class="menu menu_mm">
					<div class="menu_search_form_container">
						<form action="#" id="menu_search_form">
							<input type="search" class="menu_search_input menu_mm">
							<button id="menu_search_submit" class="menu_search_submit" type="submit"><img src="<%=cp %>/project/images/search_2.png" alt=""></button>
						</form>
					</div>
					<ul class="menu_list menu_mm">
						<li class="menu_item menu_mm"><a href="<%=cp %>/main/main.km">Home</a></li>
						<!-- 추가 -->
						<li class="menu_item menu_mm"><a href="#">상품</a>
							<ul>
							<li style="background-color: white;"><a href="<%=cp %>/travel/tripboard.km"><p style="color: black;">여행지</p></a></li>
							<li style="background-color: white;"><a href="goods/goodsboard.km"><p style="color: black;">굿즈(Comming Soon)</p></a></li>
							</ul>
						</li>
						<c:if test="${sessionScope.CustomInfo.type=='user' }">
						<li class="menu_item menu_mm"><a href="<%=cp %>/carts/c_list.km">장바구니</a></li>
						</c:if>
						<c:if test="${sessionScope.CustomInfo.type=='company' }">
						<%-- <li class="menu_item menu_mm"><a href="<%=cp %>/buyproduct/c_list.km">고객관리</a></li> --%>
						</c:if>
						<!-- 추가 -->
						
						<li class="menu_item menu_mm"><a href="#">Community</a>
							<ul>
							<li style="background-color: white;"><a href="<%=cp %>/kmtour/comment.km"><p style="color: black;">후기</p></a></li>
							</ul>			
						</li>
						<li class="menu_item menu_mm"><a href="<%=cp %>/query/qna.km">Q&A</a></li>
						<li class="menu_item menu_mm"><a href="<%=cp %>/not/no_list.km">공지사항</a></li>
					</ul>
				</div>

			</div>

		</div>

	</div>
	
	<!-- Home -->
	<div class="home" style="height: 700px;">
		<div class="home_background" style="background-image:url(<%=cp %>/project/images/home.jpg)"></div>
		<div class="home_content">
			<div class="home_content_inner">
				<div class="home_text_large">KMTOUR</div>
				<div class="home_text_small" style="padding-left: 100px; color: #EAEAEA;">Discover new worlds</div>
			</div>
		</div>
	</div>
	
	
	<!-- Top Destinations -->
	<div class="top">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="section_title text-center">
						<h2>여행 후기</h2>
						<div>여러분의 경험을 공유해주세요</div>
						<form action="" name="commentform">
						<div id="rightHeader" align="right">
							<input type="button" value="작성하기" class="btn btn-danger" onclick="checkid();"/>
						</div>
						</form>
					</div>
					<br/><br/><br/>
					<img src="<%=cp %>/project/images/last_logo.png" width=30px; height=30px; alt="">&nbsp;&nbsp;
					<span style="font: italic bold 1.5em/1em Georgia ;"><b>최고의 후기</b></span>						
				</div>		
			</div>		
			
			<div class="row">
				<div class="col">
					<div class="popular_content d-flex flex-md-row flex-column flex-wrap align-items-md-center align-items-start justify-content-md-between justify-content-start">
						
					<!-- Popular Item -->
					<c:forEach var="bestdto" items="${bestlists}" >
						<c:if test="${!empty bestdto.imagefilename}">
							<div class="popular_item">					
								<a href="commentarticle.km?no=${bestdto.no }">
									<img src="${imagePath}/${bestdto.imagefilename}" width="250" height="200" />
									<div class="popular_item_content">
										<div class="popular_item_price">${bestdto.id }</div>
										<div class="popular_item_title">${bestdto.subject }</div>
									</div>
								</a>
							</div> 
						</c:if>
						
						<c:if test="${empty bestdto.imagefilename}">
							<div class="popular_item">
								<a href="commentarticle.km?no=${bestdto.no }">
									<img src="<%=cp %>/project/images/sample.jpg" width="250" height="200" />
									<div class="popular_item_content">
										<div class="popular_item_price">${bestdto.id }</div>
										<div class="popular_item_title">${bestdto.subject }</div>
									</div>
								</a>
							</div>
						</c:if>
					</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	

	<!-- Video -->
	<div class="video_section d-flex flex-column align-items-center justify-content-center">
		<!-- Image by https://unsplash.com/@peecho -->
		<div class="video_background parallax-window" data-parallax="scroll" data-image-src="<%=cp %>/project/images/video.jpg" data-speed="0.8"></div>
		<div class="video_content">
			<div class="video_title">A day on the Venezia</div>
			<div class="video_subtitle">A trip organized by KM_TOUR</div>
			<div class="video_play">
				<a  class="video" href="https://www.youtube.com/watch?v=0DTCgcf62Qw">
					<svg version="1.1" id="Layer_1" class="play_button" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
						 width="140px" height="140px" viewBox="0 0 140 140" enable-background="new 0 0 140 140" xml:space="preserve">
						<g id="Layer_2">
							<circle class="play_circle" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-miterlimit="10" cx="70.333" cy="69.58" r="68.542"/>
							<polygon class="play_triangle" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-miterlimit="10" points="61.583,56 61.583,84.417 84.75,70 	"/>
						</g>
					</svg>
				</a>
			</div>
		</div>
	</div>
	
	
	
	<!-- 본문 시작 -->
		<table width="1140" border="0" align="center" style="margin:0 auto;">
		  <tbody>
		    <tr height="50">
		    </tr>
		    <tr align="center" style="height: 40px; background-color: #e6e6e6; font-weight: bold;">
		      <td style="width: 5%; font-size: 15px;">&nbsp;</td>
		      <td style="width: 10%; font-size: 15px;">국&nbsp;&nbsp;가</td>
		      <td style="width: 50%; font-size: 15px;">제&nbsp;&nbsp;&nbsp;목</td>
		      <td style="width: 10%; font-size: 15px;">작&nbsp;성&nbsp;자</td>
		      <td style="width: 15%; font-size: 15px;">작&nbsp;성&nbsp;일</td>
		      <td style="width: 5%; font-size: 15px;">조회수</td>
		      <td style="width: 5%; font-size: 15px;">추천수</td>
		    </tr>
		    <tr style="height: 1px;" bgcolor="#e7e7e7">
		      <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
		    </tr>
		    <c:forEach var="dto" items="${lists }">
		    <tr align="center" height="40" style="font-size: 15px;">
		      <td style="font-size: 15px;">${dto.no }</td>
		      <td style="font-size: 13px; color: red;">[ ${dto.product } ]</td>
		      <td><a href="${articleUrl}&no=${dto.no}">${dto.subject }</a></td>
		      <td>${dto.id}</td>
		      <td>${dto.created }</td>
		      <td>${dto.hitcount}</td>
		      <td>${dto.count}</td>
		    </tr>
		    <tr style="height: 1px;" bgcolor="#e7e7e7">
		      <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
		    </tr>
			</c:forEach>
		  </tbody>
		</table>

	<div class=page>
		<p>
			<c:if test="${dataCount!=0 }">
			${pageIndexList }
			</c:if>
			<c:if test="${dataCount==0 }">
			등록된 게시물이 없습니다.
			</c:if>
		</p>
	</div>


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

<script src="<%=cp %>/project/js/jquery-3.2.1.min.js"></script>
<script src="<%=cp %>/project/styles/bootstrap4/popper.js"></script>
<script src="<%=cp %>/project/styles/bootstrap4/bootstrap.min.js"></script>
<script src="<%=cp %>/project/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="<%=cp %>/project/plugins/easing/easing.js"></script>
<script src="<%=cp %>/project/plugins/parallax-js-master/parallax.min.js"></script>
<script src="<%=cp %>/project/plugins/magnific-popup/jquery.magnific-popup.min.js"></script>
<script src="<%=cp %>/project/js/custom.js"></script>

</body>
</html>