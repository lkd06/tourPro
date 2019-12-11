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
		<c:choose>
		<c:when test="${empty sessionScope.CustomInfo.id }">
			<div align="right">
			<nav>
			<dl>
			<dd>
			<input type="text" size="15" name="id"/>
			
			<input type="text" size="15" name="pw"/>
			
			<input type="button" size="6" value="로그인" onclick="login();">
			<input type="submit" size="6" value="회원가입" onclick="memJoin();">
			</dd>
			</dl>
			</nav>			
			</div>
		</c:when>
		<c:otherwise>
			<div align="right">
			<nav>
			<dl>
			<dd>
			${sessionScope.CustomInfo.id } 로그인
			</dd>
			<dd>
			<input type="button" size="6" value="로그아웃" onclick="logout();">
			<input type="button" size="6" value="회원탈퇴" onclick="memDelete();">
			<input type="button" size="6" value="회원정보" onclick="memInfo();">
			</dd>
			</dl>
			</nav>			
			</div>
		</c:otherwise>
		</c:choose>
			<!-- 추가 -->
			<div class="row">
				<div class="col">
					<div class="header_container d-flex flex-row align-items-center justify-content-start">
						<!-- Logo -->
						<div class="logo_container">
							<div class="logo">
								<div>destino</div>
								<div>travel agency</div>
								<div class="logo_image"><img src="<%=cpPath %>images/logo.png" alt=""></div>
							</div>
						</div>

					<div class="dropmenu">
						<!-- Main Navigation -->
						<nav class="main_nav ml-auto">
							<ul class="main_nav_list">
								<li class="main_nav_item active"><a href="#">Home</a></li>
								<li class="main_nav_item"><a href="<%=cpPath %>about.html">About us</a></li>
								<!-- 추가 -->
								<li class="main_nav_item"><a href="<%=cpPath %>about.html">상품</a>
									<ul>
										<li><a href="travel/tripboard.km"><p style="color: black;">여행지</p></a></li>
										<li><a href="goods/goodsboard.km"><p style="color: black;">굿즈(Comming Soon)</p></a></li>
									</ul>
								</li>
								<!-- 추가 -->
								<li class="main_nav_item"><a href="<%=cpPath %>offers.html">Offers</a></li>
								<li class="main_nav_item"><a href="<%=cpPath %>news.html">News</a></li>
								<li class="main_nav_item"><a href="<%=cpPath %>contact.html">Contact</a></li>
								<li class="main_nav_item"><a href="<%=cpPath %>community.jsp">Community</a>
									<ul>
										<li><a href="comment.jsp"></a>후기</li>
									</ul>			
								</li>
								
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
		</div>
	
</form>	
	
</body>
</html>