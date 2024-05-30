<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/httpRequest.js"></script>
<script type="text/javascript">
	//아이디 중복 여부 체크
	let b_idCheck = false;

	function send(f){
		let id = f.id.value.trim();
		let name = f.name.value.trim();
		let pwd = f.pwd.value.trim();
		
		if(id == ''){
			alert("아이디를 입력하세요")
			return;
		}
		
		if(b_idCheck == false){
			alert("중복체크를 하세요")
			return;
		}
		
		if(name == ''){
			alert("이름을 입력하세요")
			return;
		}
		
		if(pwd == ''){
			alert("비밀번호를 입력하세요")
			return;
		}
		
		f.method = "POST";
		f.action = "insert.do";
		f.submit();
	}
	

	
	function check_id(){
		let id = document.getElementById("id").value.trim();
		
		if(id == ''){
			alert("아이디를 입력하세요")
			return
		}
		
		let url = "check_id.do";
		let param = "id="+id;
		
		sendRequest(url, param, resultFn, "POST");

	}
	
	function resultFn(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var data = xhr.responseText;
			let json = eval(data);
			
			if(json[0].res == 'no'){
				alert("이미 사용중인 아이디입니다.");
				return;
			} else {
				alert("사용 가능한 아이디 입니다.");
				b_idCheck = true;
			}
		}
	}
	
	//아이디를 입력받는 입력상자의 값이 바뀌면 호출되는 메서드
	function che(){
		b_idCheck = false;
	}
</script>
</head>
<body>
	<form>
		<table border="1">
			<caption>:::회원가입:::</caption>
			<tr>
				<th>아이디</th>
				<td>
					<input name="id" id="id" onchange="che()">
					<input type="button" value="중복체크" onclick="check_id()">
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input name="name">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input name="pwd" type="password">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="가입" onclick="send(this.form)">
					<input type="button" value="취소" onclick="location.href='user_list.do'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>






