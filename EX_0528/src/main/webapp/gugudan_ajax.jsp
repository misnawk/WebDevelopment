<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	int dan = Integer.parseInt(request. getParameter("dan"));
    	
    	String str = "";
    
    	for(int i = 1; i<9; i++){
    		str +=dan +"*" + i + "=" +(dan*i)+"<br>";
    	} 
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%=str %>
</body>
</html>