<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	String ch = request.getParameter("ch");
	String id = request.getParameter("id");
	String cpPath=cp+"/project/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니</title>

<meta charset="utf-8">


<link rel="stylesheet" type="text/css" href="<%=cp %>/project/styles/bootstrap4/bootstrap.min.css">
<link href="<%=cp %>/project/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/project/styles/offers_styles.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/project/styles/offers_responsive.css">

<script type="text/javascript">
function purchase(id,num,c_num){
	var f = document.apply;
	var url ="<%=cp %>/carts/buy.km?id="+id+"&num="+num+"&c_num="+c_num;
	var name="id";
	var option= "width = 500, height = 500, top = 100, left = 200, location = no"
    window.open(url, name, option);
}

</script>
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
						<li class="menu_item menu_mm"><a href="<%=cp %>/kmtour/c_list.km">장바구니</a></li>
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

	<div class="">
		<div class="special_content" align="center" style="width: 500; height: 1200px;">
			<div class="">
				<div class="" style="display: table; width: 33%;border: 0px solid; color: #fe534b;"  align="center">
					<div style="color: #000000;"  align="left" >
						<h2><b>장바구니</b></h2>
					</div>
					
					<br><br>
					
					<!-- 장바구니 list -->
					<form action="" name="apply" method="post">
					<table align="center" width="1200">
					    <tr align="center" height="50" valign="middle" bgcolor="#e6e6e6">
					      <th scope="c_num" width="200">상품번호</th>
					      <th scope="c_name" width="400">상&nbsp;품&nbsp;명</th>
					      <th scope="c_price" width="200">가&nbsp;&nbsp;격</th>
					      <th scope="c_inwon" width="100">수&nbsp;&nbsp;량</th>
					      <th width="100">결제</th>
					     <!--  <th width="100">수정하기</th> -->
					      <th width="100">삭제하기</th>
					      
					    </tr>
					    
						<tr cols bgcolor="e7e7e7" height="2">
							<th colspan="7"></th>
						</tr>
						
						<c:forEach var="dto" items="${lists }">
							
							<tr align="center" height="70" valign="middle" >
							    <td>${dto.c_num }</td>
							    <td><a href="<%=cp %>/carts/article.km?c_num=${dto.c_num }">
							    ${dto.c_name }</a></td>
							    <td>${dto.c_price }</td>
							    <td>${dto.c_inwon }</td>
							    <td>
								<c:if test="${dto.c_check=='no' }">  
							    <a href="javascript:void(0);" onclick="purchase(${dto.id },${dto.num },${dto.c_num });">결제하기</a>
							    </c:if>
							    <c:if test="${dto.c_check=='yes' }">  
							    <a>결제완료</a>
							    </c:if>
							    </td>
							    
								<c:if test="${dto.c_check=='no' }"> 
							    <td><a href="<%=cp %>/carts/delete_ok.km?num=${dto.num }">삭제하기</a></td>
							    </c:if>
						    </tr>
						   
							<tr cols bgcolor="e7e7e7" height="2">
								<th colspan="7"></th>
							</tr>
							
						</c:forEach>
						
						<tr cols bgcolor="e7e7e7" height="5">
							<th colspan="7"></th>
						</tr>
					</table>
 					</form>
				</div>
			</div>
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
							Copyright
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