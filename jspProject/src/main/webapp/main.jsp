<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<link href="./menu.css" rel="stylesheet">
<style type="text/css">
html, body {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%;
	background-color: white;
	width: 100%;
}

#header {
	float: left;
	background-color: black;
	width: 100%;
	height: 50px;
}

li {
	margin: 0;
	margin-left: 20px;
	float: left;
}

li a {
	text-align:center;
	text-decoration: none;
	color: white;
}
img{
	width: 30px;
	height: 30px;
}

</style>
</head>
<body>
<%@include file="./menu.jsp" %>
	<div id="main">
	<h1>main</h1>	
	<%=session.getAttribute("m_name")%>님 하이. ${sessionScope.m_name }님 ㅎㅇ.
	</div>
</body>
</html>