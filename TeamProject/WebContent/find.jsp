<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 비밀번호 찾기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<a href="main.jsp">메인</a>
<p>아이디찾기</p>
   <form action="findid.do" method="post">
    이름 <input type="text" name="name" placeholder="이름" required><br>
    이메일 <input type="text" name="email" placeholder="이메일" required><br>
    <input type="submit" value="확인" class="findid"><br>
</form>

           <p>비밀번호찾기</p>
            <form action="findpw.do" method="post">
                이름<input type="text" name="name" placeholder="이름" required><br>
                이메일<input type="text" name="email" placeholder=" 이메일" required><br>
        <input type="submit" value="확인" class="findpw">
        </form>

</body>
</html>