<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function send(f){
		let title = f.title.value.trim();
		let photo = f.photo.value.trim();
		
		//유효성 체크
		if(title == ''){
			alert("제목을 입력하세요")
			return;
		}
		
		if(photo == ''){
			alert("파일을 업로드 하세요");
			return;
		}
		
		//jsp에서 java클래스를 호출하는것은 불가능 하나
		//@webServlet의 매핑된 경로로 servlet을 호출하는것은 가능하다.
		f.action = "upload.do";
		f.submit();
	}
</script>
</head>
<body>
	<form method="post" enctype="multipart/form-data">
		제목 : <input name="title"><br>
		첨부 : <input type="file" name="photo"><br>
		<input type="button" value="업로드" onclick="send(this.form)">
	</form>
</body>
</html>






