<%@page import="com.qna.ReDAO"%>
<%@page import="com.qna.ReDTO"%>
<%@page import="com.util.MyUtil"%>
<%@page import="com.project.*"%>

<%@page import="java.util.List"%>
<%@page import="com.util.DBConn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
 	String cp1 = request.getContextPath(); 
	
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	ReDTO replydto =(ReDTO) request.getAttribute("replydto"); 
					
	String RepageNum = request.getParameter("repageNum") ;
	
	ReDAO replydao = new ReDAO(DBConn.getConnenction());
 	
 	MyUtil myutil = new MyUtil();
 		
 	//댓글 페이징
 	int replytotalcount = replydao.getReplyCount(num);//해당 게시물 댓글 수 세기
   
	int ReplynumPerPage = 6; //보여줄 댓글 수 
 	int ReplytotalPage = myutil.getPageCount(ReplynumPerPage,replytotalcount); //댓글 전체 페이지
  	
 	int currentReplyPage = 1;
 	
 	if (RepageNum != null) {/* sss여기서 1로만 넘어감 오류!! */
 		currentReplyPage = Integer.parseInt(RepageNum);
	}else
		RepageNum="1";

 	if(currentReplyPage > ReplytotalPage)
 		currentReplyPage=ReplytotalPage;
 
	int start = (currentReplyPage-1)*ReplynumPerPage +1;
	int end = currentReplyPage*ReplynumPerPage;
 	
 	List<ReDTO> replylists = replydao.getReplyList(start,end,num); /* //해당 게시물에 댓글 불러오기 */ 
 /* 	List<ReplyDTO> replylists = replydao.getReplyList(); */
 	 //페이지 처리
 	String replyUrl = "qnaarticle.km?pageNum="+pageNum+"&num="+num;
 	
 	String replyPageIndexList = myutil.ReplypageIndexList(currentReplyPage, ReplytotalPage, replyUrl);
 			//MyUtil.ReplypageIndexList(currentReplyPage, ReplytotalPage, replyUrl);//myutil.ReplypageIndexList(currentReplyPage,ReplytotalPage,replyUrl);
 	
 	
 	DBConn.close();
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Q&A 댓글</title>
<style>

.reply_input_message
{
	width: %;
	height: 50px;
	border: solid 2px #dbdbdb;
	outline: none;
	padding-top: 13px;
	padding-left: 20px;
}

.reply_button
{
	width: 3.248%;
	height: 23px;
	font-size: 16px;
	font-weight: 300;
	
	color: red;
	/* line-height: 42px; */
	padding-left: 10px;
	padding-right: 10px;


	background: #fe435b !important;
	-webkit-transform: translateY(14px);
	-moz-transform: translateY(14px);
	-ms-transform: translateY(14px);
	-o-transform: translateY(14px);
	transform: translateY(14px);
	border: none;
	outline: none;
	cursor: pointer;
	
}

.button
{
	display: inline-block;
	width: 161px;
	height: 56px;
	background: #131a2f;
}

</style>

<script type="text/javascript">

 function sendreply(){
 		
 		var f=document.myReply;
 		
 		if(!f.content.value){
 			alert("내용을 입력하세요");
 			f.content.focus();
 			return;
 		} 		
 		
 		f.action = "<%=cp1%>/query/qnare_ok.km";  
 		f.submit();
 		
 	}  
 	
</script>	
</head>
<body>
<form action="" name="myReply" method="post">
<table width="1140" border="0">
  <tbody>
    <tr>
      <td>&nbsp;</td>
      <td col style="width: 10%">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2"><font color="#0054FF"><b>아이디: ${sessionScope.CustomInfo.id }</b></font></td>

    </tr>
    <tr>
      <td>
		<input type="text" id="contact_input_name" class="contact_input contact_input_name" style="width:100%; height:70px; padding-left: 10px"  name="content" value="내용을 입력해주세요." onfocus="this.value=''"> 
      </td>
      <td style="padding-left: 10px;">
      	<input type="hidden" name="num" value="<%=num %>" /> 
      	<input type="hidden" name="id" value="${sessionScope.CustomInfo.id }" /> 
	      <c:if test="${sessionScope.CustomInfo.type=='company' }">
			<input type="button" class="btn btn-danger" id="contact_send_btn" type="submit" id="reply_button" value="등록" onclick="sendreply();" style="width: 80px;">
		  </c:if>
	  </td>
    </tr>
    <tr>
      <td colspan="2" style="height: 50px"><b>전체 댓글수: <%=replytotalcount %> 개</b></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr style="height: 1px;" bgcolor="#000000">
      <td></td><td></td>
    </tr>

    
    <%if(replylists.size()!=0) { %>
	<%for(ReDTO dto : replylists) { %>
    <tr>
      <td colspan="2" style="height: 20px; padding-top: 10px;"><font color="#0054FF"><b>아이디: <%=dto.getId() %> </b></font>작성일: <%=dto.getCreated() %></td>
    </tr>
    <tr style="height: 50px; padding-top: 5px;">
      <td colspan="2" style="font-size: 15px; padding-left: 20px;"><%=dto.getContent() %></td>
	</tr>
    <tr style="height: 1px;" bgcolor="#999999">
      <td></td><td></td>
    </tr>
    <%} }  %>
  </tbody>
</table>
</form>
<div align="center">
	<p>
    <%
							if (replytotalcount != 0) {
						%>
						<%=replyPageIndexList%>
						<%
							} else {
						%>
						등록된 댓글이 없습니다.
						<%
							}
						%>
	</p>
</div>


</body>
</html>