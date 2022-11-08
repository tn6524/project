<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="dbconnect.jsp"%>
<%
request.setCharacterEncoding("utf-8");
int total=0;

String sql = "select*from notice order by nidx desc";
PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();


String sql2 = "select count(*) as ctn from notice order by nidx desc";  
PreparedStatement ps2 = con.prepareStatement(sql2);		 
ResultSet rs2 = ps2.executeQuery();
int ea = 0;
while(rs2.next()){
	ea = Integer.parseInt(rs2.getString("ctn"));
}

%>
<meta charset="UTF-8">
<form name="f" id="f" action="./notice_w.do" method="post">
<input type="hidden" name="cont" id="cont" value="0">
<p style="width: 200px;">공지사항 관리페이지</p>
<div class="subpage_view">
	<ul>
		<li><input type="checkbox" id="cbx_chkAll"></li>
		<li>NO</li>
		<li>제목</li>
		<li>글쓴이</li>
		<li>날짜</li>
		<li>조회</li>
	</ul>
	
	<%
	if(ea!=0){
	int w = ea;
	while (rs.next()) {
	
	%>
	 
	<ol>
		<li><input type="checkbox" name="chk" class="chk" value="<%=rs.getString("nidx")%>" ></li>
		
		<li><%=w%></li>
		<li><a href="admin_notice_view.jsp?idx=<%=rs.getString("nidx")%>&&parm=<%=w%>&&ct=<%=rs.getString("ncount")%>" style="color: black;" id="ct" onclick="ct()"><%=rs.getString("ntitle")%></a></li>
		<li><%=rs.getString("nadminnm")%></li>
		<li><%=rs.getString("indate").substring(0,10)%></li>
		<li><%=rs.getString("ncount")%> <input type="hidden" id="ncount" value="<%=rs.getString("ncount")%>"> </li>
	</ol>
	<%
	w--;
	total++;
	}
	}else{
			
	%>
	<ol class="none_text">
		<li>등록된 공지 내용이 없습니다.</li>
	</ol>
	<%} %>
	<input type="hidden" name="total" id="total" value="<%=total%>">
</div>

<div class="board_btn">
	<button type="button" class="border_del" onclick="qdelete()">공지삭제</button>
	<button type="button" class="border_add" onclick="qwriter()">공지등록</button>
</div>
</form>

<div class="border_page">
	<ul class="pageing">
		<li><img src="./ico/double_left.svg"></li>
		<li><img src="./ico/left.svg"></li>
		<li>1</li>
		<li><img src="./ico/right.svg"></li>
		<li><img src="./ico/double_right.svg"></li>
	</ul>
</div>

<script>
window.onpageshow = function(event){
	if (event.persisted || (window.performance && window.performance.navigation.type == 2) || event.originalEvent && event.originalEvent.persisted) {
		location.reload();
	}
}

$(function() {
	$("#cbx_chkAll").click(function() {
		if($("#cbx_chkAll").is(":checked")){
			$("input[name=chk]").prop("checked", true);
			var checked = $("input[name=chk]:checked").length;
			$("#cont").val(checked);
			console.log($("#cont").val());
		}
		else {
			$("input[name=chk]").prop("checked", false);
			$("#cont").val("0");
		}
		
	});
	
	$(".chk").click(function() {
		var ctn = $("#cont").val();
		
		var total = $("input[name=chk]").length;
		var checked = $("input[name=chk]:checked").length;
		
		if($(this).is(":checked")==true){
			$("#cont").val(Number(ctn)+1);
			console.log();
		}else{
			$("#cont").val(Number(ctn)-1);
		}
		if(total != checked) {
			$("#cbx_chkAll").prop("checked", false);
		}
		else { 
			$("#cbx_chkAll").prop("checked", true); 
			
		}
		
	});
});
function qdelete(){
	if(document.getElementById("cont").value=="0"){
		alert("삭제하실 공지를 선택하세요");
	}else{
		
	f.submit();
	}
	
}
function qwriter(){
	location.href="./admin_notice_write.jsp"
}
</script>