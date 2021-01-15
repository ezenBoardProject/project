<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="semantic/dist/semantic.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>

<script src="semantic/dist/semantic.min.js"></script>
<link href="bd_list.css" rel="stylesheet">
</head>
<body>

	<div id="wrapper">

		<c:choose>
			<c:when test="${empty login}">
				<b><a href="insertui.do">회원가입</a><a href="loginui.do">로그인&nbsp;&nbsp;&nbsp;</a></b>
			</c:when>
			<c:otherwise>
				<a href="read.do?id=${login.id}">마이페이지</a>
				<a href="logout.do">로그아웃&nbsp;&nbsp;&nbsp;</a>
			</c:otherwise>
		</c:choose>

		<h1>게시글 목록</h1>
		<button id="b1" class="tiny ui button"
			onclick="location.href='bd_insertui.do'">글쓰기</button>
		<button class="tiny ui button" onclick="location.href='bd_list.do'">글
			목록</button>

		<table id="keywords">
			<thead>
				<tr>
					<th>글 번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${list}" var="dto">
					<tr>
						<td>${dto.num}</td>
						<td><c:forEach begin="1" end="${dto.repIndent}">
                     &nbsp;Re:
                  </c:forEach> <a href="bd_read.do?num=${dto.num}">${dto.title}</a>
						</td>
						<td>${dto.id}</td>
						<td>${dto.readcnt}</td>
						<td>${dto.writeday}</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>
		<div class="page">
			<c:if test="${to.beginLineNum - to.perLine > 0 }">
				<a href="bd_list.do?curPage=${to.beginLineNum-to.perLine}">&laquo;</a>
			</c:if>
			<c:if test="${to.curPage > 1 }">
				<a href="bd_list.do?curPage=${to.curPage - 1}">&lt;</a>
			</c:if>
			<c:forEach var="i" end="${to.stopLineNum}" begin="${to.beginLineNum}">
				<a class="${to.curPage == i?'itsme':'' }"
					href="bd_list.do?curPage=${i}"> ${i} </a>
			</c:forEach>

			<c:if test="${to.curPage < to.totalPage}">
				<a href="bd_list.do?curPage=${to.curPage + 1 }">&gt;</a>
			</c:if>

			<c:if test="${to.totalPage > to.stopLineNum}">
				<a href="bd_list.do?curPage=${to.beginLineNum + to.perLine}">&raquo;</a>
			</c:if>
		</div>
		<br> <br> <br>
		<form action="bd_search.do" class="search">
			<select name="searchOption">
				<option value="id">작성자</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select> <input name="searchKeyword"> <input type="submit" value="검색">
		</form>
	</div>
</body>
</html>