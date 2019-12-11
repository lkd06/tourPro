<%@page import="com.mem.CustomInfo"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	String replypageNum = request.getParameter("replypageNum");
	if(replypageNum==null ||replypageNum.equals("")){
		replypageNum="1";
	}
	CustomInfo cinfo = (CustomInfo)session.getAttribute("cinfo");
	int no = Integer.parseInt(request.getParameter("no"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후기 게시물 </title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Destino project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="<%=cp %>/project/styles/bootstrap4/bootstrap.min.css">
<link href="<%=cp %>/project/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/project/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/project/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/project/plugins/OwlCarousel2-2.2.1/animate.css">
<link href="plugins/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/project/styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/project/styles/responsive.css">
<link rel="stylesheet" href="<%=cp %>/project/styles/tbstyle/style.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp %>/project/styles/tbstyle/created.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp %>/project/styles/tbstyle/list.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp %>/project/styles/tbstyle/mybutton.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp %>/project/styles/tbstyle/article.css" type="text/css"/>
<script src="<%=cp %>/project/js/jquery-3.2.1.min.js"></script>
<script src="<%=cp %>/project/styles/bootstrap4/popper.js"></script>
<script src="<%=cp %>/project/styles/bootstrap4/bootstrap.min.js"></script>
<script src="<%=cp %>/project/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="<%=cp %>/project/plugins/easing/easing.js"></script>
<script src="<%=cp %>/project/plugins/parallax-js-master/parallax.min.js"></script>
<script src="<%=cp %>/project/plugins/magnific-popup/jquery.magnific-popup.min.js"></script>
<script src="<%=cp %>/project/js/custom.js"></script>

<!--# id .class ..class가 더 큰 개념  -->
<style>

#table {display: table; }
.row {display: table-row;}
.cell {display: table-cell; padding: 3px;}/* border-bottom: 1px solid #DDD;  */
.col1 {width: 40%; text-align:left}
.col2 {width: 60%; text-align:center}

.col3 {width: 40%;}
.col4 {width: 60%;}


.bbsArticle_bottomLine {
	height:35px;
	line-height:25px;
	border-bottom:1px solid #DBDBDB;
	clear:both;
	text-align:left;
}


#article{/*offers  */

    float: right;
    position: relative;
    left: -50%;

	/* width:80%;
	padding-bottom: 114px; */
}

#image container{
float:left;
width:50%;
}

#text container{
float:left;
width:50%;
}

.article_input_no
{
	width: 20%;
	height: 41px;
	border: solid 2px #dbdbdb;
	padding-left: 20px;
	margin-bottom: 19px;
	outline: none;
}

</style>

<script type="text/javascript">


		function addcount(){
			 		
		var f = document.updateCount;
		alert("추천 되었습니다.");
		
		f.action="<%=cp%>/kmtour/updatecount_ok.km";
		f.submit();

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
		
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="section_title text-center">
						<h2> 여행 후기 커뮤니티 </h2>
						<div>Find the Adventure of a lifetime</div>
					</div>
				</div>
			</div>
	
			<br/><br/><br/>
			
			
				<table width="1140" height="400" style="border: 1px solid #E1E1E1;">
					  <tbody>
					    <tr height="50">
					      <td style="padding-left: 10px; border-bottom: 1px solid #E1E1E1;">No.${dto.no }</td>
					      <td colspan="2" align="center" style="border-bottom: 1px solid #E1E1E1;">${dto.product }</td>
					    </tr>
						<tr>
					      <td colspan="2" rowspan="2" style="padding-left: 5px; border-bottom: 1px solid #E1E1E1;">제목: ${dto.subject } </td>
					      <td height="25">아이디: ${dto.id}</td>
					    </tr>
					    <tr>
					      <td height="25" style="border-bottom: 1px solid #E1E1E1;">작성일: ${dto.created } </td>
					   </tr>
					    <tr>
					      <td colspan="3" style="height: 100%;">
					      <!-- 만약에 사진 있으면 사진 들어갈곳 나중에 기능 넣기  -->
					       <c:if test="${!empty dto.imagefilename }">   
							<img src="${imagePath}/${dto.imagefilename}" width="180" height="180" />
						   </c:if>
					  </td>
					    </tr>
					    <tr>
					      <td colspan="3" valign="top"  style="padding-left: 5px; word-break:break-all; height: 500px;">${dto.content }</td>
					    </tr>    
					    <tr height="40">
					      <td style="padding-left: 5px;"></td>
					      <td colspan="2" align="right" style="padding-right: 10px;">	
						</td>
					    </tr>
					   
						<tr height="0">
					      <td col style="width: 30%">&nbsp;</td>
					      <td col style="width: 40%">&nbsp;</td>
					      <td col style="width: 30%">&nbsp;</td>
					    </tr>
					  </tbody>
				</table>
		
				<br/>
			
				<form action="" name="updateCount">
					<table width="1140">
						<tr>
							<td align="left" style="padding-left: 5px;">
								<input type="hidden" name="no" value="${dto.no}"/>
								<input type="button" class="btn btn-danger" value="추천 " onclick="addcount();"/>
							</td>
							<td align="right" style="padding-right: 5px;">
							<input type="hidden" name="no" value="${dto.no}"/>
								<input type="button" value=" 돌아가기 " class="btn btn-danger" onclick="javascript:location.href='<%=cp%>/kmtour/comment.km?${params}'"/>
								<c:if test="${sessionScope.CustomInfo.id==dto.id}">
									<input type="button" value=" 수정 " class="btn btn-danger" onclick="javascript:location.href='<%=cp%>/kmtour/commentupdate.km?no=${dto.no }&${params}'"/>
									<input type="button" value=" 삭제 " class="btn btn-danger" onclick="javascript:location.href='<%=cp%>/kmtour/commentdelete.km?no=${dto.no }&${params}'" />
								</c:if>
							</td>
						</tr>
					</table>
				</form>
		
		
	<br/>
			
	<jsp:include page="reply.jsp?replypageNum=<%=replypageNum %>"/>
	</div>

	<br/><br/><br/><br/>

	<footer class="footer">
		<jsp:include page="footer.jsp" />
	</footer>
	
</div>


</body>
</html>