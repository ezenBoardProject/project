<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>

         <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

 <!DOCTYPE html>
 <html>
 <head>
 <meta charset="UTF-8">
 <title>답글 화면</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <link rel="stylesheet" type="text/css" href="initial.css" />
   <link rel="stylesheet" type="text/css" href="bd_reply.css" />
</head>
<body>
<!-- Begin Wrapper -->
<div id="wrapper">
  <!-- Begin Header -->
  <div id="header"><h1><a href="main.jsp">Insert Reply</a></h1></div>
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
  
 	<form action="bd_reply.do" method="post">
 		<input type="hidden" name="num" value="${param.num}">
 		작성자: <input name="id" value="${login.id}" readonly><br>
 		제목: <input name="title"><br>
 		내용<br>
 		<textarea rows="5" name="content"></textarea>
 		<br>
 		<input type="submit" value="답글 등록">
		<button id="return">돌아가기</button>

 	</form>
 	
 <script type="text/javascript">
 	$(document).ready(function(){
 		
 		$("#return").click(function(event){
 			
 			event.preventDefault();
 			location.replace("bd_read.do?num=${param.num}"); 			
 			
 		});
 	});
 
 </script>
</div>

 <div id="footer"> Copyright ⓒ Ezen TeamProject </div>
 
 </body>
 </html> 