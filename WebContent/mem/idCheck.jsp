<%@page import="com.mem.MemInfoDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8"); 
	String cp=request.getContextPath();
	String checkid=request.getParameter("id");
	Connection conn = DBConn.getConnenction();
	
	MemInfoDAO dao = new MemInfoDAO(conn);
	int c=dao.findID(checkid);
	DBConn.close();
	
	out.println("<script>");
	if(c==1){
		out.println("alert('중복된 아이디')");
		//out.println("location.href='project/member/join.km'");
	}else{
		out.println("alert('사용가능 아이디')");
		//out.println("location.href='project/member/join.km'");
	}
	out.println("window.close()");
	out.println("</script>");
%>
<%-- 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=checkid %>
<%if(c==0){ %>
	사용가능 ID
<%}else{ %>
	중복된 아이디
<%} %>
</body>
</html> --%>