<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String senderName= request.getParameter("senderName");
	String senderEmail= request.getParameter("senderEmail");
	String receiverEmail= request.getParameter("receiverEmail");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	String host = "localhost";
	
	//환경설정을 받아옴
	Properties prop= System.getProperties();
	//메일의 세션임
	Session ssn = Session.getInstance(prop,null); //null 은 인증임,, 리눅스 등의 환경에서 인증이 필요하지만 지금 여기서는 필요 x
	
	try{
		
		MimeMessage message =  new MimeMessage(ssn); //다섯개의 정보를 모두 message에 담음
		
		message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiverEmail));
		
		message.setFrom(new InternetAddress(senderEmail,senderName,"UTF-8"));
		
		message.setSubject(subject,"UTF-8");
		
		message.setContent(content,"text/plain;charset=UTF-8"); //html방식으로 전송시에 plain 을 html 이라고 씀
		
		
		//보내기
		Transport tp = ssn.getTransport("smtp");
		tp.connect(host, "", "");
		tp.sendMessage(message, message.getAllRecipients());
		tp.close();
		
		out.print("메일 전송 완료");
		
		
	}catch(Exception e){
		System.out.println(e.toString());
		System.out.println("전송 실패");
	}
	
	response.sendRedirect("contact.jsp");
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>