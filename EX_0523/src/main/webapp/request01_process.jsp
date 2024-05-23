<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	로그인을 한 페이지 <br>
	
	<%	request.setCharacterEncoding("utf-8");
	
		String userid = request.getParameter("id");
		String password = request.getParameter("password");

	
	if(userid.equals("관리자") && password.equals("1234")){
	
		response.sendRedirect("response01_success.jsp");
	}else{
		response.sendRedirect("response01_Failed.jsp");
	}
	%>
	<p>아이디 : <%= userid %></p>
	<p>비밀번호 : <%= password %></p>

	
</body>
</html>