<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String name = (String) session.getAttribute("mname");
String id = (String) session.getAttribute("mid");
if(id == null&&name==null || !request.isRequestedSessionIdValid()||id.equals("")){                            // id가 Null 이거나 없을 경우
response.sendRedirect("index.html");    // 로그인 페이지로 리다이렉트 한다.
}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쇼핑몰 환경설정</title>
    <link rel="stylesheet" type="text/css" href="./css/basic.css">
    <link rel="stylesheet" type="text/css" href="./css/login.css?v=1">
    <link rel="stylesheet" type="text/css" href="./css/main.css">
    <link rel="stylesheet" type="text/css" href="./css/notice.css?v=5">
    <link rel="icon" href="./img/logo.png" sizes="128x128">
    <link rel="icon" href="./img/logo.png" sizes="64x64">
    <link rel="icon" href="./img/logo.png" sizes="32x32">
    <link rel="icon" href="./img/logo.png" sizes="16x16">
    <script src="../js/jquery.js"></script>
</head>
<body>
<header class="headercss">
<%@include file="./admin_header.html" %>
</header>
<nav class="navcss">
<%@include file="./admin_menu.jsp" %>
</nav>
<main class="maincss">
<section style="height: auto;">
<%@include file="./notice_view.jsp" %>
</section>
</main>
<footer class="main_copyright">
<%@include file="./admin_footer.html" %>
</footer>
</body>
</html>