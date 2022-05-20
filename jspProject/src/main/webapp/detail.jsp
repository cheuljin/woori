<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세보기</title>
<script type="text/javascript">
function like(){
	//var b_no = ${detail.b_no };
	//alert("좋아요 누륾");
	location.href="./like?b_no=${detail.b_no }";
}
function cup(num){
	alert(num + "번 글을 수정 한다.");
	location.href="./cup?b_no=${detail.b_no}&c_no="+num;
}

function cdel(num){
	alert(num + "번 글을 삭제 한다.");
	location.href="./cdel?b_no=${detail.b_no}&c_no="+num;
}
</script>
<link href="./menu.css" rel="stylesheet">
<link href="./comment.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
#main {
	margin: 0 auto;
	width: 800px;
	height: 100%;
}
table {
	width: 100%;
	min-height: 300px;
	border-collapse: collapse;
}
tr{
	border-bottom: 1px red solid;
}

</style>
<c:if test="${detail.m_id eq sessionScope.m_id}">
<script type="text/javascript">
$(document).ready(function(){
	var b_no = ${detail.b_no};
	$("#up").click(function(){
		//alert("수정 시작");
		if(confirm("수정ㄱ?")){
			location.replace("./update?b_no="+b_no);
		}
	});
	
	$("#del").click(function(){
		if(confirm("삭제 ㄱ?")){
			var b_no2 = $("#b_no").text();
			//alert(b_no2 + "번글을 삭ㅡ제")
			location.replace("./delete?b_no="+b_no2);
		}
	});
	$("#cup").click(function(){
		if(confirm("해당 댓글 수정 ㄱ?")){
			//댓글 번호는 어케?
		}
	});
	$("#cdel").click(function(){
		if(confirm("해당 댓글 삭제 ㄱ?")){
			//댓글 번호는 어떻게?
			$(this).parents("#comment_id").text;
			alert(text);
		}
	});
});



</script>
</c:if>
</head>
<body>
	<%@include file="./menu.jsp"%>
	<div id="main">
		<table>
			<tr>
				<th>번호</th>
				<td>				
					<div id="b_no">${detail.b_no }</div>
					<c:if test="${detail.m_id eq sessionScope.m_id}">
						<img id="up" alt="" src="update.png" title="수정">
						<img id="del" alt="" src="del.png" title="삭제">				
					</c:if>
				</td>				
			</tr>
			
			<tr>
				<th>제목</th>
				<td>${detail.b_title }</td>
			</tr>
			<tr>
				<th>글쓴이</th>
				<td>${detail.m_name } / ${detail.m_id }</td>
			</tr>
			<tr>
				<th>좋아요</th>
				<td><img alt="좋아요수" src="like.png" title="좋아요수" width="25px;" onclick="like()">${detail.b_like }</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><img alt="조회수" src="count.png" title="조회수"  width="25px;">${detail.b_count }</td>
			</tr>
			<tr>
				<th>날짜</th>
				<td>${detail.b_date }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${detail.b_content }</td>
			</tr>
		</table>
		<br>
		<c:if test="${sessionScope.m_id ne null}">		
			<div id="comment">
				<form action="./commentWrite" method="post">
				<textarea name="comment"></textarea>
				<button type="submit">댓글쓰기</button>
				<input type="hidden" name="b_no" value="${detail.b_no }">
				</form>
			</div>
		</c:if>
			
		<c:forEach items="${commList }" var="c">
		<div id="comment_row">
			<div id = "commtent_head">
				<div id="comment_id">
					<input type ="hidden" id="c_no" name="c_no" value="${c.c_no }">
					${c.c_no } / ${c.m_no } / ${c.m_id } / ${c.m_name }
					<c:if test="${sessionScope.m_id eq c.m_id }">
					<img id="cup" alt="" src="update.png" title="수정" onclick="cup(${c.c_no})">
					<img id="cdel" alt="" src="del.png" title="삭제" onclick="cdel(${c.c_no})">
					</c:if>
				</div>
				<div id="comment_date">${c.c_date }</div>		
			</div>
			<div id="comment_body">${c.c_comment }</div>
		</div>
		</c:forEach>
		
		
		
		</div>
	
	<button onclick="location.href='./board'">게시판으로</button>

</body>
</html>































