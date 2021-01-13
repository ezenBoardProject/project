<%@page import="kr.co.dao.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<h1>회원정보 보기</h1>
<%
 	MemberDTO dto = (MemberDTO)request.getAttribute("dto");
	pageContext.setAttribute("dto", dto);
   
%>

ID: <%=dto.getId() %><br>
NAME: <%=dto.getName() %><br>
EMAIL: <%=dto.getEmail() %><br>
BIRTH: <%=dto.getBirth() %><br>
TEL: <%=dto.getTel() %><br>

<a href="updateui.do?id=${dto.id}">수정</a>
<a id="del" href="delete.do?id=<%= dto.getId() %>">삭제</a>

<script type="text/javascript">
$(document).ready(function() {
	$("#del").click(function(event) {
		event.preventDefault();
		var choice = confirm("정말 삭제할까요?");
		var href = $(this).attr("href");
		
		if(choice){
			location.assign(href);
		} 
	})
})
</script>

</body>
</html>