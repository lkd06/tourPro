<%@page import="java.net.URLEncoder"%>
<%@page import="com.qna.*"%>

<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String repageNum = request.getParameter("repageNum");
	
	
	//검색
	String searchKey = request.getParameter("searchKey");
	String searchValue = request.getParameter("searchValue");
	
	String param = "pageNum=" + pageNum;

	if(searchValue!=null) {
		param = param + "&searchKey=" + searchKey;
		param+= "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
	}


	if(repageNum==null ||repageNum.equals("")){
		repageNum="1";
	}
	
	//DBConn.close();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Offers</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Destino project">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
						<form action="#" id="find_form" class="find_form d-flex flex-md-row flex-column align-items-md-center align-items-start justify-content-md-between justify-content-start flex-wrap">
							<input type="text" style="height: 40px; width: 950px;">
							<button class="button find_button">Find</button>
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
							
							<div class="detail_view"><i class="fa fa-bars" aria-hidden="true"></i></div>
						</div>
					</div>
				</div>
			</div>
			
			
			<!-- 본문내용 -->

<br><br>
<form action="" name="myForm" method="post">
<table width="1140" style="border: 1px solid #e6e6e6;">
  <tbody>
    <tr height="50">
      <td colspan="2" style="padding-left: 10px; font-size: 30px;">${dto.getSubject() } </td>
    </tr>
	<tr >
		<td style="padding-left: 10px; border-bottom: 1px solid #e6e6e6;"></td>
		<td style="border-bottom: 1px solid #e6e6e6;"></td>
	</tr>
    <tr>
      <td style="padding-left: 10px; padding-top: 5px; width: 900px;">작성자: ${dto.getId() } </td>
      <td align="right" style="padding-right: 5px; padding-top: 5px;">작성일: ${dto.getCreated() }</td>
    </tr>
    <tr>
      <td colspan="2" style="padding-left: 10px; padding-top: 30px; height: 400px;" valign="top">${dto.getContent() } </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td style="padding-left: 5px; padding-bottom: 5px;"><!-- 댓글수 같은거 넣기 --> </td>
      <td style="padding-left: 5px; padding-bottom: 5px; padding-right: 5px; border-bottom: 1px solid #e6e6e6;" align="right">from : ${dto.getIpAddr() } </td>
    </tr>
    <tr>
    <td></td>
    </tr>
    
   		

  </tbody>
</table>
<br/>



<div align="right">
<c:if test="${sessionScope.CustomInfo.type=='company' }">
<input type="button" value=" 수 정 " class="btn btn-danger" onclick="javascript:location.href='<%=cp%>/query/qnaupdated.km?num=${dto.getNum() }&pageNum=<%=pageNum%>&<%=param %>';"/>
<input type="button" value=" 삭 제 " class="btn btn-danger" onclick="javascript:location.href='<%=cp%>/query/qnadeleted_ok.km?num=${dto.getNum() }&pageNum=<%=pageNum%>';"/>
</c:if>

<c:if test="${sessionScope.CustomInfo.id==dto.id }">
<input type="button" value=" 수 정 " class="btn btn-danger" onclick="javascript:location.href='<%=cp%>/query/qnaupdated.km?num=${dto.getNum() }&pageNum=<%=pageNum%>&<%=param %>';"/>
<input type="button" value=" 삭 제 " class="btn btn-danger" onclick="javascript:location.href='<%=cp%>/query/qnadeleted_ok.km?num=${dto.getNum() }&pageNum=<%=pageNum%>';"/>
</c:if>
<input type="button" value=" 리스트 " class="btn btn-danger" onclick="javascript:location.href='<%=cp%>/query/qna.km?pageNum=<%=pageNum%>&<%=param %>';"/>	

</div>

<br/><br/>


</form>	

<jsp:include page="qnare.jsp?repageNum=<%=repageNum %>"/>
		
			
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


</body>
</html>