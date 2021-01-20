<%@page import="kr.co.domain.MemberDAO"%>
<%@page import="kr.co.ezen.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="read.css" />
</head>
<body>
   <div id="header">
      <h2>MY PAGE</h2>
   </div>

   <div id="wrapper">

      <a>${login.id} 님의 페이지입니다.</a> &nbsp;&nbsp;&nbsp; <input type="button"
         onclick="location.href='logout.do?id=${login.id}'" value="로그아웃">
   </div>

   <div class="container">

      <input id="update"  value="마이게시글" type="button">
      <input id="mylist"  value="정보수정" type="button">
      <button class="btn btn-2" type="button"
         onclick="location.href='delete.do?id=${login.id}'" id="del">회원탈퇴</button>
   </div>

   <div class="con_box" id="contbox">
   
   <iframe></iframe>
    <script type="text/javascript" id="iframe">
    
    $(document).ready(function(){
    	
   
         $("#update").click(function(event) {
             event.preventDefault();
             $("iframe").attr("src", "updateui.do?id=${login.id}").attr("width","700px").attr("height","500")
          });
          
          $("#mylist").click(function(event) {
             event.preventDefault();
             $("iframe").attr("src", "bd_mylist.do?id=${login.id}").attr("width","800px").attr("height","1000")
          });
   
 
         $("#del").click(function() {

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
   </div>

</body>
</html>