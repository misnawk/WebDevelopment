<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- 필수선언 -->
    
    <%
    	int n = 10;
    	request.setAttribute("n",n);
    	
    	List<String> array = new ArrayList<>();
    	array.add("서울");
    	array.add("대전");
    	array.add("대구");
    	
    	request.setAttribute("array",array);
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- JSTL
프로그래밍 언어에서 제공하는 변수 선언, 조건문, 반복문 등의 로직을 태그로 구사할 수 있게 해주는 라이브러리 입니다. -->


<c:set var="num" value="100"/>
<!-- set을 이용해 선언한 변수는 pageContext영역에 세팅이 되서 el표현식으로 사용할 수 있다. -->
${num}

<c:if test="${n eq 10 }">
참
</c:if>

<!-- choose영역 내부에 주석 절대 금지 -->
<c:choose>

	<c:when test = "${param.msg eq 10 }"> 나는 10이다. </c:when>
	<c:when test = "${param.msg ne 11 }"> 나는 10이 아니다. </c:when>
	<c:otherwise>모두 아니다.</c:otherwise>
</c:choose>


<hr>

<!-- var : 값을 담을 변수 
	begin : 시작값
	end : 종료값
	step : 증가량 -->
<c:forEach var="i" begin="1" end="5" step="1">
	<c:if test="${i mod 2 eq 1}">
		<font color = "red">안녕(${i})</font>
	</c:if>
</c:forEach>

<hr>

<!-- for(String s:array){
		println(s);
	} -->
	
<c:forEach var="s" items="${array}" varStatus="cnt" >
	${cnt.count}/${s} --- ${cnt.index} / ${s} <br>
</c:forEach>




</body>
</html>