<%@page import="com.util.DBConn"%>
<%@page import="com.Trip.TripInfoDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.Trip.TripInfoDAO_before"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	String conti="";
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후기작성하기</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Destino project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="<%=cp %>/project/styles/bootstrap4/bootstrap.min.css">
<link href="<%=cp %>/project/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/project/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/project/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/project/plugins/OwlCarousel2-2.2.1/animate.css">
<link href="<%=cp %>/project/plugins/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/project/styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/project/styles/responsive.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/project/styles/contact_styles.css">
<link rel="stylesheet" href="<%=cp %>/project/styles/tbstyle/style.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp %>/project/styles/tbstyle/created.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp %>/project/styles/tbstyle/list.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp %>/project/styles/tbstyle/mybutton.css" type="text/css"/>

<script src="<%=cp %>/project/js/jquery-3.2.1.min.js"></script>
<script src="<%=cp %>/project/styles/bootstrap4/popper.js"></script>
<script src="<%=cp %>/project/styles/bootstrap4/bootstrap.min.js"></script>
<script src="<%=cp %>/project/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="<%=cp %>/project/plugins/easing/easing.js"></script>
<script src="<%=cp %>/project/plugins/parallax-js-master/parallax.min.js"></script>
<script src="<%=cp %>/project/plugins/magnific-popup/jquery.magnific-popup.min.js"></script>
<script src="<%=cp %>/project/js/custom.js"></script>

<style>

.boxTF { 
	float:left;
	width: 100%;
	height: 40px;
	border: solid 2px #dbdbdb;
	outline: 1px;
	padding-top: 13px;
	padding-left: 0;
}

.center{
	margin: 20%;
	padding:
}

.content_inner{
	position: relative;
	top: 46%;
	left: 20%;
	right: 20%;
	bottom:20%;
	width: 80%;
	text-align: center;
}

.contact_input_message
{
	width: 100%;
	height: 300px;
	border: solid 2px #dbdbdb;
	outline: none;
	padding-top: 13px;
	padding-left: 20px;
}

</style>
 <script type="text/javascript">

 	function sendcomment(){
 		
 		var f=document.myComment;
 		
 		if(!f.subject.value){
 			alert("제목을 입력하세요");
 			f.subject.focus();
 			return;
 		} 		
 	
 		if(!f.content.value){
 			alert("내용을 입력하세요");
 			f.content.focus();
 			return;
 		} 	
 		f.action="<%=cp %>/kmtour/commentwrite_ok.km";
 
 		f.submit();
 		
 	}
 	
 	function categoryChange(e) {
		//var f = document.select;

		<%-- 
		f.action="<%=cp %>/kmtour/commentwrite_title.km";
		f.submit(); --%>
	}
</script>
</head>
<body>

<div class="super_container">
	<header class="header">
	<jsp:include page="header.jsp" />
	</header>

		<br/><br/><br/><br/>
		<br/><br/><br/><br/>
		<div class="offers">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="section_title text-center">
						<h2> 여행 후기 커뮤니티 </h2>
						<div>Find the Adventure of a lifetime</div>
						<br/><p >
						소중한 후기 감사합니다.
						추첨을 통해 경품을 보내드립니다.								
						</p>
					</div>
				</div>
			</div>
		</div>
		</div>
			
	
<div class=content_inner>	
<div class="section">
	<div class="row">
		<div class="col">
			<div class="contact_info" style="width:80%; border: 0px solid; padding-right: 30px;" align="center">		
				<div class="col-lg-5">
					<div class="contact_text"  >					
					
							
				<form action="" name="sel">
					<select style="width:100px; height:40px;" name="conti"  onchange="categoryChange(this)" >
					<option value="">대륙선택</option>	
						
					<c:forEach var="continame" items="${contilists}" >
					
					<option  value="${continame.conti }" >${continame.conti }</option>			  
					</c:forEach>
					
					</select>
				</form>		
					<select style="width:350px; height:40px;" id="title" > 		
					<option>상품선택</option>	
					<c:forEach var="dto" items="${data }" >
					
					<option>[${dto.country}]&nbsp;${dto.title }</option>
					</c:forEach>	
					</select>
					
					
			
	
					</div>
						<br/>
						
						</div>

				<form action="" method="post" name="myComment" id="contact_form" class="clearfix" enctype="multipart/form-data" >
					<div class="col-lg-7">
						<div class="contact_form_container">	
						
						<c:if test="${!empty sessionScope.CustomInfo.id}">			
						<input type="text" id="contact_input_name" class="contact_input contact_input_name"  name="id" value="${sessionScope.CustomInfo.id }" readonly />
						</c:if>
						<c:if test="${empty sessionScope.CustomInfo.id}">			
						<input type="text" id="contact_input_name" class="contact_input contact_input_name"  name="id" value="로그인이 필요합니다." readonly />
						</c:if>
						
					
						<!-- <input type="text" id="contact_input_email" class="contact_input contact_input_email"  name="product" value="도시/상품" onfocus="this.value=''" > -->
						<input type="text" id="contact_input_subject" class="contact_input contact_input_subject" name="subject"  value="제목" onfocus="this.value=''">
						<textarea  id="contact_input_message" class="contact_message_input contact_input_message" name="content" placeholder="내용을 적어주세요." onfocus="this.value=''"></textarea>
						<br/><br/>		
						<input type="file" style="float:left"  value="이미지첨부" name="imageupload" size="100" id="boxTF"/>					 	
						<input type="button" id="contact_send_btn" class="contact_send_btn trans_200" value="Send" onclick="sendcomment();" /> 	
																																
						</div>
					</div>			
				</form>	
							
			</div>
		</div>
	</div>
	
</div>	

</div>
	<br/><br/><br/><br/>	
	<footer class="footer">
		<jsp:include page="footer.jsp" />
	</footer>		
	
</div>
</body>
</html>