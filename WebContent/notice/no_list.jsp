<%@page import="com.notice.NoticeDTO"%>
<%@page import="com.notice.NoticeDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.List"%>
<%@page import="com.cart.*"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.util.MyUtil"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	Connection conn = DBConn.getConnenction();
	NoticeDAO dao = new NoticeDAO(conn);
	String cpPath=cp+"/project/";
	MyUtil myUtil = new MyUtil();
	
	//넘어온 페이지 번호(MyUtil,article,수정,삭제)
	String pageNum = request.getParameter("pageNum");

	int currentPage = 1; //처음 실행하는 페이지

	if(pageNum!=null)
		currentPage = Integer.parseInt(pageNum);

	//검색(MyUtil,article,수정,삭제)
	String searchKey = request.getParameter("searchKey");
	String searchValue = request.getParameter("searchValue");

	if(searchValue!=null){ //검색했으면
		if(request.getMethod().equalsIgnoreCase("GET")){
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
	}else{ //검색안했으면
		searchKey = "subject";
		searchValue = "";
	}
	
	//전체 데이터 구하기
	int dataCount = dao.getDataCount(searchKey, searchValue);

	//전체 페이지 수 구하기
	int numPerPage = 10;
	int totalPage = myUtil.getPageCount(numPerPage, dataCount);

	//전체 페이지 수보다 표시할 페이지가 더 큰 경우
	if(currentPage>totalPage)
		currentPage = totalPage;

	//DB에서 가져올 데이터의 시작과 끝
	int start = (currentPage-1)*numPerPage+1;
	int end = currentPage*numPerPage;

	List<NoticeDTO> lists = dao.getLists(start, end, searchKey, searchValue);

	//list 주소 정리
	String param ="";
	if(!searchValue.equals("")){
		param = "?searchKey=" + searchKey;
		param += "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
	}

	//페이지 처리
	String listUrl = cp + "/not/no_list.km" + param;
	String pageIndexList = 
			myUtil.pageIndexList(currentPage, totalPage, listUrl);

	//article 주소 정리
	String articleUrl = cp + "/not/no_article.km";
	/*if(param.equals("")){
		articleUrl = articleUrl + "?pageNum=" + currentPage;
		//num은 for문안에서만 쓸수있다
	}else{
		articleUrl = articleUrl + param + "&pageNum=" + currentPage;
	}*/

	//포워딩하는 데이터
	request.setAttribute("lists", lists);
	request.setAttribute("pageIndexList", pageIndexList);
	request.setAttribute("dataCount", dataCount);
	request.setAttribute("articleUrl", articleUrl);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
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

<script type="text/javascript">
	
	function sendIt() {
		
		var f = document.searchForm;
		
		f.action = "<%=cp %>/not/no_list.km";
		f.submit();
	}
	
</script>

</head>
<body>


<!-- 큰틀 -->

	<div class="home" style="height: 700px">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="<%=cp %>/project/images/news.jpg" data-speed="0.8"></div>
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
		<div class="find_background_container prlx_parent">
			<div class="find_background prlx" style="background-image:url(<%=cp %>/project/images/find.jpg)"></div>
		</div>
		
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="find_title text-center"><h1>공지사항</h1></div>
				</div>
			</div>
		</div>
	</div>


<!-- 따라다니는 메뉴바 -->
	<header class="header">
		<jsp:include page="../project/header.jsp" />
	</header>
		
	<!-- Offers -->
	<div class="offers">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="section_title text-center">
						<h2>공지사항 읽어보세요</h2>
						<div>읽을지는 모르겠지만....</div>
					</div>
				</div>
			</div>
		</div>
		
		
	<!-- 공지사항 list -->
	<table align="center" width="1140" border="0" style="margin:0 auto;">
		<tr height="50px">
			<td>
				<c:if test="${sessionScope.CustomInfo.type=='company' }">
					<input type="button" value="글쓰기" onclick="javascript:location.href='<%=cp %>/notice/no_create.jsp';">
				</c:if>
			</td>
		<tr>
	    <tr align="center" height="35" valign="middle" bgcolor="#e6e6e6">
		    <th scope="num">번&nbsp;&nbsp;호</th>
		    <th scope="subject" width="800">제&nbsp;&nbsp;목</th>
		    <th scope="id">작&nbsp;성&nbsp;자</th>
		    <th scope="created">작&nbsp;성&nbsp;일</th>
		    <th scope="hitCount">조&nbsp;&nbsp;회</th>
	    </tr>
		<tr cols bgcolor="e7e7e7" height="2">
			<th></th><th></th><th></th><th></th><th></th>
		</tr>
		<%for(NoticeDTO dto : lists) {%>
		<tr align="center" height="30" valign="middle" >
		    <td><%=dto.getNum() %></td>
		    <td><a href="<%=cp %>/not/no_article.km?num=<%=dto.getNum() %>"><%=dto.getSubject() %></td>
		    <td>관리자</td>
		    <td><%=dto.getCreated() %></td>
		    <td><%=dto.getHitCount() %></td>
	    </tr>
		<tr cols bgcolor="e7e7e7" height="2">
			<th></th><th></th><th></th><th></th><th></th>
		</tr>
		<%} %>
	</table>
	
	<!-- 페이지 처리(10개씩) -->
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
	<div class="news">
		<div class="container">
			
		</div>
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


<script src="<%=cp %>/project/js/jquery-3.2.1.min.js"></script>
<script src="<%=cp %>/project/styles/bootstrap4/popper.js"></script>
<script src="<%=cp %>/project/styles/bootstrap4/bootstrap.min.js"></script>
<script src="<%=cp %>/project/plugins/greensock/TweenMax.min.js"></script>
<script src="<%=cp %>/project/plugins/greensock/TimelineMax.min.js"></script>
<script src="<%=cp %>/project/plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="<%=cp %>/project/plugins/greensock/animation.gsap.min.js"></script>
<script src="<%=cp %>/project/plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="<%=cp %>/project/plugins/easing/easing.js"></script>
<script src="<%=cp %>/project/plugins/parallax-js-master/parallax.min.js"></script>
<script src="<%=cp %>/project/js/news_custom.js"></script>


</body>
</html>