<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./dbconnect.jsp"%>
<%
request.setCharacterEncoding("utf-8");
request.getParameter("mid");
String sql = "select * from admin order by midx desc";
PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();



String sql2 = "select count(*) as ctn from admin order by midx desc";
PreparedStatement ps2 = con.prepareStatement(sql2);
ResultSet rs2 = ps2.executeQuery();

int ea = 0;
while (rs2.next()) {
	ea = Integer.parseInt(rs2.getString("ctn"));
}
%>
<meta charset="UTF-8">
<p>신규등록 관리자</p>
<form name="f" id="f" action="./ok_admin.do">

	<ol class="new_admin_title">
		<li>NO</li>
		<li>관리자명</li>
		<li>아이디</li>
		<li>전화번호</li>
		<li>이메일</li>
		<li>담당부서</li>
		<li>담당직책</li>
		<li>가입일자</li>
		<li>승인여부</li>
	</ol>
	<%
	if (ea == 0) {
	%>
	<ol class="new_admin_none">
		<li>신규 등록된 관리자가 없습니다.</li>
	</ol>
	<%
	} else {
	%>
	<%
	int w = ea;
	while (rs.next()) {
	%>
	<input type="hidden" id="enum" name="enum"
			value="<%=rs.getString("menum")%>">
	<ol class="new_admin_lists">
		<li><%=w%></li>
		<li><%=rs.getString("mname")%></li>
		<li><%=rs.getString("mid")%></li>
		<li><%=rs.getString("mtel")%></li>
		<li><%=rs.getString("memail")%></li>
		<li><%=rs.getString("mwkp")%></li>
		<li><%=rs.getString("mwks")%></li>
		<li><%=rs.getString("mindate").substring(0, 10)%></li>
		<li><input type="button" value="승인" class="new_addbtn1" 
			title="승인" onclick="ok('<%=rs.getString("mid")%>','<%=rs.getString("menum")%>')"> <input
			type="button" value="미승인" class="new_addbtn2"   title="미승인"
			onclick="no('<%=rs.getString("mid")%>','<%=rs.getString("menum")%>')"></li>
	</ol>
	<%
	w--;
	}
	}
	%>
</form>
<script>
	function ok(mid,menum) {

		var http;
		if (window.XMLHttpRequest) {
			http = new XMLHttpRequest();
		}
		http.onreadystatechange = function(data) {
			if (http.readyState == XMLHttpRequest.DONE) {
				if (http.status == 200) {
					var result = http.response;
					if (result == "no") {
					} else {
						if(menum=="N"){
						alert("승인되었습니다.");
						location.reload();
					}else{							
					alert("승인된아이디입니다.");
					}
					}
				}

			}
		}
		http.open("GET", "./ok_admin.do?mid=" + mid, true);
		http.send();

	}

	function no(mid,menum) {
		var http;
		if (window.XMLHttpRequest) {
			http = new XMLHttpRequest();
		}
		http.onreadystatechange = function(data) {
			if (http.readyState == XMLHttpRequest.DONE) {
				if (http.status == 200) {
					var result = http.response;
					if (result == "no") {
					} else {
						if(menum=="N"){
							alert("미승인되었습니다.");
							location.reload();
						}else{							
						alert("승인된아이디입니다.");
						}
					}
				}

			}
		}
		http.open("GET", "./non_admin.do?mid=" + mid, true);
		http.send();
	}
</script>
