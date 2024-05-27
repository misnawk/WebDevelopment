<%@page import="vo.MemberVO"%>
<%@page import="java.lang.reflect.Member"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
      
      
 <%
 	request.setCharacterEncoding("utf-8");
 
 	String name = request.getParameter("name");
 	String id = request.getParameter("id");
 	String pwd = request.getParameter("pwd");
 	String email = request.getParameter("email");
 
 
 	MemberVO vo = new MemberVO();
 	vo.setName(name);
 	vo.setId(id);
 	vo.setPwd(pwd);
 	vo.setEmail(email);
 	
 	
 	MemberDAO dao = MemberDAO.getInstance();
 	int res = dao.insert(vo);
 
 	if(res>=1){
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