<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글 화면</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="bd_reply.css" />
</head>
<body>
   <div id="header">
      <h1>글번호 ${param.num}의 답글 화면</h1>
   </div>

   <form action="bd_reply.do" method="post" class="content">
      <div>
         <label> <input type="hidden" name="num" value="${param.num}"
            type="text">
         </label> 
         
         <label> <span>작성자</span> <input name="id" id="author"
            value="${login.id}" type="text" readonly>
         </label>
         
         <label> <span>제목</span><input name="title" id="title"><br>
         </label> 
         
         <label> <span>내용</span> <textarea rows="5" name="content"
               placeholder="내용을 입력해주세요" id="feedback"></textarea>
         </label>
         
         <label>
         <input type="submit" value="답글등록" id="replybutton">
         
         </label>

      </div>
   </form>
   <br>
   <div id="addfooter"> Copyright ⓒ Ezen TeamProject </div>


</body>
</html>