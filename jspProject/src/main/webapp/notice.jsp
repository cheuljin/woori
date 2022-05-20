<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보보기</title>

<style type="text/css">
#main{
   margin: 0 auto;
   width: 800px;
   height: 100%;
}
table {
   width: 100%;
   min-height: 200px;
   border-collapse: collapse;
}
th{
   background-color: gray;
}
td{
   border-bottom: 1px solid red;
   text-align: center;
}
#col1{
   width: 10%;
}
#col2{
   width: 20%;
}
#col3{
   width: 40%;
}
#tleft{
   text-align: left;
}
a:visited, a:link{
	color: black;
	text-decoration: none;
}
small{
	color: green;
	font-weight: bold;
}
</style>
</head>
<body>
	<%@include file="./menu.jsp"%>
	<div id="main">
		<!-- 이제 JSTL을 씁니다. -->
		<h1>게시판 만들기</h1>
		<table>
			<tr>
				<th id="col1">번호</th>
				<th id="col3">제목</th>
				<th id="col1">사람</th>
				<th id="col2">쓴날짜</th>
			</tr><c:forEach items="${list }" var="i">
				<tr>
					<td>${i.n_no }</td>
					<td id="tleft">
					<a href="./noticedetail?n_no=${i.n_no }">
						${i.n_title }
					</a>
					</td>
					<td>${i.m_name }</td>
					<td>${i.n_date }</td>
				</tr></c:forEach>
		</table>
		<c:choose>
			<c:when test="${sessionScope.m_id ne null }">
				<button onclick="location.href='./noticeWrite.jsp'">글쓰기</button>
			</c:when>
			<c:otherwise>
				<button onclick="location.href='./index.jsp'">글을 쓰려면 로그인하세요</button>
			</c:otherwise>
		</c:choose>
		<hr>
	</div>
</body>
</html>