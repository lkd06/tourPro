<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Destino project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
<link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="styles/contact_styles.css">
<link rel="stylesheet" type="text/css" href="styles/contact_responsive.css">


<script type="text/javascript">

	function sendEmail(){
		
		var f= document.mailForm;
		
		if(!f.senderName.value){
			alert("이름을 입력해주세요.");
			f.senderName.focus();
			return;
		}
		
		if(!f.senderEmail.value){
			alert("메일주소를 입력해주세요.");
			f.senderEmail.focus();
			return;
		}
		
		if(!f.subject.value){
			alert("제목을 입력해주세요.");
			f.subject.focus();
			return;
		}
		
		if(!f.content.value){
			alert("내용을 입력해주세요.");
			f.content.focus();
			return;
		}
		
		f.action="<%=cp%>/project/sendemail_ok.jsp";
		f.submit();
	}


</script>
</head>
<body>

<div class="super_container">
	
	<!-- Header -->

	<header class="header">
	<jsp:include page="header.jsp" />
	</header>

	
	<!-- Home -->

	<div class="home" style="height: 700px;">
		<!-- Image by https://unsplash.com/@peecho -->
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="<%=cp %>/project/images/news.jpg" data-speed="0.8"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="home_content">
						<div class="home_content_inner">
							<div class="home_title">Contact</div>
							<div class="home_breadcrumbs">
								<ul class="home_breadcrumbs_list">
									<li class="home_breadcrumb"><a href="<%=cp %>/project/index.html">Home</a></li>
									<li class="home_breadcrumb">Contact</li>
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
					<div class="find_title text-center">
					<font size="40px"><b>문의하기</b></font><br>
					<font size="4px" color="#e6e6e6">답장 해줄지는 모르겠지만....</font></div>
				</div>
			</div>
		</div>
	</div>



	<!-- Contact -->
	<div class="contact">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="contact_title">문의하기</div>
					<div class="contact_subtitle">인사말</div>
				</div>
			</div>
			<div class="row contact_content">		
				<div class="col-lg-5">
					<div class="contact_text">
						<p>
						K_M Tour 에 궁금하신 점을 이메일로 문의하세요. 아래의 양식에 맞추어 궁금하신 점을 문의해주시면,	문의 주신 내용은 최대한 빨리 성실하게 답변해 드리겠습니다. (토, 일요일 및 공휴일에는 바로 연락드리지 못할 수 있사오니 사전에 양해의 말씀 드립니다.)
						</p>
						</div>
						
					<div class="contact_info">
						<div class="contact_info_box">i</div>
						<div class="contact_info_container">
							<div class="contact_info_content">
								<ul>
									<li>Address: 서울 강남구 테헤란로 123</li>
									<li>Phone: (+82) 010 9279 1883</li>
									<!-- <input type="hidden" name="receiverEmail" value="kmtour1002@naver.com"/> -->
									<li>Email:kmtour1002@kmtour.com </li> 
								</ul>
							</div>
							
							<div class="contact_info_social">
								<ul>
									<li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
								</ul>
							</div>
							
						</div>
					</div>
				</div>
		
			
			
				<div class="col-lg-7">
					<div class="contact_form_container">
					<form action="" method="post" name="mailForm" id="contact_form" class="clearfix">
							<input type="text" id="contact_input_name" class="contact_input contact_input_name"  name="senderName" value="이름을 적어주세요." onfocus="this.value=''">
							<input type="text" id="contact_input_email" class="contact_input contact_input_email"  name="senderEmail" value="답변을 받을 이메일주소를 적어주세요." onfocus="this.value=''" >
							<input type="text" id="contact_input_subject" class="contact_input contact_input_subject" name="subject" value="제목을 적어주세요." onfocus="this.value=''">
							<textarea  id="contact_input_message" class="contact_message_input contact_input_message" name="content" placeholder="내용을 적어주세요." onfocus="this.value=''"></textarea>
							<input type="hidden" name="receiverEmail" value="kmtour1002@naver.com"/>
							<input type="button" id="contact_send_btn" type="submit" class="contact_send_btn trans_200" value="Send" onclick="sendEmail();" /> 				
					</form>	
					</div>
				</div>			
			</div>
		
			<div class="row contact_map">
				<!-- Google Map -->

				<div class="col">
					<div id="google_map">
						<div class="map_container">
							<div id="map"></div>
						</div>
					</div>
				</div>

			</div>
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
</div>

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
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCIwF204lFZg1y4kPSIhKaHEXMLYxxuMhA"></script>
<script src="<%=cp %>/project/js/contact_custom.js"></script>
</body>
</html>