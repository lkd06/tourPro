<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8"); 
	String cp=request.getContextPath();	
	String cpPath=cp+"/project/";
	
	
	int num = 0;
	int upnum = num+1;
	
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
	
	//var num =0;
	
	function upcount(){

		var f = document.myForm;

		f.action="<%=cp %>/travel/purchase_up.km";
		f.submit();
	}
	
	function downcount(){

		var f = document.myForm;
		
		f.action="<%=cp %>/travel/purchase_down.km";
		f.submit();
	}
	
	function goBack(){
	    window.close();
	}
	
	function re(){
		var f = document.myForm;
		
		f.action="<%=cp %>/travel/purchase_ok.km";
		f.submit();
		opener.location.href='<%=cp %>/carts/c_list.km';

		
		
		window.close();
		
	}
	
</script>

<style type="text/css">

#div1 {
   width: 400px;
   height: 50px;
   border: 1px solid #c0c0c0;
   border-radius: 10px;
   font-size : 10pt;
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
<body style="padding-bottom: 80px;">
<div class="super_container">
<div class=""> 
		<form action="" name="myForm">
		<div class="" align="center"  style="width: 500; height: 50; padding-top: 20px;">
			<div class="">

				<div class="" style="display: table; width:100%; padding-left:80px; border: 0px solid; color: #c0c0c0; ">
					<!-- 여기에 회원 가입 입력 -->
					<div style="color: #000000;"  align="left">
					<h2><b>담아두기</b></h2><br>
					<font size="4pt;">
					나라 :  ${dto.title }<br>
					날짜 : ${dto.startdate }~${dto.enddate }<br>
					잔여석 : ${dto.inwon }<br> 
					가격 : ${dto.price * count }<br>
					인원 :${count }명

					<input type="hidden" name="title" value="${dto.title }"/>
					<input type="hidden" name="count" value="${count }"/>
					<input type="hidden" name="id" value="${id }"/>
					<input type="hidden" name="num" value="${num }"/>
					<input type="hidden" name="price" value="${dto.price * count }"/>
					 &nbsp;&nbsp;
					<input type="submit" name="up" value="▲"  onclick="upcount();"/>
					<input type="submit" name="down" value="▼" onclick="downcount();"/><br>
					<font color="red"><b>${message }<br></b></font> 
					</font>  
					</div>
				</div>
				<br>
				
				<!-- 버튼 -->
				
				<div class="" style="display: table; width: 32%; padding-rigth:20px; border: 0px solid; color: #c0c0c0;"  align="left">
				<div style="display: table-row;">
					<span style="display: table-cell;border: 0px solid;">
					<input type="button" value="신청하기" id="btn2" onclick="re();">
					</span>
					 &nbsp;&nbsp;&nbsp;
					<span style="display: table-cell;border: 0px solid;">
						<input type="button" value="취소" id="btn2" onclick="goBack();"> 
					</span>
					
				</div>
				
				</div>
				
				
			</div>
		</div>
		</form>
	</div>
</div>
</body>
</html>