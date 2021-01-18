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
<link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
	<div id="wrapper">
		<!-- Begin Header -->
		<div id="header">
			<h1>
				<a href="main.do">Read the Content</a>
			</h1>
		</div>
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
		
			번호: ${dto.num} <br> <br> 날짜: ${dto.writeday} <Br> 조회:
			${dto.readcnt} <br> <br> 작성자: ${dto.id} <br> 제목:
			${dto.title} <br> <br> 내용:
			<textarea rows="5" name="content" required>${dto.content}</textarea>
			<p></p>

			<input type="button"
				onclick="location.href='bd_replyui.do?num=${dto.num}'" value="댓글추가">
			<input type="button"
				onclick="location.href='bd_updateui.do?num=${dto.num}'" value="수정">
			<input id="del" type="button" value="삭제">
			<p>
			<p>

				<script type="text/javascript">
					$(document)
							.ready(
									function() {

										$("#del")
												.click(
														function(event) {

															var choice;

															choice = confirm("게시글을 삭제하시겠습니까?");

															if (choice) {
																location
																		.replace("bd_delete.do?num=${dto.num}");
															} else {
																location
																		.replace("bd_read.do?num=${dto.num}")
															}

														});
										$(".pageback").click(function() {

											history.go(-1);
										})

									});
				</script>

				<input class="pageback" type="button"
					onclick="location.href='bd_list.do'" value="게시글 화면"> <input
					type="button" onclick="location.href='bd_mylist.do?id=${login.id}'"
					value="마이 게시글">
					
					
		</div>

  		<div id="footer"> Copyright ⓒ Ezen TeamProject </div>
					
					
</body>
</html>
