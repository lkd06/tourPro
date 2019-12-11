<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>

<script type="text/javascript">
	
	function sendIt(){
		
		f = document.myForm;
		
		str = f.subject.value;
		str = str.trim();
		if(!str){
			alert("\n제목을 입력하세요.");
			f.subject.focus();
			return;
		}
		f.subject.value = str;
		
		str = f.content.value;
		str = str.trim();
		if(!str){
			alert("\n내용을 입력하세요.");
			f.contet.focus();
			return;
		}
		f.content.value = str;
		
		f.action = "<%=cp %>/kmtour/no_create_ok.km";
		f.submit();
	}
	
</script>

</head>
<body>


<div>
	<form action="" name="myForm" method="post">
		<div>
			<div>
				<dl>
					<dt>제&nbsp;&nbsp;&nbsp;&nbsp;목</dt>
					<dd>
						<input type="text" name="subject" size="62"
								maxlength="100" class="boxTF">
					</dd>
				</dl>
			</div>
			
			<div>
				<dl>
					<dt>내&nbsp;&nbsp;&nbsp;&nbsp;용</dt>
					<dd>
						<textArea rows="12" cols="63" name="content"
								class="boxTA"></textArea>
					</dd>
				</dl>
			</div>
			
			<div>
				<dl>
					<dt>공지상단고정</dt>
					<dd>
						<input type="text" name="noti">&nbsp;[y/n]
					</dd>
				</dl>
			</div>
			
		</div>
		
		<div>
			<input type="button" value="등록하기" class="btn2" 
					onclick="sendIt()">&nbsp;
			<input type="reset" value="다시입력" class="btn2" 
					onclick="document.myForm.subject.focus();">&nbsp;
			<input type="button" value="등록취소" class="btn2" 
					onclick="javascript:location.href='<%=cp %>/kmtour/no_list.km';">
		</div>
	</form>
</div>



</body>
</html>