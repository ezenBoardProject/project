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
<link rel="stylesheet" type="text/css" href="initial.css" />
<link rel="stylesheet" type="text/css" href="bd_insert.css" />

</head>
<body>

	<div id="wrapper">

		<div id="header">
			<h1>
				<a href="main.do">Send Message</a>
			</h1>
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
		<!-- End Naviagtion -->
		<!-- Begin Content -->
		<div id="content">
		
			<h1>글쓰기</h1>
			<br>
			<br>
			<section>
				<article>
					<form action="bd_insert.do" method="post">
						<strong>작성자: </strong> <input name="id" value="${login.id}"
							readonly><br> <strong>제목: </strong> <input
							name="title"><br>
						<textarea rows="5" name="content"></textarea>
						<br> <input type="submit" value="등록">
						<button>작성 취소</button>
					</form>

					<script type="text/javascript">
						$(document).ready(function() {

							$("button").click(function(event) {
								event.preventDefault();
								location.replace("bd_list.do");
							});
							/* 작성취소 버튼을 누르면 board list로 돌아가는 기능 */
						});
					</script>
				</article>
			</section>
		</div>

		<div id="footer">Copyright ⓒ Ezen TeamProject</div>

	</div>
</body>
</html>
