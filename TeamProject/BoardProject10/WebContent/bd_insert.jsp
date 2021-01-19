<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="bd_insertReply.css" />
</head>
<body>
	<div id="header">
		<h1>게시판 글쓰기</h1>
	</div>
	<form action="bd_insert.do" method="post" class="content">
		<div>
			<label>
				<span>작성자</span> <input name="id" value="${login.id}" id="author" readonly>
			</label>
			
			<label>
				<span>제목</span> <input name="title" id="title">
			</label>
			
			<label>
				<span>내용</span> <textarea rows="5" name="content" id="feedback"></textarea>
			</label>
			
			<label>
				<input type="submit" value="등록" id="button">
			</label>
			
			<label>
				<input type="button" onclick="location.href='bd_list.do?num=${dto.num}'" 
				value="작성 취소" id="cancel">
			</label>
		</div>
	</form>

	<div id="addfooter"> Copyright ⓒ Ezen TeamProject </div>

</body>
</html>
