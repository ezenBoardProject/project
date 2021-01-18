<%@page import="java.util.List"%>
<%@page import="kr.co.ezen.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
<!-- Begin Wrapper -->
<div id="wrapper">
  <!-- Begin Header -->
  <div id="header"><h1><a href="main.jsp">Main Page</a></h1></div>
  <!-- End Header -->
  <!-- Begin Naviagtion -->
  <div id="navigation">
    <a href="insertui.do">회원 가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <a href="list.do">목록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <a href="loginui.do">로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
   <a href="bd_list.do">글 목록</a>

  </div>
  <!-- End Naviagtion -->
  <!-- Begin Content -->
  <div id="content"> 
  <br>
  	<h1>HOT 게시물</h1>
  	<br><br><br>
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
  			<tr>
  			<c:forEach items="${list}" var="dto" end="5">
  				<td>${dto.num}</td>
  				<td>
  				<c:forEach begin="1" end="${dto.repIndent}">
                   			  &nbsp;Re:
                </c:forEach> <a href="bd_read.do?num=${dto.num}">${dto.title}</a>
				</td>
  				<td>${dto.id}</td>
  				<td>${dto.readcnt}</td>
  				<td>${dto.writeday}</td>
  			</c:forEach>
  			</tr>
  		</tbody>
  		
  	</table>
  	
  </div>

  <div id="footer"> Copyright ⓒ Ezen TeamProject </div>








</body>
</html>