<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

	<h2>회원 탈퇴하기</h2>
	<h4>탈퇴하기 버튼을 누르시면 탈퇴가 완료됩니다.</h4>

	<form action="delete.do">
		
		<table>
			<tr>
				<td>아이디</td>
				<td><input name="id" value="${dto.id}" readonly></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input name="pw" type="password"></td>
			</tr>
		</table>
		<br>
		<input type="submit" value="탈퇴하기">
		<br>
		탈퇴를 원하지 않으시면&nbsp;<a href="read.do?id=${dto.id}">내 정보 보기</a>&nbsp; 를 선택해주세요.
		<br>
	
	</form>

</body>
</html>