<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	String cpPath=cp+"/project/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>무엇이든 물어보세요</title>
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
		
		var f = document.sendForm;
		/*
		str = f.subject.value;
		str = str.trim();
		if(!str){
			alert("\n제목을 입력하세요.");
			f.subject.focus();
			return;
		}
		f.subject.value = str; */
	
		
		/* 한글 입력 확인 */
		/* 
		if(!isValidKorean(str)){
			alert("\n이름을 정확히 입력하세요.");
			f.name.focus();
			return;
		}
		f.name.value = str;
		 */
		
	/* 	if(f.email.value){
			if(!isValidEmail(f.email.value)){
				alert("\n이메일을 입력하세요.");
				f.email.focus();
				return;
			}
		}
		
		
		
		str = f.content.value;
		str = str.trim();
		if(!str){
			alert("\n내용을 입력하세요.");
			f.content.focus();
			return;
		}
		f.content.value = str; */
		
		/* 
		str = f.pwd.value;
		str = str.trim();
		if(!str){
			alert("\n패스워드를 입력하세요.");
			f.pwd.focus();
			return;
		}
		f.pwd.value = str;
		 */
		f.action = "<%=cp%>/query/qnacreated_ok.km";
		
		f.submit();
	
	}
	
	function sendIt2() { //자기 자신을 리로딩!!!
		var f = document.searchForm;
		f.action = "<%=cp%>/project/qna/qna.jsp";
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

	
	<!-- Home -->

	<div class="home">
		<!-- Image by https://unsplash.com/@peecho -->
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="<%=cp %>/project/images/offers.jpg" data-speed="0.8"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="home_content">
						<div class="home_content_inner">
							<div class="home_title">Q&A</div>
							<div class="home_breadcrumbs">
								<ul class="home_breadcrumbs_list">
									<li class="home_breadcrumb"><a href="index.html">Home</a></li>
									<li class="home_breadcrumb">Q&A</li>
								</ul>
							</div>
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
						<form action="#" id="find_form" name="searchForm" method="post" class="find_form d-flex flex-md-row flex-column align-items-md-center align-items-start justify-content-md-between justify-content-start flex-wrap">
							<input type="text" style="height: 40px; width: 950px;" name="searchValue">
							<button class="button find_button" onclick="sendIt2();">Find</button>
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
					<div class="sorting_group_1">
					</div>
					<div class="sorting_group_2 clearfix">
						<div class="sorting_icons clearfix">
							
						</div>
					</div>
				</div>
			</div>
			
			
			<!-- 본문내용 -->
<form action="" name="sendForm" method="post">
	
<table width="400" border="0" align="center" style="margin:0 auto;">
  <tbody>
    <tr align="center" height="40">
     <td align="left">
		  <input type="text" name="subject" style="padding-left: 5px; width: 500px; height: 35px;" value="제목" onfocus="this.value=''"></td>
    </tr>
    <tr align="center" height="40">
      <td align="left">
		  <input type="text" name="id" height="30" style="padding-left: 5px; width: 500px; height: 35px;" value="${sessionScope.CustomInfo.id }" readonly></td>
    </tr>
    <tr align="center" height="40">
      <td align="left">
		  <input type="text" name="email" height="30" style="padding-left: 5px; width: 500px; height: 35px;" value="이메일" onfocus="this.value=''"></td>
    </tr>
    <tr align="center" height="200" valign="top">
      <td align="left">
		  <textarea role="200" rows="10" name="content" style="padding-left: 5px; width: 500px;" onfocus="this.value=''">내용</textarea></td>
    </tr>
    <tr>
    <td style="height: 5px;"></td>
    </tr>
    <tr>
    <td align="center">
    	<input type="button" value="등록하기" class="btn btn-danger" onclick="sendIt()"/>
		<input type="reset" value="다시작성" class="btn btn-danger" onclick="document.sendForm.subject.focus();"/>
		<input type="button" value="작성취소" class="btn btn-danger" onclick="javascript:location.href='<%=cp%>/query/qna.km';"/>
	</td>
	</tr>
  </tbody>
</table>
<br/><br/>
	
				


</form>	
	
				
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
</body>
</html>