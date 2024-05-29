<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	let p = {'name':'홍길동','age':'20','tel':'010-1111-1111'};
	document.write('이름 : ' + p.name + "<br>");
	document.write('이름 : ' + p.age + "<br>");
	document.write('이름 : ' + p.tel + "<br>");
	
	document.write("<hr>");
	
	//json 1차원 배열
	let p_arr = [{"name":"일길동","age":"30"},{"name":"이길동","age":"40"}];
	
	document.write(p_arr[0].name +"/"+ p_arr[0].age+"<br>");
	document.write(p_arr[1].name +"/"+ p_arr[1].age+"<br>");
	document.write("<hr>");
	
	//json 다차원배열
	let course = {'name':'웹개발',
				  'start' : '2024-05-05',
				  'end' : '2024-07-10',
				  'sub' : ['java','jsp','spring'],
				  'student' : [{'name':'홍길동','age':'20'},{'name':'김길동','age':'30'}]}
	
	document.write("과목명 : " + course.name+"<br>");
	document.write("시작일 : " + course.start+"<br>");
	document.write("종료일 : " + course.end+"<br>");
	//document.write("과목 : " + course.sub+"<br>")
	document.write("과목 : " + course.sub[0]+", "+course.sub[1]+", "+course.sub[2]+"<br>")
	document.write("학생이름 : " + course.student[0].name +"<br>")
	
	
	
	
	
</script>
</head>
<body>

</body>
</html>