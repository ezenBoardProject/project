<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<h1>회원가입</h1>

	<form action="insert" method="post">
		아이디: <input name="id" placeholder="아이디를 입력하세요."><button>중복검사</button><span></span><br>
		이름: <input name="name" placeholder="이름을 입력하세요."><br>
		e-mail: <input type="email" name="email" placeholder="이메일을 입력하세요."><br>
		비밀번호: <input type="password" name="pw" placeholder="비밀번호를 입력하세요."><br>		
		생년월일: <input type="date" name="birth" ><br>
		전화번호: <input type="tel" name="tel" placeholder="전화번호를 입력하세요"><br>
		<input type="submit" value="등록">
  </form>
  <script type="text/javascript">
  
  $("button").click(function(event) {
		event.preventDefault();
	   
		var idv = $("input[name='id']").val();
		
		$.ajax({
			type: 'get',
			url: 'idcheck',
			data: {
				id : idv
			},
			dataType: 'text',
			success: function(result) {
				console.log(result);
				$("span").text(result);
			},
			error: function(request, status, error) {
				console.log(error);
			},
			
		});
  });
  
  </script>
  
</body>
</html>