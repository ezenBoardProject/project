<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰가</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<h1>글쓰기</h1>
	<form action="bd_insert.do" method="post">
		작성자: <input name="id" value="${login.id}" readonly><br>
		제목: <input name="title"><br> 내용: <br>
		<textarea rows="5" name="content"></textarea>
		<br> <input type="submit" value="등록">
		<button>작성 취소</button>
	</form>
	
<script type="text/javascript">

	$(document).ready(function(){
		
		$("button").click(function(event){
			event.preventDefault();
			location.replace("bd_list.do");
		});
		/* 작성취소 버튼을 누르면 board list로 돌아가는 기능 */
	});
	
</script>



</body>
</html>
