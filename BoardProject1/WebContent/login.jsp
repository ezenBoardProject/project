<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<h1>로그인 화면</h1>
	
	<form action="login.do" method="post">
	ID: <input name="id"><br>
	PW: <input type="password" name="pw"><br>
	<input type="submit" value="로그인">
	
	</form>
</body>
</html>