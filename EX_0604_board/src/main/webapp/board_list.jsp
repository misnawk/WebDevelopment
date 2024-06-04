<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" width="700">
		<tr>
			<td><img src="title_04.gif"></td>	
		</tr>
		
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:forEach var = "vo" items="${list}">
			<tr>
				<td>${vo.idx}</td>
				<td>${vo.subject}</td>
				<td>${vo.name}</td>
				<td>${vo.regdate}</td>
				<td>${vo.readhit}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>