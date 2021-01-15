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
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 </head>
 <body>
 <h1>글번호 ${param.num}의 답글 화면</h1>

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

 </body>
 </html> 