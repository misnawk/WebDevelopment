<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/httpRequest.js"></script>
<script type="text/javascript">

	function send(){
		let dan = document.getElementById("dan").value;
		
		let url = "gugudan_ajax.jsp";
		let param = "dan="+dan;
		
		sendRequest(url,param,resultFn,"Get");
	}
	
	function resultFn() {
		/* alert("call Back"); */
		
		//readyState : XMLHttpRequest 객체의 상태를 보여주는 프로퍼티
		//UNSENT(숫자 0) : XMLHttpRequest 객체가 생성됨
		//OPEND(숫자 1) : open()메서드가 성공적으로 실행됨
		//HEADERS_RECEIVED(숫자 2) : 모든 요청에 대한 응답이 도착함
		//LOADING(숫자 3) : 요청한 데이터를 처리중임
		//DONE(숫자 4) : 요청한 데이터의 처리가 완료되어 응갑할 준비가 완료됨
		
		//status :  서버의 문서 상태를 나타낸다.
			//200 : 통신성공
			//404 : 문서없음
			//500 : 서버가 잘못됨
			
			console.log(xhr.readyState + "/" + xhr.status);
		
			let data = xhr.responseText; //최종결과 값을 갖고 돌아온다.
			
			//consol 값으로 있던 것을 화면에 넣어준다.			
			document.getElementById("disp").innerHTML = data;
		
	}
	</script>
	

	
</head>
<body>
	단 : <input id = "dan">
	<input type="button" value="결과보기" onclick = "send()">
	<br>
	<div id = "disp"></div>
</body>
</html>