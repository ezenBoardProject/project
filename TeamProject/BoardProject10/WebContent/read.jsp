<%@page import="kr.co.domain.MemberDAO"%>
<%@page import="kr.co.ezen.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="read.css" />
</head>
<body>
	<div id="header">
		<h2>MY PAGE</h2>
	</div>

	<div id="wrapper">

		<a>${login.id} 님의 페이지입니다.</a> &nbsp;&nbsp;&nbsp; <input type="button"
			onclick="location.href='logout.do?id=${login.id}'" value="로그아웃">
	</div>

	<div class="container">

		<button
			onclick="location.href='http://localhost:8085/teamProject/bd_mylist.jsp'"
			id="pmenu" class="btn btn-1">마이게시글</button>
		<button onclick="location.href='updateui.do?id=${login.id}'"
			class="btn btn-2">정보 수정</button>
		<button class="btn btn-2" type="button"
			onclick="location.href='delete.do?id=${login.id}'" id="del">회원
			탈퇴</button>
	</div>

	<div class="con_box" id="contbox">
	
	</div>



	<script type="text/javascript">
		$(document).ready(function() {

			$("#del").click(function() {

				var choice;
				var url = "delete.do?id=${login.id}";
				choice = confirm("정말로 탈퇴하시겠습니까?");

				if (choice) {
					location.replace(url);
				} else {
					location.replace("read.do?id=${login.id}");
				}

			});

		});
	</script>

</body>
</html>