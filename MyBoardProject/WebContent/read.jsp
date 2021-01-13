<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

${dto.name}님, 환영합니다!&nbsp;&nbsp;<a href="logout.do">로그아웃</a>

	<h2>회원 정보 자세히 보기</h2>
	ID : ${dto.id}<br>
	이름 : ${dto.name}<br>
	e-mail : ${dto.email}<br>
	생년월일 : ${dto.birth}<br>
	연락처 : ${dto.tel}<br>
	
	<br>
	<a href="updateui.do?id=${dto.id}">회원정보 수정</a><br>
	<a href="deleteui.do?id=${dto.id}">회원 탈퇴</a>
	

</body>
</html>