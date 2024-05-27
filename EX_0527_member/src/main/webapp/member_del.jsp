<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    request.setCharacterEncoding("utf-8");
    //파라미터로 받은 모든 데이터는 문자열이다.
    //정수로 바꿔줘야 한다.
    int idx = Integer.parseInt( request.getParameter("idx"));
    
    //idx에 해당하는 유저를 DB에서 삭제
    int res = MemberDAO.getInstance().delete(idx);
    
    if(res >=1){
    	response.sendRedirect("Member_list.jsp");
    }
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