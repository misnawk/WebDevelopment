<%@page import="java.util.ArrayList"%>
<%@page import="vo.PersonVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    	//EL 표기법을 통해 출력가능한 여러가지 방법들
    	Map<String,Integer> map = new HashMap<>();
    	map.put("key1",100);
    	map.put("key2",200);
    	map.put("key3",300);
    	map.put("key4",400);
    	
    	request.setAttribute("myMap",map);
    	
    	//ArrayList객체
    	List<PersonVO> list = new ArrayList<>(); 
    	list.add(new PersonVO("홍길동",30));
    	list.add(new PersonVO("홍길동",40));
    	
    	request.setAttribute("list",list);
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${myMap.get("key1")} <br>
	${myMap['key2']}<br>
	${myMap.key3} <br>
	
	<hr>
	list에 담긴 데이터 가져오기<br>
	${list[0].name}/${list[0].age}<br>
	${list[1].name}/${list[1].age}<br>
	
	
	
</body>
</html>