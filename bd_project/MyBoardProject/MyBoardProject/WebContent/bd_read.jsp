
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

 	작성자: ${dto.id}<br>
 	제목: ${dto.title}<br>
 	<textarea rows="5" name="content" required>${dto.content}</textarea><p>
 	</p>

 		<input type="button" onclick="location.href='bd_replyui.do?num=${dto.num}'"
 		value="댓글추가">			
 		<input type="button" onclick="location.href='bd_updateui.do?num=${dto.num}'"
 			value="수정">
 		<input id="del" type="button" value="삭제"><p><p>

 		<input type="button" onclick="location.href='bd_list.do'" value="게시글 전체보기">
 		<input type="button" onclick="location.href='bd_mylist.do?id=${dto.id}'" value="마이 게시글">
 		
 	<script type="text/javascript">
 		
 		$(document).ready(function(){
 			
 			$("#del").click(function(event){
 				
 				var choice;
 				
 				choice = confirm("게시글을 삭제하시겠습니까?");
 				
 				if (choice) {
					location.replace("bd_delete.do?num=${dto.num}");
				} else {
					location.replace("bd_read.do?num=${dto.num}")
				}
 				
 				
 			});
 			
 			 $(".pageback").click(function() {
 	             
 	             history.go(-1);
 	      })
 	          
 	          
 	       });
		 	
 	</script>	
 	

 </body>
 </html> 