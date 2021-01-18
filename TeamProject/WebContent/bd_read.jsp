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
 <link rel="stylesheet" href="bd_read.css">
 </head>
 <body>
 <div id="wrapper">
 <div id="header"><h1>게시글 화면</h1></div>
	<div id="content">
    번호: ${dto.num}
    날짜: ${dto.writeday}
    조회: ${dto.readcnt}<br>

    작성자: ${dto.id}<br>
    제목: ${dto.title}<br><br>
    내용:<br>
     <textarea rows="5" name="content" required readonly="readonly">${dto.content}</textarea><p>
    </p>
    <br><br>

       <input type="button" onclick="location.href='bd_replyui.do?num=${dto.num}'"  value="댓글추가">
       &nbsp;&nbsp;&nbsp;    
       <input type="button" onclick="location.href='bd_updateui.do?num=${dto.num}'" value="수정">
       &nbsp;&nbsp;&nbsp;
       <input id="del" type="button" value="삭제">
       &nbsp;&nbsp;&nbsp;
       <input class="pageback" type="button" onclick="location.href='bd_list.do'" value="목록">
       &nbsp;&nbsp;&nbsp;
       <input type="button" onclick="location.href='bd_mylist.do?id=${login.id}'" value="마이 게시글">
       
       </div>
</div>
 <div id="footer"> Copyright ⓒ Ezen TeamProject </div>



          
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