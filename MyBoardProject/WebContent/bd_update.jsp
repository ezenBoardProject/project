<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 <!DOCTYPE html>
 <html>
 <head>
 <meta charset="UTF-8">
 <title>게시글 수정</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <link rel="stylesheet" type="text/css" href="initial.css" />
    
 </head>
 <body>
 
 <div id="wrapper">
  <!-- Begin Header -->
  <div id="header"><h1><a href="main.jsp">Update Contents</a></h1></div>
  <!-- End Header -->
  <!-- Begin Naviagtion -->
  <div id="navigation">
  
  <c:choose>
  		<c:when test="${empty login}">
  			<a href="insertui.do">회원 가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  			<a href="loginui.do">로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
  			<a href="bd_list.do">글 목록</a>
  		</c:when>
  		<c:otherwise>
  			<a href="bd_insertui.do">글 쓰기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  			<a href="read.do?id=${login.id}">마이페이지</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  			<a href="logout.do">로그아웃</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
  			<a href="bd_list.do">글 목록</a>
  		</c:otherwise>
  	</c:choose>

  </div>
  <!-- End Naviagtion -->
  <!-- Begin Content -->
  <div id="content"> 
 	
 	<h2>게시글 수정</h2>

 	<form action="bd_update.do" method="post">
 	번호: <input name="num" value="${dto.num}" readonly><p>
 	작성자: <input name="id" value="${dto.id}" readonly><p>
 	제목: <input name="title" value="${dto.title}" required><p>
 	내용: <textarea rows="5" name="content" required>${dto.content}</textarea><p>
 	<input class= "edit" type="submit" value="수정 완료">
 	<input type="button" onclick="location.href='bd_list.do'"
 		value="돌아가기">

 <script type="text/javascript">
 		
 	$(document).ready(function() {
 		
 		$("input[type='submit']").click(function(event){
 			
 			event.preventDefault();
 			
 			var id = $("input[name='id']").val();			
 			
 			$("form").submit();
 			alert("회원정보 수정이 완료되었습니다.");
 		});		
 	});

 	</script>

</div>

 <div id="footer"> Copyright ⓒ Ezen TeamProject </div>
 
 </form>
 </body>
 </html> 