<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="dbconnect.jsp"%>
    <%
    String name1 = (String)session.getAttribute("mname");
    String idx = request.getParameter("idx");
    String w = request.getParameter("parm");
    String ct = request.getParameter("ct");
    String sql="select * from notice where nidx=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, idx);	
    ResultSet rs = ps.executeQuery();
   	String up = "update notice set ncount=?+1 where nidx=?";
	PreparedStatement ps2 = con.prepareStatement(up);
   	ps2.setString(1, ct);
   	ps2.setString(2, idx);
	ps2.executeUpdate();
    %>
<meta charset="UTF-8">
<p>공지사항 VIEW 페이지</p>
<form name="f" id="f" action="./up_notice.do" method="post" enctype="multipart/form-data">
<%while(rs.next()){%>
<div class="write_view">

<ul>
    <li>공지번호</li>
    <li><%=w %> <input type="hidden" name="nidx" id="nidx" value="<%=idx%>"> 번째 공지글</li>
</ul>
<ul>
    <li>공지사항 여부</li>

    <li>
    <% if(rs.getString("nch").equals("Y")){%>
    <label class="label_notice"><em class="cbox"><input type="checkbox"id="nch" name="nch" value="<%=rs.getString("nch")%>" checked></em> 공지 출력</label> ※ 공지출력을 체크할 시 해당 글 내용은 최상단에 노출 되어 집니다.
    <%}else{ %>
    <label class="label_notice"><em class="cbox"><input type="checkbox"id="nch" name="nch" value="<%=rs.getString("nch")%>"></em> 공지 출력</label> ※ 공지출력을 체크할 시 해당 글 내용은 최상단에 노출 되어 집니다.
    <%} %>
    </li>
   
</ul>
<ul>
    <li>공지사항 제목</li>
    <li>
        <input type="text" class="notice_input1" name="ntitle" value="<%=rs.getString("ntitle")%>"> ※ 최대 150자까지 입력이 가능
    </li>
</ul>
<ul>
    <li>글쓴이</li>
    <li>
        <input type="text" class="notice_input2" value="<%=name1 %>" name="nadminnm" readonly> ※ 관리자 이름이 노출 됩니다.       
    </li>
</ul>
<ul>
    <li>첨부파일</li>
    <li>
        <input type="file" name="nfile" id="nfile" onchange="checkFile(this)"> ※ 새로운 첨부파일 적용시 기본 첨부파일은 삭제 됩니다.
        <em class="fileview">기존 첨부 파일명 :<%=rs.getString("nfile")%> </em>
    </li>
</ul>
<ul class="ul_height">
    <li>공지내용</li>
    <li>
        <textarea class="notice_input3" placeholder="공지내용 출력" name="nnotice" value="<%=rs.getString("nnotice")%>"><%=rs.getString("nnotice")%></textarea>
    </li>
</ul>
</div>
<%} %>

<div class="board_btn">
    <button type="button" class="border_list" onclick="list()">공지목록</button>
    <button type="button" class="border_modify" onclick="modify()">공지수정</button>
    <button type="button" class="border_del" onclick="del()">공지삭제</button>
</div>
</form>
<script >

function checkFile(el) {
	var file = el.files;
	if(file[0].size > 1024 * 1024 * 2){
		alert('2MB 이하 파일만 등록할 수 있습니다.\n\n' + '현재파일 용량 : ' + (Math.round(file[0].size / 1024 / 1024 * 100) / 100) + 'MB');
    }else return;
	el.outerHTML = el.outerHTML;
}

function list() {
	location.href="./admin_notice.jsp"
	
		
}
function modify() {
	f.submit();
}
function del() {
	
	location.href="./del_notice.do?idx="+<%=idx%>
}


window.onpageshow = function(event){
	if (event.persisted || (window.performance && window.performance.navigation.type == 2) || event.originalEvent && event.originalEvent.persisted) {
		location.reload();
	}
}
</script>