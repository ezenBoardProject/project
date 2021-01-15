<%@page import="kr.co.domain.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="index.html">
</head>
<body>

<c:choose>
   <c:when test="${empty login}">
      <a href="loginui.do">로그인</a>
   </c:when>
    
   <c:otherwise>
       ${login.id} 님, 환영합니다.<br><br>
       <input type="button" onclick="location.href='bd_mylist.do?id=${login.id}'" value="마이게시글">
      <input type="button" onclick="location.href='read.do?id=${login.id}'" value="마이페이지">
      <input type="button" onclick="location.href='loginui.do'" value="로그아웃">
      
    </c:otherwise>
</c:choose>

<%--    <c:if test="admin".equals${dto.id}>
         <input type="button" onclick="admin.do" value="회원관리">
   </c:if> --%>


</body>
</html>