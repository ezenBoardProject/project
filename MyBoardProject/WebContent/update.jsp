<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

<h2>회원 정보 수정</h2>
<h3>회원 정보를 수정 할 수 있습니다.</h3>

	<form action="update.do" method="post">
		ID : <input name="id" value="${dto.id}" readonly><br>
		Password : <input name="pw1" value="${dto.pw}" type="password"><br>
		Password 확인 : <input name="pw2" value="${dto.pw}" type="password"><br>
		이름 : <input name="name" value="${dto.name}"><br>
		e-mail : <input name="email" value="${dto.email}" type="email"><br>
		생년월일 : <input name="birth" value="${dto.birth}" type="date"><br>
		연락처 : <input name="tel" value="${dto.tel}" type="tel"><br>
		<br>
		<input type="submit" value="수정하기"> <a href="read.do?id=${dto.id}">돌아가기</a>
	</form>

</body>
</html>