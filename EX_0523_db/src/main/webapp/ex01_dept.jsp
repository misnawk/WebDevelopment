<%@page import="VO.DeptVO"%>
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
    	
    	String sql = "select * from dept";

    	//문자열 형태의 sql문을 실제 쿼리문으로 전달
    	PreparedStatement pastmt = conn.prepareStatement(sql); 

    	 //exrcuteQuert() : 전달받은 쿼리문을 실행하여 결과를 반환받는다.
    	 //전달 받은 데이터는 rs객체에 저장됨
    	ResultSet rs = pastmt.executeQuery();
    	
    	 List<DeptVO> dept_list = new ArrayList<>();
    	 
    	 while(rs.next()){
    			DeptVO vo = new DeptVO();
    			
    			// 현재 행의 값을 vo에 담는다.
    			vo.setDeptno(rs.getInt("deptno"));
    			vo.setDname(rs.getString("dname"));
    			vo.setLoc(rs.getString("log"));
    			
    			dept_list.add(vo);
    			
    			out.println(dept_list);
    			
    		}

    		rs.close(); //연결을 끊어준다.
    		pastmt.close();//연결을 끊어준다.
    		conn.close();//연결을 끊어준다. 순서는 거꾸로
    	 
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border = "1">
	<caption>부서목록</caption>
	<tr>
		<th>부서번호</th>
		<th>부서명</th>
		<th>부서위치</th>
	</tr>
	
	<%for(int i = 0; i<dept_list.size();i++){ %>
	<tr>		
		<td><%= dept_list.get(i).getDeptno() %></td>
		<td><%= dept_list.get(i).getDname() %></td>
		<td><%= dept_list.get(i).getLoc() %></td>
	</tr>
	<%} %>
</table>
	
</body>
</html>