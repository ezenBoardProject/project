<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
${dto.name}님, 환영합니다!&nbsp;&nbsp;<a href="logout.do">로그아웃</a>

<h2>회원 정보 수정</h2>
<h3>회원 정보를 수정 할 수 있습니다.</h3>

	<form action="update.do" method="post">
		ID : <input name="id" value="${dto.id}" readonly><br>
		Password : <input name="pw1" value="${dto.pw}" type="password"><br>
		Password 확인 : <input name="pw2" value="${dto.pw}" type="password"><br>
		이름 : <input name="name" value="${dto.name}"><br>
		e-mail : <input name="email" value="${dto.email}" type="email"><br>
		생년월일 : <input name="birth" value="${dto.birth}" type="date"><br>
		연락처 : <input name="tel" value="${dto.tel}" type="tel"><br>
		<table >
			<tr>
				<td>ID</td>
				<td><input name="id" value="${dto.id}" readonly> </td>
			</tr>	

			<tr>
				<td>이름</td>
				<td><input name="name" value="${dto.name}"> </td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input name="pw" type="password" value="${dto.pw}"></td>
			</tr>

			<tr>
				<td>비밀번호 확인</td>	
				<td><input name="pw2" type="password" value="${dto.pw}"></td>
			</tr>

			<tr>	
				<td>생년월일</td>
				<td><input name="birth" type="date" value="${dto.birth}"><br>
					<a id="a1">생년월일을 반드시 입력하세요</a> </td>
			</tr>

			<tr>
				<td>e-mail</td>	
				<td><input name="email" type="email" value="${dto.email}"> </td>
			</tr>

			<tr>
				<td>연락처</td>	
				<td><input name="tel" type="tel" value="${dto.tel}"> </td>
			</tr>

		</table>
		<br>
		<input type="submit" value="수정하기"> <a href="read.do?id=${dto.id}">돌아가기</a>
	</form>

	<script type="text/javascript">
		
	$(document).ready(function() {
		
		$("input[type='submit']").click(function(event){
			
			event.preventDefault();
			
			var pw1 = $("input[name='pw']").val();
			var pw2 = $("input[name='pw2']").val();
			
			if(pw1 != pw2){
				$("input[name='pw2']").focus();
				$("input[name='pw2']").select();
				return;
			}
			
			$("form").submit();
		});
		
		
	});
	</script>

</body>
</html>