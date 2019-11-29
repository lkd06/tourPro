<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8"); 
	String cp=request.getContextPath();
	String cpPath=cp+"/project/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>



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
	
	
	
	function goBack(){
		window.close();
	}
	//0930 2030
	function buy(){
		var f = document.myForm;
		f.action="<%=cp %>/carts/buy_ok.km";
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
					<h2><b>결제</b></h2><br>
					<font size="4pt;">
					나라 :  ${dto.title }<br>
					날짜 : ${dto.startdate }~${dto.enddate }<br>
					잔여석 : ${dto.inwon }<br> 
					가격 : ${dto.price * Cdto.c_inwon }<br>
					인원 : ${Cdto.c_inwon }명<br>

					<input type="hidden" name="title" value="${dto.title }"/>
					<input type="hidden" name="count" value="${Cdto.c_inwon }"/>
					<input type="hidden" name="inwon" value="${dto.inwon }"/>
					<input type="hidden" name="id" value="${Cdto.id }"/>
					<input type="hidden" name="c_num" value="${dto.num }"/>
					<input type="hidden" name="num" value="${Cdto.num }"/>
					<input type="hidden" name="price" value="${dto.price * Cdto.c_inwon }"/>
					 &nbsp;&nbsp;
					</font>  
					</div>
				</div>
				<br>
				
				<!-- 버튼 -->
				
				<div class="" style="display: table; width: 32%; padding-rigth:20px; border: 0px solid; color: #c0c0c0;"  align="left">
				<div style="display: table-row;">
				<c:if test="${Cdto.c_inwon<=dto.inwon }">
					<span style="display: table-cell;border: 0px solid;">
					<input type="button" value="결제" id="btn2" onclick="buy();">
					</span>
				</c:if>
				<c:if test="${Cdto.c_inwon>dto.inwon }">
					<span style="display: table-cell;border: 0px solid;">
					<font color="red"><b>결제 불가<br></b></font> 
					</span>
				</c:if>
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