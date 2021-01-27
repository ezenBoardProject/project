<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <link rel="stylesheet" type="text/css" href="bd_insert.css" />
</head>
<body>
   
  <div id="wrapper">
   <div id="header">
      <h1><a href="main.do">Writing</a></h1>
   </div>
    
     <div id="navigation">
  
    <c:choose>
  		<c:when test="${empty login}">
  			<a href="insertui.do">회원 가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  			<a href="loginui.do">로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
  			<a href="bd_list.do">글 목록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
  			<a href="fileDownload.jsp">자료실</a>
  		</c:when>
  		<c:otherwise>
  			<a href="bd_insertui.do">글 쓰기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  			<a href="read.do?id=${login.id}">마이페이지</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  			<a href="logout.do">로그아웃</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
  			<a href="bd_list.do">글 목록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
  			<a href="fileDownload.jsp">자료실</a>
  		</c:otherwise>
  	</c:choose>


  </div>

   <form action="bd_insert.do" method="post" class="content">
      <div style="padding-left: 20px; width: 800px; margin-top: 30px;">
         <label>
            <span>작성자</span> <input name="id" value="${login.id}" id="author" readonly>
         </label>
                  
         <label>
            <span>제목</span> <input name="title" id="title" required/>
         </label>
         
         <label>
            <span>내용</span> <textarea rows="5" name="content" id="feedback" required/></textarea>
         </label>
      	
         <label>
           <input type="submit" value="등록" id="button">
         </label>
         
         <label>
            <input type="button" value="작성 취소" id="cancel">
         </label>
      </div>
   </form>
   

   <div id="footer"> Copyright ⓒ Ezen TeamProject </div>
   
   <script type="text/javascript">

   $(document).ready(function(){
      
      $("#cancel").click(function(event){
         
         event.preventDefault();
         history.go(-1);
         
      });
   });

</script>
</div> 
</body>
</html>