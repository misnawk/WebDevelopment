<%@page import="java.util.Date"%>
<%@page import="vo.PersonVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- 필수선언 -->
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- 포맷관련 라이브러리 -->
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
    <%
    	List<PersonVO> list = new ArrayList<>();
    	list.add(new PersonVO("홍길동",20));
    	list.add(new PersonVO("받길동",30));
    	request.setAttribute("list",list);
    	
    	int money = 1200000000;
    	Date today = new Date();
    	
    	request.setAttribute("money",money);
    	request.setAttribute("today",today);
    	
    	String str = "Kim Mal Ddomg";
    	request.setAttribute("str",str);
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:forEach var="vo" items="${list}">
		${vo.name} / ${vo.age} <br>
	</c:forEach>
	
	<hr>
	&#8361;<fmt:formatNumber value = "${money}"/>
	<fmt:formatDate value = "${today}"/>
	<fmt:formatDate value = "${today}" pattern="yy년 MM월 dd일"/><br>
	
	<!-- MM : 월
		 DD : 1월 1일부터 현재까지 일수
		 dd : 현재 달의 일
		 mm : 분
	 -->
	 
	 <br>
	 <!-- fn은 단독으로 쓸 수 없고 el 표현식과 같이 사용해야 한다. -->
	 문자열의 길이 : ${fn:length(str)}<br>
	 글자의 인덱스값 반환 : ${fn:indexOf(str,"Mal") } <br>
	 문자열 자르기 : ${fn:split(str,"")[0]}
</body>
</html>