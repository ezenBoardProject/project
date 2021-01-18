<%@page import="kr.co.ezen.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
</head>
<body>

<c:choose>
   <c:when test="${empty login}">
      <a href="loginui.do">로그인</a>
   </c:when>
    
	<c:otherwise>
		 ${login.id} 님, 환영합니다.<br><br>
		 <input type="button" onclick="location.href='bd_mylist.jsp'" value="게시글관리">
		<input type="button" onclick="location.href='read.do'" value="마이페이지"><br><br>
		<input type="button" onclick="location.href='logout.do'" value="로그아웃">
		
    </c:otherwise>
</c:choose>

</body>
</html>