<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-compatibe" content="ie=edge,chrome=1">
<title>로그아웃 완료</title>

</head>
<body >
<% 
String name = (String)session.getAttribute("mname");
String id = (String)session.getAttribute("mid");
 session.removeAttribute(name);
 session.removeAttribute(id);
 session.invalidate();
 PrintWriter pw = response.getWriter();
if(id == null&&name==null || !request.isRequestedSessionIdValid()){
 pw.write("<script>alert('로그아웃 되었습니다.'); location.href='./index.html'</script>");
}
 %>
</body>



</html>