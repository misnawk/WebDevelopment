<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%request.setCharacterEncoding("utf-8"); %>
	
	<%
		String userid = request.getParameter("id");
		out.print(userid);
		String password = request.getParameter("password");
		out.print(password);
		if(userid.equals("관리자") && password.equals("1234")){
			response.sendRedirect("response01_success.jsp");
		}else{
			response.sendRedirect("response01_faild.jsp");
		}
	%>
	
</body>
</html>