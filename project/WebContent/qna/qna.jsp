<%@page import="java.net.URLEncoder"%>
<%@page import="com.qna.*"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.util.MyUtil"%>

<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	
	//Connection conn = DBConn.getConnection();
		Connection conn = DBConn.getConnenction();
		
		qnaDAO dao = new qnaDAO(conn);
		
		MyUtil myUtil = new MyUtil(); //이 뼈대는 바뀌지 않음
		
		//넘어온 페이지 번호(MyUtil, 수정, 삭제)ed
		String pageNum = request.getParameter("pageNum");
		
		int  currentPage = 1; //처음 실행하면 나오는 페이지
		
		if(pageNum!=null)
			currentPage = Integer.parseInt(pageNum);
		
		//검색
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		
		if(searchValue!=null){ //사용자가 검색을 했으면
			
			if(request.getMethod().equalsIgnoreCase("GET")) { //request에 담겨오는 메소드의 방식이 대소문자를 구분하지 않고 GET방식으로 넘어오면 
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
			}
		}else{ //검색을 하지 않았을때

			searchKey = "subject";
			searchValue = "";
		}
		
		//전체 데이터 구하기
		int dataCount = dao.getDataCount(searchKey, searchValue);
		
		//총 페이지수 구하기
		int numPerPage = 9; //하나의 페이지에 표시될 게시물 갯수
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		//전체페이지수보다 표시할 페이지가 더 큰경우
		if(currentPage>totalPage && currentPage!=1)
			currentPage = totalPage;
		
		//DB에서 가져올 데이터의 시작과 끝
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;

		List<qnaDTO> lists = dao.getList(start, end, searchKey, searchValue);
				
		
		String param = "";
		if(!searchValue.equals("")){ //검색했을때
			param = "?searchKey=" + searchKey;
			param+= "&searchValue=" + URLEncoder.encode(searchValue,"UTF-8");
		}
		
		
		//페이지 처리
		String listUrl = "qna.km" + param;
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		
		//article 주소 정리, 사용자정의. 상세보기
		String articleUrl = cp + "/query/qnaarticle.km";
		
		if(param.equals("")){ //null이면 검색을 안한거
			articleUrl = articleUrl + "?pageNum=" + currentPage; //num은 아래 for문 안에서만 만들어짐

		}else { //검색을 했을때
			articleUrl = articleUrl + param + "&pageNum=" + currentPage;
		}
		
		//DBConn.close();
		DBConn.close();
	
	
	
		String cpPath=cp+"/project/";
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Q&A</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Destino project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="<%=cp %>/project/styles/bootstrap4/bootstrap.min.css">
<link href="<%=cp %>/project/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/project/styles/offers_styles.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/project/styles/offers_responsive.css">
<meta name="description" content="Destino project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="<%=cpPath %>styles/bootstrap4/bootstrap.min.css">
<link href="<%=cpPath %>plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=cpPath %>plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="<%=cpPath %>plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="<%=cpPath %>plugins/OwlCarousel2-2.2.1/animate.css">
<link href="<%=cpPath %>plugins/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=cpPath %>styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="<%=cpPath %>styles/responsive.css">
<link rel="stylesheet" type="text/css" href="<%=cpPath %>styles/dropmenu.css">

<script src="<%=cpPath %>js/jquery-3.2.1.min.js"></script>
<script src="<%=cpPath %>styles/bootstrap4/popper.js"></script>
<script src="<%=cpPath %>styles/bootstrap4/bootstrap.min.js"></script>
<script src="<%=cpPath %>plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="<%=cpPath %>plugins/easing/easing.js"></script>
<script src="<%=cpPath %>plugins/parallax-js-master/parallax.min.js"></script>
<script src="<%=cpPath %>plugins/magnific-popup/jquery.magnific-popup.min.js"></script>
<script src="<%=cpPath %>js/custom.js"></script>

<script type="text/javascript">
	
	function seach() { //자기 자신을 리로딩!!!
		var f = document.searchForm;
		f.action = "<%=cp%>/query/qna.km";
		f.submit();
	}
	
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
						<button id="menu_search_submit" class="menu_search_submit" type="submit"><img src="<%=cp %>/project/images/search_2.png" alt=""></button>
					</form>
				</div>
				<ul class="menu_list menu_mm">
					<li class="menu_item menu_mm"><a href="index.html">Home</a></li>
					<li class="menu_item menu_mm"><a href="about.html">About us</a></li>
					<li class="menu_item menu_mm"><a href="#">Offers</a></li>
					<li class="menu_item menu_mm"><a href="news.html">News</a></li>
					<li class="menu_item menu_mm"><a href="contact.html">Contact</a></li>
				</ul>

				
			</div>

		</div>

	</div>
	
	<!-- Home -->

	<div class="home" style="height: 700px;">
		<!-- Image by https://unsplash.com/@peecho -->
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="<%=cp %>/project/images/offers.jpg" data-speed="0.8"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="home_content">
						<div class="home_content_inner">
							<div class="home_text_large">KMTOUR</div>
							<div class="home_text_small" style="padding-left: 150px; color: #EAEAEA;">Discover new worlds</div>
						</div>
					</div>
				</div>
			</div>
		</div>		
	</div>
	
	<!-- Find Form -->	
	<div class="find">
		<!-- Image by https://unsplash.com/@garciasaldana_ -->
		<div class="find_background_container prlx_parent">
			<div class="find_background prlx" style="background-image:url(<%=cp %>/project/images/find.jpg)"></div>
		</div>
		<!-- <div class="find_background parallax-window" data-parallax="scroll" data-image-src="images/find.jpg" data-speed="0.8"></div> -->
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="find_title text-center">Questions&nbsp;&nbsp;and&nbsp;&nbsp;Answers</div>
				</div>
				<div class="col-12">
					<div class="find_form_container">
						<form action="#" name="searchForm" id="find_form" class="find_form d-flex flex-md-row flex-column align-items-md-center align-items-start justify-content-md-between justify-content-start flex-wrap">
							<input type="text" style="height: 40px; width: 950px;" name="searchValue">
							<button class="button find_button" onclick="seach();">Find</button>
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
					<div class="section_title text-center">
						<h2>일단 무엇이든 물어보세요</h2>
						<div>잘은 모르겠지만....</div>
					</div>
				</div>
			</div>
			<div class="row filtering_row">
				<div class="col">
					<form action="" name="commentform">
						<div class="sorting_group_1">
									<button type="button" class="btn btn-danger" onclick="javascript:location.href='<%=cp%>/query/qnacreated.km';">글쓰기</button>
						</div>
					</form>
					<div class="sorting_group_2 clearfix">
						<div class="sorting_icons clearfix">
							
							<div class="detail_view"><i class="fa fa-bars" aria-hidden="true"></i></div>
						</div>
					</div>
				</div>
			</div>
			
			
			<!-- 본문내용 -->
			
			
			<br><br>
		
		<table width="1140" border="0">
		
		    <tr align="center" height="35" valign="middle" bgcolor="#e6e6e6">
		      <td name="num" width="100">&nbsp;</td>
		      <td name="subject" width="600">제&nbsp;&nbsp;목</td>
		      <td name="id">작&nbsp;성&nbsp;자</td>
		      <td name="created">작&nbsp;성&nbsp;일</td>
		      <td name="hitCount">조&nbsp;&nbsp;회</td>
		    </tr>
			<tr cols bgcolor="e7e7e7" height="2">
				<th></th><th></th><th></th><th></th><th></th>
			</tr>
			<c:forEach var="dto" items="${lists }">
			<tr align="center" height="30" valign="middle" >
		      <td>${dto.getNum() }</td>
		      <td align="left" style="padding-left: 80px;"><a href="<%=articleUrl %>&num=${dto.getNum() }">${dto.getSubject() }</a></td>
		      <td>${dto.getId() }</td>
		      <td>${dto.getCreated() }</td>
		      <td>${dto.getHitCount() }</td>
		    </tr>
			<tr bgcolor="e7e7e7" height="2">
				<th></th><th></th><th></th><th></th><th></th>
			</tr>
			</c:forEach>
			
		 </table>
		 
		<div align="center">
			<p>	
				<c:if test="${dataCount!=0 }">
					${pageIndexList }
				</c:if>
				<c:if test="${dataCount==0 }">
					등록된 게시물이 없습니다.
				</c:if>
			</p>
		</div>
	</div>


<br><br>


	
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


</body>
</html>