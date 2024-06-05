<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	input{border:none;}
</style>
<script type="text/javascript">
	//게시글 추가하기
	//서블릿 : BoardInsertAction
	//매핑 : insert.do
	//빈칸으로 비워두면 경고창 띄우고 못넘어가게 하기
	//작성자의 IP받는법 request.getRemoteAdr(); 문자열 형태로받는다.
	function send_check() {
		let f = document.f; /* f를 가진 부모 검색 */
		
		
		//입력란 검증
		if(f.subject.value.trim()===''){
			alert("제목을 입력하세요");
			f.subject.focus();
			return false;
		}
		if(f.name.value.trim()===''){
			alert("이름을 입력하세요");
			f.name.focus();
			return false;
		}
		if(f.pwd.value.trim()===''){
			alert("비번을 입력하세요");
			f.pwd.focus();
			return false;
		}

	    
			f.submit();
	}
</script>

</head>
<body>
	<form name="f" method="post" action="insert.do">
		<table border="1">
			<caption>:::새 글 쓰기 :::</caption>
			<tr>
				<th>제목</th>
				<td><input name="subject"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input name="name"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" rows="10" cols="50"></textarea></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input name ="pwd" type="password"></td>
			</tr>
			<tr>
				<td colspan="2">
					<img src="img/btn_reg.gif" onclick="send_check()">
					<img src="img/btn_back.gif" onclick="location.href='board_list'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>