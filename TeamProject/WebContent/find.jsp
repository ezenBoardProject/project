<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<p>아이디찾기</p>
   <form action="find_id.do" method="post">
    이름 <input type="text" name="name" placeholder="이름" required><br>
    이메일 <input type="text" name="email" placeholder="이메일" required><br>
    <input type="submit" value="확인"><br>
</form>

           <p>비밀번호찾기</p>
            <form action="find_pw.jsp" method="post">
                이름<input type="text" name="name" placeholder="이름" required><br>
                이메일<input type="text" name="email" placeholder=" 이메일" required><br>
        <input type="submit" value="확인">
        </form>
</body>
</html>