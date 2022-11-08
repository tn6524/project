<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	response.setContentType("text/html;charset=utf-8");
	Connection con = null;
	try{
		String d = "com.mysql.jdbc.Driver";
		String u="jdbc:mysql://localhost/rlawlstn9812";
		String us="rlawlstn9812"; 
		String ps="mc69!54@23";
		Class.forName(d);
		con= DriverManager.getConnection(u,us,ps);
	}catch(Exception e){
		e.getMessage();
	}
%>
