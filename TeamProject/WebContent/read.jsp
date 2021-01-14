<%@page import="kr.co.dao.MemberDAO"%>
<%@page import="kr.co.domain.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<h2>마이페이지</h2>

   <a>${login.id} 님의 페이지입니다.</a>
   <br>
   <br>

   <br>
   <input type="button"
      onclick="location.href='updateui.do?id=${login.id}'" value="회원정보 수정">
      
      <input type="button" onclick="location.href='list.do'"
      value="돌아가기">
      
      <br><br>
   <input type="button" onclick="location.href='logout.do?id=${login.id}'"
      value="로그아웃">
   <br>
   <br>

   <input class="del" type="button" onclick="location.href='delete.do?id=${login.id}'"
      id="del" value="회원 탈퇴">
   <br>
   
   <script type="text/javascript">
      
      $(document).ready(function(){
         
         $("#del").click(function(){
            
            var choice;
            var url = "delete.do?id=${login.id}";
            choice = confirm("정말로 탈퇴하시겠습니까?");
            
            if (choice) {
               location.replace(url);
            } else {
               location.replace("read.do?id=${login.id}");
            }
            
         });

      });
   
   </script>


</body>
</html>