function cancel2(){
	alert("취소되었습니다.");
	location.href="./admin_config.jsp";
}
function save(){
	if(f.pgnm.value==""||f.pgnm.value==null){
		alert("홈페이지 제목을 입력하세요");
	}else if(f.admmail.value==""){
		alert("관리자 메일 주소를 입력하세요");
	}else if(f.pointok.value==""){
		alert("포인트 사용 유/무를 선택하세요");
	}else if(f.joinmn.value==""){
		alert("회원가입시 적립금을 입력해주세요");
	}else if(f.compnm.value==""){
		alert("회사명을 입력해주세요");
	}else if(f.bsnum.value==""){
		alert("사업자 등록번호를 입력해주세요");
	}else if(f.bossnm.value==""){
		alert("대표자명을 입력해주세요");
	}else if(f.bosstel.value==""){
		alert("대표 전화번호를 입력해주세요");
	}else if(f.postnum.value==""){
		alert("사업장 우편번호를 입력해주세요");
	}else if(f.post.value==""){
		alert("사업장 주소를 입력해주세요");
	}else if(f.infomag.value==""){
		alert("정보관리책임자명을 입력해주세요");
	}else if(f.infomail.value==""){
		alert("적보책임자 E-mail을 입력해주세요");
	}else if(f.bank.value==""){
		alert("무통장 은행 사용시 사용할 은행을 입력해주세요");
	}else if(f.banknum.value==""){
		alert("은행 계좌번호를 입력해주세요");
	}else if(f.card.value==""){
		alert("신용카드 결제 사용 여부를 선택해주세요");
	}else if(f.phone.value==""){
		alert("휴대폰 결제 사용 여부를 선택해주세요");
	}else if(f.voucher.value==""){
		alert("도서상품권 결제 사용 여부를 선택해주세요");
	}else if(f.minppt.value==""){
		alert("결제 최소포인트를 입력해주세요");
	}else if(f.maxppt.value==""){
		alert("결제 최대포인트를 입력해주세요");
	}else if(f.receiptok.value==""){
		alert("현금 영수증 발급사용 여부를 선택해주세요");
	}else if(f.divnm.value==""){
		alert("배송업체명을 입력해주세요");
	}else if(f.divpay.value==""){
		alert("배송비 가격을 입력해주세요");
	}else if(f.divdate.value==""){
		alert("희망배송일 사용 여부를 선택해주세요");
	}else if(f.joinlv.value==""){
		alert("회원가입시 권한 레벨을 입력해주세요");
	}else{
			f.submit();
			}
}