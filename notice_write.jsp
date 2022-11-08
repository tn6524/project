<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String name1 = (String) session.getAttribute("mname");
%>
<meta charset="UTF-8">
<p style="width: 200px;">공지사항 등록페이지</p>
<form name="f" id="f" method="post" action="./admin_write.do" enctype="multipart/form-data">

<div class="write_view">
<ul>
    <li>공지사항 여부</li>
    <li>
        <label class="label_notice"><em class="cbox" >
        <input  type="checkbox" id="nch" name="nch" value="Y"></em> 공지 출력</label> ※ 공지출력을 체크할 시 해당 글 내용은 최상단에 노출 되어 집니다.
        
    </li>
</ul>
<ul>
    <li>공지사항 제목</li>
    <li>
        <input type="text" class="notice_input1" name="ntitle"> ※ 최대 150자까지 입력이 가능
    </li>
</ul>
<ul>
    <li>글쓴이</li>
    <li>
        <input type="text" class="notice_input2" value="<%=name1%>" name="nadminnm" readonly> ※ 관리자 이름이 노출 됩니다.       
    </li>
</ul>
<ul>
    <li>첨부파일</li>
    <li>
        <input type="file" name="nfile" id="nfile" onchange="checkFile(this)"> ※ 첨부파일 최대 용량은 2MB 입니다.       
    </li>
</ul>
<ul class="ul_height">
    <li>공지내용</li>
    <li>
        <textarea class="notice_input3" placeholder="공지내용을 입력하세요!" name="nnotice"></textarea>
    </li>
</ul>
</div>
</form>
<div class="board_btn">
    <button class="border_del" onclick="list()">공지목록</button>
    <button class="border_add" onclick="qwrite()">공지등록</button>
</div>

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


function qwrite() {
	if(f.ntitle.value==""){
		alert("공지제목을 입력해주세요");
	}else if(f.nnotice.value==""){
		alert("공지내용을 입력해주세요");
	}
	else{
	f.submit();
	
	}
}
</script>