<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
</head>
<body>
<h1>회원 정보 수정</h1>

<form action="update.do" method="post">
   ID: <input  name="id" value="${dto.id}" readonly><br>
   NAME: <input name="name" value="${dto.name}"><br>
   EMAIL: <input type="email" name="mail" value="${dto.email}"><br>
   PW: <input type="password" name="pw" value="${dto.pw}"><br>
   PW(확인): <input type="password" name="pw" value="${dto.pw}"><br>
   BIRTH: <input type="date" name="birth" value="${dto.date}"><br>
   TEL: <input type="tel" name="tel" value="${dto.tel}"><br>
   <input type="submit" value="수정 완료">

</form>
</body>
</html>