<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<h1>게시글 화면</h1>
	
	번호: ${dto.num}<br><br>
	날짜: ${dto.writeday}<Br>
	조회: ${dto.readcnt}<br><br>
	
	작성자: <input ${dto.id}><br>
	제목: <input${dto.title}><br><br>
	내용: <textarea rows="5" name="content" required>${dto.content}</textarea><p>
	</p>
	
		<input type="button" onclick="location.href='bd_replyui.do?num=${dto.num}'"
		value="댓글추가">			
		<input type="button" onclick="location.href='bd_updateui.do?num=${dto.num}'"
			value="수정">
		<input type="button" onclick="location.href='bd_delete.do?num=${dto.num}'"
			value="삭제"><p><p>
			
		<input type="button" onclick="location.href='bd_list.do'" value="게시글 전체보기">
		<input type="button" onclick="location.href='bd_mylist.do?id=${login.id}'" value="마이 게시글">

</body>
</html>