<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    	//톰캣이 JNDI를 검색하기 위한 클래스(JNDI기법 : Java naming directory interface)
    	InitialContext ic = new InitialContext();
    	
    	Context ctx = (Context)ic.lookup("java:comp/env");
    
    	// lookup -> 찾는 함수
    	// "java:comp/env" -> 자바에 내장되어있는 리소스 자원을 검색하는 상수(고정)
    	
    	//검색된 Resource를 통해 JNDI의 자원을 검색
    	//Context.xml파일의 resource영역에 참조되어 있는 name 속성값
    	DataSource ds = (DataSource)ctx.lookup("java:comp/env");
    	
    	//위에서 준비해둔 경로로 로그인 시도
    	Connection conn = ds.getConnection();
    	
    	out.println("===디비 접속 성공===");
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>