<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="update.css" rel="stylesheet">

</head>
<body>

	<form action="update.do" method="post" id="signup">
		<h1>Update your Information!</h1>
		
		아이디: <input name="id" value="${dto.id}" readonly>
		이름: <input name="name" value="${dto.name}" required/><br>
		e-mail: <input name="email" value="${dto.email}" required/><br>
		비밀번호: <input type="password" name="pw" value="${dto.pw}" required/><br>	
		비밀번호 확인: <input type="password" name="pw2" value="${dto.pw}" required/><br>		
		생년월일: <input type="text" name="birth" value="${dto.birth}" required/><br>
		전화번호: <input type="tel" name="tel" value="${dto.tel}" required/><br>
		<br>
		<input class="button" type="submit" value="수정하기"><br>
		<button class="button" onclick="location.href='read.do?id=${dto.id}'">돌아가기</button>
  </form>

	<script type="text/javascript">
	
				$(document).ready(function() {

					$("input[type='submit']").click(function(event) {

						event.preventDefault();

						var pw1 = $("input[name='pw']").val();
						var pw2 = $("input[name='pw2']").val();

						if (pw1 != pw2) {
							$("input[name='pw2']").focus();
							$("input[name='pw2']").select();
							return;
						}

						$("form").submit();
						alert("회원정보 수정이 완료되었습니다.");
					});
					
					$('.button').click(function() {
		                  location.href = 'index.jsp';
		               })

				});
			</script>

</body>
</html>