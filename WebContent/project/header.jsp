<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	String cpPath=cp+"/project/";
	String default_root=cp+"/project/";
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

<!-- scritp 추가 -->
<script type="text/javascript">
	
	function login(){
		
		var f = document.myForm;
		if(!f.id.value){ f.id.focus(); return;}
		if(!f.pw.value){ f.pw.focus(); return;}
		//alert(f.id.value);
		f.action="<%=cp %>/member/login.km";
		f.submit();
	}
	
	function memJoin(){
		//alert("회원가입");
		var f = document.myForm;
		f.action="<%=cp %>/member/join.km";
		f.submit();
	}
	
	function logout(){
		var f = document.myForm;
		f.action="<%=cp %>/member/logout.km";
		f.submit();
	}
	
	function memDelete() {
		var f = document.myForm;
		f.action="<%=cp %>/member/delete.km";
		f.submit();
	}
	
	function memInfo() {
		var f = document.myForm;
		f.action="<%=cp %>/member/memInfo.km";
		f.submit();
	}
</script>
</head>
<body>
<!-- from 추가 -->
<form action="" name="myForm" method="post">

		<div class="container">
		
			<!-- 추가 -->
			<div class="row">
				<div class="col">
					<div class="header_container d-flex flex-row align-items-center justify-content-start">
						<!-- Logo -->
						<div class="logo_container">
							<div class="logo">
							<a href="<%=cp %>/main/main.km">
								<div>KMTOUR</div>
								<div>경미Trips</div>
								<div class="logo_image"><img src="<%=cpPath %>images/logo.png" alt=""></a></div>
							</div>
						</div>

					<div class="dropmenu">
						<!-- Main Navigation -->
						<nav class="main_nav ml-auto">
							<ul class="main_nav_list">
								<li class="main_nav_item"><a href="<%=cp %>/main/main.km">Home</a></li>
								<li class="main_nav_item"><a href="<%=cp %>/not/no_list.km">공지사항</a></li>
								<!-- 추가 -->
								<li class="main_nav_item"><a href="#">상품</a>
									<ul>
										<li style="background-color: #121a2e;"><a href="<%=cp %>/travel/tripboard.km"><p style="color: white;">여행지</p></a></li>
										<li style="background-color: #121a2e;"><a href="goods/goodsboard.km"><p style="color: white;">굿즈(Comming Soon)</p></a></li>
									</ul>
								</li>
								<li class="main_nav_item"><a href="#">Community</a>
									<ul>
										<li style="background-color: #121a2e;"><a href="<%=cp %>/kmtour/comment.km"><p style="color: white;">후기</p></a></li>
										<li style="background-color: #121a2e;"><a href="<%=cp %>/tourImages/list.km"><p style="color: white;">사진</p></a></li>
									</ul>			
								</li>
								<li class="main_nav_item"><a href="<%=cp %>/query/qna.km">Q&A</a></li>
								<!-- 추가 -->
								<c:if test="${sessionScope.CustomInfo.type=='user' }">
									<li class="main_nav_item"><a href="<%=cp %>/carts/c_list.km">장바구니</a></li>
								</c:if>
								<c:if test="${sessionScope.CustomInfo.type=='company' }">
									<%-- <li class="main_nav_item"><a href="<%=cp %>/buyproduct/c_list.km">고객관리</a></li> --%>
								</c:if>
							</ul>
						</nav>
						</div>

						<!-- Search -->
						<div class="search">
							<form action="#" class="search_form">
								<input type="search" name="search_input" class="search_input ctrl_class" required="required" placeholder="Keyword">
								<button type="submit" class="search_button ml-auto ctrl_class"><img src="<%=cpPath %>images/search.png" alt=""></button>
							</form>
						</div>

						<!-- Hamburger -->
						<div class="hamburger ml-auto"><i class="fa fa-bars" aria-hidden="true"></i></div>

					</div>
				</div>
			</div>
			
				<!-- 추가 -->
				<c:choose>
				<c:when test="${empty sessionScope.CustomInfo.id }">
					<div align="right">
					<nav>
					<dl>
					<dd style="width: 50">
					</dd>
					<dd>
					<input type="text" style="width:180px; height:40px;" size="15" name="id" value="아이디" onfocus="this.value=''"/>
					<input type="password" style="width:180px; height:40px;" size="15" value="555555555555555555" name="pw" onfocus="this.value=''"/>
					<input type="button" class="btn btn-danger" id="contact_send_btn" style="width:70px; height:40px;" value="로그인" onclick="login();">
					<input type="submit" class="btn btn-danger" id="contact_send_btn" style="width:85px; height:40px;" value="회원가입" onclick="memJoin();">
					</dd>
					</dl>
					</nav>			
					</div>
				</c:when>
				<c:otherwise>
					<div align="right">
					<nav>
					<dl>
					<dd style="width: 50">
					</dd>
					<dd>
					<p style="color: #FE3C52;">${sessionScope.CustomInfo.id } (${sessionScope.CustomInfo.type }) 로그인&nbsp;
					<input type="button" class="btn btn-danger" size="6" value="로그아웃" onclick="logout();">
					<input type="button" class="btn btn-danger" size="6" value="회원탈퇴" onclick="memDelete();">
					<input type="button" class="btn btn-danger" size="6" value="회원정보" onclick="memInfo();"></p>
					</dd>
					</dl>
					</nav>			
					</div>
				</c:otherwise>
				</c:choose>
		</div>
	
</form>	
	
</body>
</html>