<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8"); 
	String cp=request.getContextPath();
	String ch = request.getParameter("ch");
	String id = request.getParameter("id");
	String cpPath=cp+"/project/";
	int num = (int)request.getAttribute("num");
	String pageNum = (String)request.getAttribute("pageNum");
	
	if(pageNum == null || pageNum.equals("")){
		pageNum="1";
	}
	String name = request.getParameter("name");
	
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
<script src="<%=cpPath %>plugins/parallax-js-master/parallax.min.js"></script>f
<script src="<%=cpPath %>plugins/magnific-popup/jquery.magnific-popup.min.js"></script>
<script src="<%=cpPath %>js/custom.js"></script>

<script type="text/javascript">

function change(){
	var f = document.myForm;
	f.action="<%=cp %>/tourImages/update_ok.km?num="+<%=num%>+"&pageNum="+<%=pageNum%>;
	f.submit();
}
function goMain(){
	var f = document.myForm
	f.action="<%=cp %>/tourImages/list.km";
	f.submit();
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

#div2 {
   width: 241px;
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
<body>

<form action="" name="myForm" method="post" enctype="multipart/form-data">

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
								<img src="<%=cp %>/image/search_2.png" alt="">
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
				style="background-image: url(<%=cp %>/image/home.jpg)"></div>
			<div class="home_content">
				<div class="home_content_inner">
					<div class="home_text_large">KM 투어</div>
					<div class="home_text_small">경도야 미안해</div>
				</div>
			</div>
		</div>

			
<br><br><br><Br>
<input type="hidden" name="num" value="${num }">
<input type="button" onclick="change();">
<%-- <form action="<%=cp %>/tourImages/update_ok.km" method="post" enctype="multipart/form-data"> --%>
	<div class="">
		
		<div class="special_content" align="center" style="width: 500; height: 800px;">
			<div class="">
				<div class="" style="display: table; width: 33%;border: 0px solid; color: #c0c0c0;"  align="center">
					<!-- 여기에 회원 가입 입력 -->
					
					<div style="color: #000000;"  align="left" >
					<h2><b>사진수정</b></h2><br>
					<font size="4pt;"><b>
					제목<br> 
					<input type="text" name="name" id="div1" value="${dto.name }"/><br>
					사진제목 <br><input type="file" name="upload" /><br></b>
					</font>
					</div>
				</div>
				<br>
				<!-- 버튼 -->
				<div class="" style="display: table; width: 30%; padding-left:30px; border: 0px solid; color: #c0c0c0;"  align="left">
				<div style="display: table-row;"/>
					<input type="hidden" name="upload" value="upload"/>
					<input type="hidden" name="num" value="<%=num %>" /> 
					<input type="hidden" name="pageNum" value="<%=pageNum %>" />
					<input type="submit" value="사진수정" id="btn2" onclick="change();" >&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" value="초기화" id="btn2"/>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="취소" id="btn2" onclick="goMain();"> 
				</div>
				</div>
				
			</div>
		</div>
	</div>
</form>
	<br>
	


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
								<div>destino</div>
								<div>travel agency</div>
								<div class="logo_image"><img src="<%=cp %>/projects/images/logo.png" alt=""></div>
							</div>
						</div>
						<div class="footer_about_text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer pulvinar sed mauris eget tincidunt. Sed lectus nulla, tempor vel eleifend quis, tempus rut rum metus. Pellentesque ultricies enim eu quam fermentum hendrerit.</div>
						<div class="copyright"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></div>
					</div>
				</div>

				<!-- Footer Column -->
				<div class="col-lg-4 footer_col">
					<div class="footer_latest">
						<div class="footer_title">Latest News</div>
						<div class="footer_latest_content">

							<!-- Footer Latest Post -->
							<div class="footer_latest_item">
								<div class="footer_latest_image"><img src="<%=cp %>/projects/images/latest_1.jpg" alt="https://unsplash.com/@peecho"></div>
								<div class="footer_latest_item_content">
									<div class="footer_latest_item_title"><a href="<%=cp %>/projects/news.html">Brazil Summer</a></div>
									<div class="footer_latest_item_date">Jan 09, 2018</div>
								</div>
							</div>

							<!-- Footer Latest Post -->
							<div class="footer_latest_item">
								<div class="footer_latest_image"><img src="<%=cp %>/projects/images/latest_2.jpg" alt="https://unsplash.com/@sanfrancisco"></div>
								<div class="footer_latest_item_content">
									<div class="footer_latest_item_title"><a href="<%=cp %>/projects/news.html">A perfect vacation</a></div>
									<div class="footer_latest_item_date">October 02, 2019</div>
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
</form>
</body>
</html>