<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	로그인을 한 페이지 <br>
	
	<%
		String userid = request.getParameter("id");
		String userPaaspassword = request.getParameter("password");
	%>
	
	<p>아이디 : <%= userid %></p>
	<p>비번 : <%= userPaaspassword %></p>
	
	
</body>
</html>