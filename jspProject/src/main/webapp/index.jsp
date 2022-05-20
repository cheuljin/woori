<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="./menu.css" rel="stylesheet">
<style type="text/css">
#main {
	margin: 0 auto;
	width: 800px;
	height: 100%;
}

#loginform {
	margin: 0 auto;
	margin-top: 150px;
	height: 400px;
	width: 300px;
	background-color: gray;
	padding: 10px;
}

#loginform input, button {
	margin: 0;
	padding: 0;
	background-color: white;
	border: 0;
	height: 50px;
	width: 100%;
}

#loginform input {
	margin-bottom: 10px;
}

#loginform input:hover, button:hover {
	background-color: green;
}
#loginform img{

	margin: 0 auto;
	text-align: center;
}
</style>
</head>
<body>
	<%@include file="./menu.jsp"%>
	<div id="main">
		<div id="loginform">
			<form action="./login" method="post">
				<img src="./2.jpg" width="200" height="200" >
				<input type="text" name="id" required="required"><br> 
				<input type="password" name="pw" required="required"> <br>
				<button type="submit">Login</button>
			</form>
			<a href="join.jsp">회원가입</a>		
		</div>
	<%-- 에러${error } --%>
	<%-- 파람.에러${param.error } --%>
	<!-- http://localhost:8080jspProject.index.jsp?error=1024 -->
	</div>
	<%
	String error = request.getParameter("error");
	if (error != null) {
	%>
	<script type="text/javascript">
		alert("아이디와 비밀번호가 일치하지 않아요.\n 다시 입력 ㄱㄱ");
	</script>
	<%
	}
	%>
</body>
</html>