<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

<c:choose>
	<c:when test="${empty login}">&nbsp;</c:when>
</c:choose>

<h2>회원 정보 수정</h2>
<h3>회원 정보를 수정 할 수 있습니다.</h3>

	<form action="update.do" method="post">
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
				<td><input name="pw" type="password" value="${dto.pw}" required/></td>
			</tr>
			
			<tr>
				<td>비밀번호 확인</td>	
				<td><input name="pw2" type="password" value="${dto.pw}" required/></td>
			</tr>
			
			<tr>	
				<td>생년월일</td>
				<td><input name="birth" type="text" value="${dto.birth}" required/></td>
			</tr>
			
			<tr>
				<td>e-mail</td>	
				<td><input name="email" type="email" value="${dto.email}" required/></td>
			</tr>
			
			<tr>
				<td>연락처</td>	
				<td><input name="tel" type="tel" value="${dto.tel}" required/></td>
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
			alert("회원정보 수정이 완료되었습니다.");
		});
		
		
	});

	</script>
	

</body>
</html>