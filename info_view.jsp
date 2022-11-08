
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="dbconnect.jsp"%>
<%
String name1 = (String) session.getAttribute("mname");
String id1 = (String) session.getAttribute("mid");
if(id1 == null&&name1==null || !request.isRequestedSessionIdValid()||id1.equals("")){                            // id가 Null 이거나 없을 경우
response.sendRedirect("index.html");    // 로그인 페이지로 리다이렉트 한다.
}

%>
<form name="f" id="f" action="./up_adm.do" method="post">
	<div class="admin_login_add">
		<ul>
			<li class="font_color1">관리자 정보 수정</li>
			<li><input type="text" class="add_input1" readonly name="mid"
				value="<%=id1%>"></li>
			<li><input type="text" class="add_input1"
				placeholder="변경할 패스워드를 입력하세요" name="mpass"> <input
				type="text" class="add_input1" placeholder="동일한 패스워드를 입력하세요"
				name="mpassck"><input type="hidden" name="sub"></li>

			<li class="font_color1">관리자 기본정보 입력</li>
			<li><input type="text" class="add_input1" name="mname"
				placeholder="<%=name1%>" value="<%=name1%>"></li>
			<li><input type="text" class="add_input1 emails" name="memail">
			</li>
			<li class="font_color1"><input type="text"
				class="add_input1 hp1" maxlength="3" name="tel1"
				onKeyup="this.value=this.value.replace(/[^0-9,A-Z]/g,'');">
				- <input type="text" class="add_input1 hp2" maxlength="4"
				name="tel2"
				onKeyup="this.value=this.value.replace(/[^0-9,A-Z]/g,'');">
				- <input type="text" class="add_input1 hp2" maxlength="4"
				name="tel3"
				onKeyup="this.value=this.value.replace(/[^0-9,A-Z]/g,'');">
			</li>
			<li class="font_color1">관리자 담당부서 및 직책</li>
			<li><select class="add_select1" name="mwkp">
					<option value="0">담당자 부서를 선택하세요</option>
					<option value="임원">임원</option>
					<option value="전산팀">전산팀</option>
					<option value="디자인팀">디자인팀</option>
					<option value="CS팀">CS팀</option>
					<option value="MD팀">MD팀</option>
			</select> <select class="add_select1" name="mwks">
					<option value="0">담당자 직책을 선택하세요</option>
					<option value="대표">대표</option>
					<option value="부장">부장</option>
					<option value="팀장">팀장</option>
					<option value="과장">과장</option>
					<option value="대리">대리</option>
					<option value="사원">사원</option>
			</select></li>
			<li class="font_color1">※ 아이디 외에 모든 정보는 수정 할 수 있습니다.</li>
		</ul>
		<span class="admin_addbtn">
			<button type="button" class="btn_button btncolor1" title="관리자 등록"
				onclick="update_admin()">정보 수정</button>
				<button type="button" class="btn_button btncolor2" style="background-color: black;" title="관리자 삭제"
				onclick="del_admin()">관리자 삭제</button>
		</span>
	</div>
	<script type="text/javascript">
	function del_admin() {
		location.href="./del_admin.do?mid="+f.mid.value;
	}
	function update_admin() {
	if (f.mpass.value == "") {
			alert("비밀번호를 입력해주세요");
		} else if (f.mpassck.value == "") {
			alert("비밀번호를 입력해주세요");
		} else if (f.memail.value == "") {
			alert("이메일을 입력해주세요");
		} else if (f.tel1.value == "" || f.tel2.value == ""
				|| f.tel3.value == "") {
			alert("전화번호를 입력해주세요");
		} else if (f.mwkp.value == "0") {
			alert("담당자 부서를 선택하세요");
		} else if (f.mwks.value == "0") {
			alert("담당자 직책을 선택하세요");
		} else {
			if (f.mpass.value != f.mpassck.value) {
				alert("패스워드가 일치하지 않습니다.");
			} else {
				f.submit();
			}
		}
	}</script>
</form>
