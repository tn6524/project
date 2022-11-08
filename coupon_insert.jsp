<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<p>쇼핑몰 관리 페이지</p>
<form name="f" id="f" action="./insert_cp.do" method="post"
	enctype="multipart/form-data">
	<div class="subpage_view" style="margin-top: 25px;">
		<span style="height: 35px; border-bottom: 1px solid #ccc;">※ 신규
			쿠폰등록 </span> <span>
			<ol class="coupon_in">
				<li>쿠폰명</li>
				<li><input type="text" class="inputs coupon_intext4"
					maxlength="40" name="cname"> ※ 쿠폰명은 최대 40자까지 입력이 가능합니다.</li>
			</ol>
			<ol class="coupon_in">
				<li>쿠폰종류</li>
				<li><input type="text" class="inputs coupon_intext1"
					maxlength="40" name="csort"> ※ 쿠폰종류를 입력해 주세요 (상품할인, 배송비할인)</li>
			</ol>
			<ol class="coupon_in">
				<li>사용 시작일</li>
				<li><input type="date" class="inputs coupon_intext1"
					maxlength="10" name="cstart"> ※ 클릭시 해당 시작을 캘린더에서 선택 하세요</li>
			</ol>
			<ol class="coupon_in">
				<li>사용 종료일</li>
				<li><input type="date" class="inputs coupon_intext1"
					maxlength="10" name="cend" id="cend"> ※ 종료 일자 이후에는 쿠폰은 더 이상
					사용되지 않습니다.</li>
			</ol>
			<ol class="coupon_in">
				<li>쿠폰타입</li>
				<li><select class="inputs coupon_intext2" name="ctype"
					onchange="re()">
						<option value="">쿠폰 타입 선택</option>
						<option value="정액할인">정액할인</option>
						<option value="정률할인">정률할인</option>
				</select> ※ 정액할인 일 경우 할인 금액을 입력해야 하며, 정률 할인 일 경우 할인율 % 값을 입력하세요</li>
			</ol>
			<ol class="coupon_in">
				<li>할인금액 및 할인율</li>
				<li><input type="text" name="csale"
					class="inputs coupon_intext1"
					onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"> ※
					정률할인 일 경우 숫자 100 이상 입력이 안됩니다.</li>
			</ol>
			<ol class="coupon_in">
				<li>최소 주문금액</li>
				<li><input type="text" name="cminpay"
					class="inputs coupon_intext1"
					onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"> ※
					해당 쿠폰은 최소 주문금액이 되어야만 사용이 가능합니다. (최소 10000 이상 부터 입력이 가능합니다.)</li>
			</ol>
			<ol class="coupon_in">
				<li>쿠폰이미지 등록</li>
				<li><input type="file" name="cimg" id="cimg"
					onchange="checkFile(this)"> ※ 쿠폰이미지는 최소 2MB 이하 이미지만 사용가능
					합니다.</li>
			</ol>
		</span> <span><input type="button" value="쿠폰 리스트"
			class="shopping_btn2" title="쿠폰 리스트" onclick="cp_list()"><input
			type="button" value="등록 완료" class="shopping_btn" title="등록 완료"
			onclick="insert()"></span>
	</div>
</form>
<script type="text/javascript">
function re() {
	f.csale.value="0";
}
function checkFile(el) {
	var file = el.files;
	if(file[0].size > 1024 * 1024 * 2){
		alert('2MB 이하 파일만 등록할 수 있습니다.\n\n' + '현재파일 용량 : ' + (Math.round(file[0].size / 1024 / 1024 * 100) / 100) + 'MB');
    }else return;
	el.outerHTML = el.outerHTML;

}
function cp_list() {
	location.href="./admin_shopping.jsp";
}
function insert() {
	if(f.cname.value==""){
		alert("쿠폰명을 입력해주세요");
	}else if(f.csort.value==""){
		alert("쿠폰종류를 입력해주세요");
	}else if(f.cstart.value==""){
		alert("사용시작일을 선택해주세요");
	}else if(f.cend.value==""){
		alert("사용종료일을 선택해주세요");
	}else if(f.ctype.value==""){
		alert("쿠폰타입을 선택해주세요");
	}else if(f.cminpay.value==""){
		alert("쿠폰최소금액을 입력해주세요");
	}else if(f.cminpay.value<10000){
		alert("최소 10000 이상 부터 입력이 가능합니다.");
		f.cminpay.value="";
	}else if(f.cstart.value>f.cend.value){
		alert("날짜를 다시 선택해주세요");
		document.getElementById("cend").value="";
	}
	else{
			if((f.ctype.value=="정액할인" || f.ctype.value=="정률할인") && f.csale.value=="0"){
				alert("할인 금액 또는 할인율을 입력해주세요");
				f.csale.focus();
			}else{
				if(f.ctype.value=="정률할인" && f.csale.value>=100){
					alert("정률할인 일경우 숫자 100이상 입력이 안됩니다.");
					f.csale.value="0";
				}
				else{
					f.submit();	
				}
						
				}
	}

	
}
					
				
			
	




</script>