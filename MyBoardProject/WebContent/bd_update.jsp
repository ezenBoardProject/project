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
 <link rel="stylesheet" type="text/css" href="bd_update.css" />
 </head>
 <body>
 
 <div id="wrapper">

    <div id="header"><h2><a>게시글 수정</a></h2></div>

  <div id="content"> 

 <form action="bd_update.do" method="post">
    <div id="q">번호</div> <input id="num" name="num" value="${dto.num}" readonly><p>
    작성자 <input id="id" name="id" value="${dto.id}" readonly><p>
    제목 <input id="title" name="title" value="${dto.title}" required><p>
    내용  <textarea id="content" rows="5" name="content" required>${dto.content}</textarea><p>
    <input id="a" class= "edit" type="submit" value="수정 완료">
    <input id="a2" type="button" onclick="location.href='bd_list.do'"
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
   
 </form>
 
 </div>

  <div id="footer"> Copyright ⓒ Ezen TeamProject </div>
 </body>
 </html> 