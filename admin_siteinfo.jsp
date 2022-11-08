<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp"%>

<%
request.setCharacterEncoding("utf-8");
String sql = "select * from page";
PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
String sql2 = "select count(*) as ctn from page";  
PreparedStatement ps2 = con.prepareStatement(sql2);		 
ResultSet rs2 = ps2.executeQuery();

	int ea = 0;
while(rs2.next()){
	ea = Integer.parseInt(rs2.getString("ctn"));
}

 %>
<meta charset="UTF-8">
<script src="./admin_up.js"></script>
<p style="width: 200px;">홈페이지 가입환경 설정</p>
<%  
if(ea!=0){
while(rs.next()){ %>
<form name="ff" id="ff" method="post" action="./admin_con_update.do">

	<div class="subpage_view">
		<ul class="info_form">
			<li>홈페이지 제목</li>
			<li><input type="text" class="in_form1" name="pgnm" id="pgnm" value="<%=rs.getString("pgnm")%>">
			</li>
		</ul>
	
		<ul class="info_form">
			<li>관리자 메일 주소</li>
			<li><input type="text" class="in_form2" name="admmail"
				id="admmail" value="<%=rs.getString("admmail")%>"> ※ 관리자가 보내고 받는 용도로 사용하는 메일 주소를
				입력합니다.(회원가입,인증메일,회원메일발송 등에서 사용)</li>
		</ul>
		<ul class="info_form">
			<li>포인트 사용 유/무</li>
			<li class="checkcss">
			<%
			if(rs.getString("pointok").equals("Y")){%>
			<em><label ><input type="radio"
						value="Y" class="ckclass" name="pointok" id="pointok" checked>포인트
						
						사용</label></em>
				
					
						 <em><label><input type="radio" value="N"
						class="ckclass" name="pointok" id="pointno" >포인트
						미사용</label></em>
				<% }else {%>	
				<em><label ><input type="radio"
						value="Y" class="ckclass" name="pointok" id="pointok" >포인트
						
						사용</label></em>
				
					
						 <em><label><input type="radio" value="N"
						class="ckclass" name="pointok" id="pointno" checked>포인트
						미사용</label></em>
						<% } %>	
						</li>
			
		</ul>
		<ul class="info_form2"
			style="border-bottom: 1px solid rgb(81, 61, 61);">
			<li>회원가입시 적립금</li>
			<li><input type="text" class="in_form3" maxlength="5"
				name="joinmn" id="joinmn"
				onKeyup="this.value=this.value.replace(/[^0-9,A-Z]/g,'');" value="<%=rs.getString("joinmn")%>">
				점</li>
				<%String jolv = rs.getString("joinlv");
				String duty = "";
				switch (jolv) {
				case "일반회원":
					duty = "1";
					break;
				case "실버회원":
					duty = "2";
					break;
				case "골드회원":
					duty = "3";
					break;
				case "VIP회원":
					duty = "4";
					break;
				case "사내직원":
					duty = "5";
					break;
				case "관리자":
					duty = "9";
					break;
				}
					%>
				
			<li>회원가입시 권한레벨</li>
			<li><input type="text" class="in_form3" maxlength="1"
				name="joinlv" id="joinlv"
				onKeyup="this.value=this.value.replace(/[^1-5,9,A-Z]/g,'');" value="<%=duty%>">
				레벨</li>
		</ul>
	</div>
	<p>홈페이지 기본환경 설정</p>
	<div class="subpage_view">
		<ul class="info_form2">
			<li>회사명</li>
			<li><input type="text" class="in_form0" name="compnm"
				id="compnm" value="<%=rs.getString("compnm")%>"></li>
			<li>사업자등록번호</li>
			<li><input type="text" class="in_form0" name="bsnum" id="bsnum"
				onKeyup="this.value=this.value.replace(/[^0-9,A-Z,-]/g,'');" value="<%=rs.getString("bsnum")%>">
			</li>
		</ul>
		<ul class="info_form2">
			<li>대표자명</li>
			<li><input type="text" class="in_form0" name="bossnm"
				id="bossnm" value="<%=rs.getString("bossnm")%>"></li>
			<li>대표전화번호</li>
			<li><input type="text" class="in_form0" name="bosstel"
				id="bosstel" maxlength="11"
				onKeyup="this.value=this.value.replace(/[^0-9,A-Z]/g,'');" value="<%=rs.getString("bosstel")%>">
			</li>
		</ul>
		<ul class="info_form2">
			<li>통신판매업 신고번호</li>
			<li><input type="text" class="in_form0" name="reportnum"
				id="reportnum" value="<%=rs.getString("reportnum")%>"></li>
			<li>부가통신 사업자번호</li>
			<li><input type="text" class="in_form0" name="stbnum"
				id="stbnum"
				onKeyup="this.value=this.value.replace(/[^0-9,A-Z,-]/g,'');" value="<%=rs.getString("stbnum")%>">
			</li>
		</ul>
		<ul class="info_form2">
			<li>사업장 우편번호</li>
			<li><input type="text" class="in_form0" name="postnum"
				id="postnum"
				onKeyup="this.value=this.value.replace(/[^0-9,A-Z]/g,'');" value="<%=rs.getString("postnum")%>">
			</li>
			<li>사업장 주소</li>
			<li><input type="text" class="in_form2" name="post" id="post" value="<%=rs.getString("post")%>">
			</li>
		</ul>
		<ul class="info_form2"
			style="border-bottom: 1px solid rgb(81, 61, 61);">
			<li>정보관리책임자명</li>
			<li><input type="text" class="in_form0" name="infomag"
				id="infomag" value="<%=rs.getString("infomag")%>"></li>
			<li>정보책임자 E-mail</li>
			<li><input type="text" class="in_form1" name="infomail"
				id="infomail" value="<%=rs.getString("infomail")%>"></li>
		</ul>
	</div>
	<p>결제 기본환경 설정</p>
	<div class="subpage_view">
		<ul class="info_form2">
			<li>무통장 은행</li>
			<li><input type="text" class="in_form0" name="bank" id="bank" value="<%=rs.getString("bank")%>">
			</li>
			<li>은행계좌번호</li>
			<li><input type="text" class="in_form1" name="banknum"
				id="banknum"
				onKeyup="this.value=this.value.replace(/[^0-9,A-Z]/g,'');" value="<%=rs.getString("banknum")%>">
			</li>
		</ul>
		<ul class="info_form">
			<li>신용카드 결제 사용</li>
			<li class="checkcss">
			<%
			if(rs.getString("card").equals("Y")){
				
				%>
			<em><label><input type="radio"
						value="Y" class="ckclass" name="card" id="card" checked> 사용</label></em> <em><label><input
						type="radio" value="N" class="ckclass" name="card" id="card"
						> 미사용</label></em> ※ 해당 PG사가 있을 경우 사용으로 변경합니다.
						<%}else{ %>
						<em><label><input type="radio"
						value="Y" class="ckclass" name="card" id="card"> 사용</label></em> <em><label><input
						type="radio" value="N" class="ckclass" name="card" id="card" checked
						> 미사용</label></em> ※ 해당 PG사가 있을 경우 사용으로 변경합니다.
						<%} %>
						</li>
						
		</ul>
		<ul class="info_form">
			<li>휴대폰 결제 사용</li>
			<li class="checkcss">
			<%
			if(rs.getString("phone").equals("Y")){
				
				%>
			<em><label><input type="radio"
						value="Y" class="ckclass" name="phone" id="phone" checked="checked"> 사용</label></em> <em><label><input
						type="radio" value="N" class="ckclass" name="phone" id="phone"
						> 미사용</label></em>
						
						 ※ 주문시 휴대폰 결제를 가능하게 할 것인지를 설정합니다.<%}else{ %><em><label><input type="radio"
						value="Y" class="ckclass" name="phone" id="phone"> 사용</label></em> <em><label><input
						type="radio" value="N" class="ckclass" name="phone" id="phone"
						 checked="checked"> 미사용</label></em>
						
						 ※ 주문시 휴대폰 결제를 가능하게 할 것인지를 설정합니다.
						 <%} %>
						 </li>
		</ul>
		<ul class="info_form">
			<li>도서상품권 결제사용</li>
			<li class="checkcss">
			<%
			if(rs.getString("voucher").equals("Y")){
				
				%><em><label><input type="radio"
						value="Y" class="ckclass" name="voucher" id="voucher" checked="checked"> 사용</label></em>
				<em><label><input type="radio" value="N"
						class="ckclass" name="voucher" id="voucher" > 미사용</label></em>
						
				※ 도서상품권 결제만 적용이 되며, 그 외에 상품권은 결제 되지 않습니다.<%}else{ %><em><label><input type="radio"
						value="Y" class="ckclass" name="voucher" id="voucher"> 사용</label></em>
				<em><label><input type="radio" value="N"
						class="ckclass" name="voucher" id="voucher" checked="checked"> 미사용</label></em>
						
				※ 도서상품권 결제만 적용이 되며, 그 외에 상품권은 결제 되지 않습니다.<%} %> </li>
		</ul>
		<ul class="info_form2">
			<li>결제 최소 포인트</li>
			<li><input type="text" class="in_form0" maxlength="5"
				name="minppt" id="minppt"
				onKeyup="this.value=this.value.replace(/[^0-9,A-Z]/g,'');" value="<%=rs.getString("minppt")%>">
				점</li>
			<li>결제 최대 포인트</li>
			<li><input type="text" class="in_form0" maxlength="5"
				name="maxppt" id="maxppt"
				onKeyup="this.value=this.value.replace(/[^0-9,A-Z]/g,'');" value="<%=rs.getString("maxppt")%>">
				점</li>
		</ul>
		<ul class="info_form">
			<li>현금 영수증 발급사용</li>
			<li class="checkcss">
			<%
			if(rs.getString("receiptok").equals("Y")){
				
				%><em><label><input type="radio"
						value="Y" class="ckclass" name="receiptok" id="receiptok" checked="checked">
						사용</label></em> <em><label><input type="radio" value="N"
						class="ckclass" name="receiptok" id="receiptok" >
						미사용</label></em> ※ 현금영수증 관련 사항은 PG사 가입이 되었을 경우 사용가능 합니다.<%}else{ %><em><label><input type="radio"
						value="Y" class="ckclass" name="receiptok" id="receiptok">
						사용</label></em> <em><label><input type="radio" value="N"
						class="ckclass" name="receiptok" id="receiptok" checked="checked">
						미사용</label></em> ※ 현금영수증 관련 사항은 PG사 가입이 되었을 경우 사용가능 합니다.<%} %></li>
		</ul>
		<ul class="info_form2">
			<li>배송업체명</li>
			<li><input type="text" class="in_form0" name="divnm" id="divnm" value="<%=rs.getString("shipnm")%>">
			</li>
			<li>배송비 가격</li>
			<li><input type="text" class="in_form0" maxlength="7"
				name="divpay" id="divpay"
				onKeyup="this.value=this.value.replace(/[^0-9,A-Z]/g,'');" value="<%=rs.getString("divpay")%>">
				원</li>
		</ul>
		<ul class="info_form"
			style="border-bottom: 1px solid rgb(81, 61, 61);">
			<li>희망배송일</li>
			<li class="checkcss">
			<%
			if(rs.getString("divdate").equals("Y")){
				
				%>
			<em><label><input type="radio"
						value="Y" class="ckclass" name="divdate" id="divdate" checked="checked"> 사용</label></em>
				<em><label><input type="radio" value="N"
						class="ckclass" name="divdate" id="divdate" > 미사용</label></em>
				※ 희망배송일 사용시 사용자가 직접 설정 할 수 있습니다.<%}else{ %><em><label><input type="radio"
						value="Y" class="ckclass" name="divdate" id="divdate"> 사용</label></em>
				<em><label><input type="radio" value="N"
						class="ckclass" name="divdate" id="divdate" checked="checked"> 미사용</label></em>
				※ 희망배송일 사용시 사용자가 직접 설정 할 수 있습니다.<%} %></li>
		</ul>
	</div>
	<div class="btn_div">
		<button type="button" class="sub_btn1" title="설정 저장" onclick="update()">설정
			저장</button>
		<button type="button" class="sub_btn2" title="저장 취소"
			onclick="cancel3()">저장 취소</button>
	</div>
	<%}
}else{
%> 
<script src="./admin.js"></script>
<form name="f" id="f" action="./admin_con.do" method="post">
<div class="subpage_view">
		<ul class="info_form">
			<li>홈페이지 제목</li>
			<li><input type="text" class="in_form1" name="pgnm" id="pgnm" >
			</li>
		</ul>
	
		<ul class="info_form">
			<li>관리자 메일 주소</li>
			<li><input type="text" class="in_form2" name="admmail"
				id="admmail" > ※ 관리자가 보내고 받는 용도로 사용하는 메일 주소를
				입력합니다.(회원가입,인증메일,회원메일발송 등에서 사용)</li>
		</ul>
		<ul class="info_form">
			<li>포인트 사용 유/무</li>
			<li class="checkcss">
					<em><label ><input type="radio"
						value="Y" class="ckclass" name="pointok" id="pointok" >포인트
						
						사용</label></em>
				
					
						 <em><label><input type="radio" value="N"
						class="ckclass" name="pointok" id="pointno" >포인트
						미사용</label></em>
						
						</li>
			
		</ul>
		<ul class="info_form2"
			style="border-bottom: 1px solid rgb(81, 61, 61);">
			<li>회원가입시 적립금</li>
			<li><input type="text" class="in_form3" maxlength="5"
				name="joinmn" id="joinmn"
				onKeyup="this.value=this.value.replace(/[^0-9,A-Z]/g,'');">
				점</li>
				
				
			<li>회원가입시 권한레벨</li>
			<li><input type="text" class="in_form3" maxlength="1"
				name="joinlv" id="joinlv"
				onKeyup="this.value=this.value.replace(/[^1-5,9,A-Z]/g,'');" >
				레벨</li>
		</ul>
	</div>
	<p>홈페이지 기본환경 설정</p>
	<div class="subpage_view">
		<ul class="info_form2">
			<li>회사명</li>
			<li><input type="text" class="in_form0" name="compnm"
				id="compnm" ></li>
			<li>사업자등록번호</li>
			<li><input type="text" class="in_form0" name="bsnum" id="bsnum"
				onKeyup="this.value=this.value.replace(/[^0-9,A-Z,-]/g,'');" >
			</li>
		</ul>
		<ul class="info_form2">
			<li>대표자명</li>
			<li><input type="text" class="in_form0" name="bossnm"
				id="bossnm" ></li>
			<li>대표전화번호</li>
			<li><input type="text" class="in_form0" name="bosstel"
				id="bosstel" maxlength="11"
				onKeyup="this.value=this.value.replace(/[^0-9,A-Z]/g,'');" >
			</li>
		</ul>
		<ul class="info_form2">
			<li>통신판매업 신고번호</li>
			<li><input type="text" class="in_form0" name="reportnum"
				id="reportnum" ></li>
			<li>부가통신 사업자번호</li>
			<li><input type="text" class="in_form0" name="stbnum"
				id="stbnum"
				onKeyup="this.value=this.value.replace(/[^0-9,A-Z,-]/g,'');" >
			</li>
		</ul>
		<ul class="info_form2">
			<li>사업장 우편번호</li>
			<li><input type="text" class="in_form0" name="postnum"
				id="postnum"
				onKeyup="this.value=this.value.replace(/[^0-9,A-Z]/g,'');" >
			</li>
			<li>사업장 주소</li>
			<li><input type="text" class="in_form2" name="post" id="post" >
			</li>
		</ul>
		<ul class="info_form2"
			style="border-bottom: 1px solid rgb(81, 61, 61);">
			<li>정보관리책임자명</li>
			<li><input type="text" class="in_form0" name="infomag"
				id="infomag" ></li>
			<li>정보책임자 E-mail</li>
			<li><input type="text" class="in_form1" name="infomail"
				id="infomail" ></li>
		</ul>
		
	</div>
	<p>결제 기본환경 설정</p>
	<div class="subpage_view">
		<ul class="info_form2">
			<li>무통장 은행</li>
			<li><input type="text" class="in_form0" name="bank" id="bank" >
			</li>
			<li>은행계좌번호</li>
			<li><input type="text" class="in_form1" name="banknum"
				id="banknum"
				onKeyup="this.value=this.value.replace(/[^0-9,A-Z]/g,'');" >
			</li>
		</ul>
		<ul class="info_form">
			<li>신용카드 결제 사용</li>
			<li class="checkcss">
			
			<em><label><input type="radio"
						value="Y" class="ckclass" name="card" id="card" > 사용</label></em> <em><label><input
						type="radio" value="N" class="ckclass" name="card" id="card"
						> 미사용</label></em> ※ 해당 PG사가 있을 경우 사용으로 변경합니다.
						
						</li>
						
		</ul>
		<ul class="info_form">
			<li>휴대폰 결제 사용</li>
			<li class="checkcss">
			
			<em><label><input type="radio"
						value="Y" class="ckclass" name="phone" id="phone" > 사용</label></em> <em><label><input
						type="radio" value="N" class="ckclass" name="phone" id="phone"
						> 미사용</label></em>
						
						 ※ 주문시 휴대폰 결제를 가능하게 할 것인지를 설정합니다.
						 </li>
		</ul>
		<ul class="info_form">
			<li>도서상품권 결제사용</li>
			<li class="checkcss">
			<em><label><input type="radio"
						value="Y" class="ckclass" name="voucher" id="voucher" > 사용</label></em>
				<em><label><input type="radio" value="N"
						class="ckclass" name="voucher" id="voucher" > 미사용</label></em>
						
				※ 도서상품권 결제만 적용이 되며, 그 외에 상품권은 결제 되지 않습니다. </li>
		</ul>
		<ul class="info_form2">
			<li>결제 최소 포인트</li>
			<li><input type="text" class="in_form0" maxlength="5"
				name="minppt" id="minppt"
				onKeyup="this.value=this.value.replace(/[^0-9,A-Z]/g,'');" >
				점</li>
			<li>결제 최대 포인트</li>
			<li><input type="text" class="in_form0" maxlength="5"
				name="maxppt" id="maxppt"
				onKeyup="this.value=this.value.replace(/[^0-9,A-Z]/g,'');" >
				점</li>
		</ul>
		<ul class="info_form">
			<li>현금 영수증 발급사용</li>
			<li class="checkcss">
			<em><label><input type="radio"
						value="Y" class="ckclass" name="receiptok" id="receiptok" >
						사용</label></em> <em><label><input type="radio" value="N"
						class="ckclass" name="receiptok" id="receiptok" >
						미사용</label></em> ※ 현금영수증 관련 사항은 PG사 가입이 되었을 경우 사용가능 합니다.</li>
		</ul>
		<ul class="info_form2">
			<li>배송업체명</li>
			<li><input type="text" class="in_form0" name="divnm" id="divnm" >
			</li>
			<li>배송비 가격</li>
			<li><input type="text" class="in_form0" maxlength="7"
				name="divpay" id="divpay"
				onKeyup="this.value=this.value.replace(/[^0-9,A-Z]/g,'');" >
				원</li>
		</ul>
		<ul class="info_form"
			style="border-bottom: 1px solid rgb(81, 61, 61);">
			<li>희망배송일</li>
			<li class="checkcss">
			
			<em><label><input type="radio"
						value="Y" class="ckclass" name="divdate" id="divdate"> 사용</label></em>
				<em><label><input type="radio" value="N"
						class="ckclass" name="divdate" id="divdate" > 미사용</label></em>
				※ 희망배송일 사용시 사용자가 직접 설정 할 수 있습니다.</li>
		</ul>
	</div>
	<div class="btn_div">
		<button type="button" class="sub_btn1" title="설정 저장" onclick="save1()">설정
			저장</button>
		<button type="button" class="sub_btn2" title="저장 취소"
			onclick="cancel2()">저장 취소</button>
	</div>
	</form>
	<%} %>
	
	
</form>