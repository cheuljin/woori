<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#menu{
	width: 100%;
	height: 50px;
	background-color: black;
}
#navi{
	margin: 0 auto;
	height: 50px;
	width: 800px;	
}
ul{
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
}
li{
	float: left;
	padding: 15px 16px;
	color: gray;
}
li a:hoever{
	color: white;
}
li a {
	display: block;
	color: gray;
	text-align: center;
	text-decoration: none;
}
</style>
<div id="menu">
	<div id="navi">
		<ul>
			<li><img alt="2" src="./2.jpg" onclick="location.href='./index'" height="20px"></li>
			<li><a href="./main"><img alt="2" src="./2.jpg" height="20px">메인</a></li>
			<li><a href="./board"><img alt="2" src="./2.jpg" height="20px">보드</a></li>
			<li><a href="./notice"><img alt="2" src="./2.jpg" height="20px">공지사항</a></li>
			
			
			<% if(session.getAttribute("m_name") != null){ %>
			
			<li><a href="./userInfo">${sessionScope.m_name }님 ㅎㅇ.</a></li>
			<li><img src="./2.jpg" onclick="logout()" height="20px"></li>
			
			<%} else{ %>
			
			<li><img src="./2.jpg" onclick="location.href='./index'" height="20px"></a>
			
			<%} %>
			
		</ul>
	</div>
</div>

<script type="text/javascript">

function logout() {
	//실행할 코드
	if(	confirm("로그아웃을 눌렀다리")	){
		//alert("로그아웃을 겟 또");	
		location.href="./logout";
	}else {
		alert("취소를 겟 또");
	}

}


</script>







































