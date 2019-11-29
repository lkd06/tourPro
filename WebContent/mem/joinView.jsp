<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8"); 
	String cp=request.getContextPath();
	String ch = request.getParameter("ch");
	String id = request.getParameter("id");
	String cpPath=cp+"/project/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
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

function join(){
	
	var f = document.myForm;
	f.action="<%=cp %>/member/join_ok.km";
	f.submit();
}

function goBack(){
	var f = document.myForm;
	f.action="<%=cp %>/main/main.km";
	f.submit();
}

function checkID(){
	var f = document.my;
	var url ="<%=cp %>/member/idCheck.km?id="+f.id.value;
	var name="id";
	var option= "width = 500, height = 100, top = 100, left = 200, location = no"
    window.open(url, name, option);
}

</script>

<style type="text/css">

#div1 {
   width: 500px;
   height: 50px;
   border: 1px solid #c0c0c0;
   border-radius: 10px;
   font-size : 13pt;
}

#btn1 {
   width: 80px;
   height: 50px;
   background-color : #fe435b;
   border: 1px solid #fe435b;
   color : #ffffff;
   font-style : inherit;
   border-radius: 10px;
   font-size : 13pt;
}

#btn2 {
   width: 100px;
   height: 50px;
   background-color : #fe435b;
   border: 1px solid #fe435b;
   color : #ffffff;
   font-style : inherit;
   border-radius: 10px;
   font-size : 13pt;
}


</style>

</head>
<body onload="mes();">


		
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
						<li class="menu_item menu_mm"><a href="<%=cp %>/kmtour/list.km">여행상품</a></li>
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
					<div class="home_text_large">KM 투어</div>
					<div class="home_text_small">경도야 미안해</div>
				</div>
			</div>
		</div>

		</div>
<br><br><br><Br>
<form action="" name="my" method="post">
	<div class="">
		
		<div class="special_content" align="center" style="width: 500; height: 1200px;">
			<div class="">
				<div class="" style="display: table; width: 33%;border: 0px solid; color: #c0c0c0;"  align="center">
					<!-- 여기에 회원 가입 입력 -->
					
					<div style="color: #000000;"  align="left" >
					<h2><b>회원가입</b></h2><br><br>
					<font size="4pt;"><b>
					아이디<br> <input type="text" name="id" id="div1"/>
					<input type="button" name="CHECKID" value="중복확인" id="btn1" onclick="checkID();"/><img alt="" src=""><br><br>
					
					패스워드<br> <input type="password" name="ch_pw" id="div1"/><br><br>
					이름<br> <input type="text" name="name" id="div1"/><br><br>
					주소<br> <input type="text" name="addr" id="div1"/><br><br>
					TEL<br> <input type="text" name="tel" id="div1"/><br><br>
					사용유형<br> 
					<select name="type" id="div1">
							<option>선택</option>
							<option value="company">여행사</option>
							<option value="user">일반 이용자</option>
					</select><br><br>
					 E-MAIL<br> <input type="text" name="email" id="div1"/></b><br><br>
					</font> 
					</div>

				</div>
				<br>
				
				<!-- 버튼 -->
				
				<div class="" style="display: table; width: 32%; padding-rigth:20px; border: 0px solid; color: #c0c0c0;"  align="left">
				<div style="display: table-row;">
					<span style="display: table-cell;border: 0px solid;">
					<input type="button" value="회원가입" id="btn2" onclick="join();">
					</span>
					
					<span style="display: table-cell;border: 0px solid;">
					<input type="reset" value="초기화" id="btn2" onclick="document.myForm.id.focus();">
					</span>
					 
					<span style="display: table-cell;border: 0px solid;">
						<input type="button" value="취소" id="btn2" onclick="goBack();"> 
					</span>
					
				</div>
				
				</div>
			</div>
		</div>
	</div>
</form>
	<br>
	


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