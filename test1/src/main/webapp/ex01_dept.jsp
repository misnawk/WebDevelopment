<%@page import="vo.DeptVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    	InitialContext ic = new InitialContext();
    	Context ctx = (Context)ic.lookup("java:comp/env");
    	
    	DataSource ds = (DataSource)ctx.lookup("jdbc/oracle_test");
    	
    	Connection conn = ds.getConnection();
    	
    	
    	String sql = "select * from dept";
    	
    	// 문자열 형태의 sql문을 실제 쿼리문으로 전달
    	PreparedStatement pstmt = conn.prepareStatement(sql);
    	
    	//쿼리문을 실행하여 결과를 반환받는다. 
    	ResultSet rs = pstmt.executeQuery();
    	
    	
    	out.println("---디비 접속 성공---");
    	
    	List<DeptVO> dept_list = new ArrayList<>();
    	
    	while(rs.next()){
    		DeptVO vo = new DeptVO();
    		
    		//현재 행의 값을 vo에 담는다.
    		vo.setDeptno(rs.getInt("deptno"));
    		vo.setDname(rs.getString("dname"));
    		vo.setLoc(rs.getString("loc"));
    		
    		dept_list.add(vo); //객체에 담아놓고 리스트에 저장시킨다.
    	}
    	
    	rs.close();
    	pstmt.close();
    	conn.close();
    	
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table border="1">
		<caption>부서목록</caption>
		<tr>
			<th>부서번호</th>
			<th>부서명</th>
			<th>부서위치</th>
		</tr>
		
		<%for(int i=0; i<dept_list.size(); i++){ %>
		<tr>
			<td><%=dept_list.get(i).getDeptno() %></td>
			<td><%=dept_list.get(i).getDname() %></td>
			<td><%=dept_list.get(i).getLoc() %></td>
		</tr>
		<%}%>
	</table>


</body>
</html>