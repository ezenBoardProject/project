<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 쓰기 화면</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="semantic/dist/semantic.min.css">
<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
  
<script src="semantic/dist/semantic.min.js"></script>
<link href="bd_list.css" rel="stylesheet" >
</head>
<body>
<div id="wrapper">
	<c:choose>
		<c:when test="${empty login}">
			<b><a href="insertui.do">회원가입</a><a href="loginui.do">로그인&nbsp;&nbsp;&nbsp;</a></b>
		</c:when>
		<c:otherwise>
			<a href="read.do?id=${login.id}">마이페이지</a>
			<a href="logout.do">로그아웃&nbsp;&nbsp;&nbsp;</a>
		</c:otherwise>
	</c:choose>

	<h1>글 쓰기</h1>

	<form action="bd_insert.do" method="post">
		<table id="keywords">
			<tbody>
				<tr>
					<td>작성자</td>
					<td><input name="id" value="${login.id}" readonly></td>
				</tr>
				<tr>
					<td>제목</td>	
					<td><input name="title" required></td>
				</tr>
				<tr>
					<td colspan="2"><textarea rows="10" cols="70" name="content" required></textarea></td>
				</tr>
			</tbody>
		</table>
		<br>

		<input type="submit" value="작성하기">
		<button onclick="location.href='bd_list.do'">작성 취소</button>
	</form>
</div>
</body>
</html>