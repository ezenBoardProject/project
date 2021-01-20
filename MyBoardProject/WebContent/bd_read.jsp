<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="bd_read.css" />

</head>
<body>

<div id="wrapper">

	<div id="header">
		<h1><a href="main.do">Read the content</a></h1>
	</div>
	
	
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

	<div class="content">

		  <label>
           <input name="title" id="title" value="${dto.title}" readonly>
         </label>
		<div id="con">
		  <label class="lab">
		  <br>
          <span style="margin-left: 50px;">글 번호: </span><input name="num" value="${dto.num}" style="width: 70px;" readonly>
          <span>글쓴이: </span><input name="id" value="${login.id}" readonly>
          <span>조회수: </span><input name="readcnt" id="readcnt" value="${dto.readcnt}" style="width: 70px;" readonly>
          <span>작성일: </span><input name="writeday" id="writeday" value="${dto.writeday}" readonly>
         </label>
         </div>
         <label>
            <textarea rows="5" name="content" id="feedback" readonly>${dto.content}</textarea>
         </label>

		<input type="button"
			onclick="location.href='bd_replyui.do?num=${dto.num}'" class="but" value="댓글추가" style="margin-left: 50px;">
		<input type="button"
			onclick="location.href='bd_updateui.do?num=${dto.num}'" class="but" value="수정">
		<input id="del" class="but" type="button" value="삭제">
		
		<script type="text/javascript">
			$(document).ready(function() {
				
				$("#del").click(function(event) {

				var choice;
				choice = confirm("게시글을 삭제하시겠습니까?");

				if (choice) {
					location.replace("bd_delete.do?num=${dto.num}");
				} else {
					location.replace("bd_read.do?num=${dto.num}")
				}

				});
				
				$("#pageback").click(function() {

				history.go(-1);
				});

			});
		</script>

	<input id="pageback" class="but" type="button" value="게시글 화면">
		
	</div>
	<div id="footer">Copyright ⓒ Ezen TeamProject</div>
</div>

</body>
</html>
