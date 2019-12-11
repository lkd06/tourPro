<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String pageNum=  (String)request.getAttribute("pageNum");
	int no = (int)request.getAttribute("no");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물수정하기</title>
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
 	function sendupdate(){
 		
 		var f=document.myUpdate;
 		if(!f.subject.value){
 			alert("제목을 입력하세요");
 			f.subject.focus();
 			return;
 		} 		
 		/* alert(f.no.value); */
 		if(!f.content.value){
 			alert("내용을 입력하세요");
 			f.content.focus();
 			return;
 		} 	
 		
 		f.action="<%=cp %>/kmtour/commentupdate_ok.km?no="+<%=no%>+"&pageNum="+<%=pageNum%>;
 
 		f.submit();
 		
 	}
 	
 	function showselect(obj){
 		
 		var f=document.forms.select;
 		
 		if(obj == "asia"){ 	
 			
 			document.getElementById("city1").style.display = "block";
 	        document.getElementById("city1").disabled = false;
 	        document.getElementById("city2").style.display = "none";
 	        document.getElementById("city2").disabled = true;
			
 		}else if(obj=="europe"){
 			
 			document.getElementById("city2").style.display = "block";
 	        document.getElementById("city2").disabled = false;
 	        document.getElementById("city1").style.display = "none";
 	        document.getElementById("city1").disabled = true;

 		}

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
					
						<form action="" name="select"  >
						
						<select name="product" style="height:40px; float:left; width:100px" onChange="showselect(this.value);">
						<option value="" >대륙선택</option>
						<option value="asia" >아시아 </option>
						<option value="europe">유럽</option>
						<option value="america" >남/북미</option>
						</select>
						
						<select name="city" id="city1" style="height:40px; width:100px; float:left; " style="display:;" >
						<option value="" selected>나라선택 </option>
						<option value="nepal">네팔</option>
						<option value="china">중국</option>
						<option value="tailand">태국</option>
						</select>
						
						<select name="city" id="city2" style="height:40px;width:100px; float:left;" style="display:;">
						<option value="" selected>나라선택 </option>
						<option value="spain">스페인</option>
						<option value="italy">이탈리아</option>
						<option value="germany">독일</option>
						</select>
						
					<!-- 	<select name="city" id="city3" style="height:40px;width:100px; float:left;" style="display:;">
						<option value="" selected>나라선택 </option>
						<option value="usa">미국</option>
						<option value="canada">캐나다</option>
						<option value="brazil">브라질</option>
						</select>
						 -->
						</form>
						</div>
						<br/><br/><br/>
						<p style="float:left">
						소중한 후기 감사합니다.
						추첨을 통해 경품을 보내드립니다.								
						</p>
						</div>
				<form action="" method="post" name="myUpdate" id="contact_form" class="clearfix" enctype="multipart/form-data" >
					<div class="col-lg-7">
						<div class="contact_form_container">	
						
						<input type="text" id="contact_input_name" class="contact_input contact_input_name"  name="no" value="${dto.no }"" />			
						<input type="text" id="contact_input_name" class="contact_input contact_input_name"  name="id" value="${dto.id }" />
						<input type="text" id="contact_input_email" class="contact_input contact_input_email"  name="product" value="${dto.product }" onfocus="this.value=''" />
						<input type="text" id="contact_input_subject" class="contact_input contact_input_subject" name="subject"  value="${dto.subject }" onfocus="this.value=''" />
						<textarea  id="contact_input_message" class="contact_message_input contact_input_message" name="content" placeholder="${dto.content }" onfocus="this.value=''"></textarea>
						<br/><br/>		
						<input type="file" style="float:left"  value="${dto.imagefilename }" name="imageupload" size="100" id="boxTF"/>					 	
					
							
						<input type="hidden" name="no" value="${dto.no}" /> 
						<input type="hidden" name="pageNum" value="<%=pageNum %>" />
						<input type="hidden" name="searchKey" value="${searchKey}" />
						<input type="hidden" name="searchValue" value="${searchValue}" />
						<input type="button" id="contact_send_btn" class="contact_send_btn trans_200" value="수정하기" onclick="sendupdate();" /> 	
																																
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