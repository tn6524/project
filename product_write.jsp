<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="dbconnect.jsp"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<p>상품 등록 페이지</p>
<form name="f" id="f" method="post" action="./insert_pro.do"
	enctype="multipart/form-data">
	<div class="product_insert">
		<ul>
			<li>대메뉴 카테고리</li>
			<li><input type="text" class="product_input1" id="BMcate"
				name="BMcate"></li>
		</ul>
		<ul>
			<li>소메뉴 카테고리</li>
			<li><input type="text" class="product_input1" id="SMcate"
				name="SMcate"></li>
		</ul>
		<ul>
			<li>상품코드</li>
			<li><input type="text" class="product_input1" name="code"
				id="code" maxlength="6"
				onKeyup="this.value=this.value.replace(/[^0-9,A-Z]/g,'');">
				<input type="button" value="중복확인" title="중복확인" class="product_btn"
				onclick="codeck()"> <input type="hidden" name="codeok" id="codeok"
				value=""></li>
		</ul>
		<ul>
			<li>상품명</li>
			<li><input type="text" class="product_input2" name="proname"
				id="proname" maxlength="100"> <span class="help_text">※
					상품명은 최대 100자까지만 적용할 수 있습니다.</span></li>
		</ul>
		<ul>
			<li>상품 부가설명</li>
			<li><input type="text" name="plusinfo" id="plusinfo"
				class="product_input4" maxlength="200"> <span
				class="help_text">※ 상품명은 최대 200자까지만 적용할 수 있습니다.</span></li>
		</ul>
		<ul>
			<li>판매가격</li>
			<li><input type="text" class="product_input3" maxlength="7"
				name="payment" id="payment"
				onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"> <span
				class="help_text">※ , 없이 숫자만 입력하세요 최대 7자리</span></li>
		</ul>
		<ul>
			<li>할인율</li>
			<li><input type="text" class="product_input3" name="sale"
				id="sale" maxlength="2" value="0"
				onkeyup="calcs(this.value),this.value=this.value.replace(/[^0-9]/g,'');">%
				<span class="help_text">※ 숫자만 입력하세요</span></li>
		</ul>
		<ul>
			<li>할인가격</li>
			<li><input type="text" class="product_input3" maxlength="7"
				id="paysale" name="paysale" value="0" readonly> <span
				class="help_text">※ 할인율이 0%일 경우 할인가격은 0으로 처리 합니다.</span></li>
		</ul>
		<ul>
			<li>상품재고</li>
			<li><input type="text" class="product_input3" maxlength="4"
				value="0" name="save_pro" id="save_pro"
				onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">EA <span
				class="help_text">※ 숫자만 입력하세요. 재고가 0일 경우 soldout이 됩니다.</span></li>
		</ul>
		<ul>
			<li>판매 유/무</li>
			<li><label class="product_label"> <input type="radio"
					name="sellok" id="sellok" value="Y" style="vertical-align: -1px;"
					checked> 판매시작
			</label> <label class="product_label"> <input type="radio"
					name="sellok" id="sellok2" value="N" style="vertical-align: -1px;">
					판매종료
			</label></li>
		</ul>
		<ul>
			<li>조기품절</li>
			<li><label class="product_label"> <input type="radio"
					name="soldout" id="soldout" value="Y" style="vertical-align: -1px;">
					사용
			</label> <label class="product_label"> <input type="radio"
					name="soldout" id="soldout2" value="N"
					style="vertical-align: -1px;" checked> 미사용
			</label></li>
		</ul>
		<ul style="height: 160px;">
			<li>상품 대표이미지</li>
			<li>
				<ol style="width: 100%; height: auto;">
					<li style="width: 100%; height: 45px;">
					<input type="file" name="image1" id="image1"> <span
						class="help_text">※ 상품 대표이미지 이며, 이미지 용량은 2MB 까지 입니다.</span></li>
					<li style="height: 45px;">
					<input type="file" name="image2" id="image2"> <span
						class="help_text">※ 추가 이미지 이며, 이미지 용량은 2MB 까지 입니다.</span></li>
					<li style="height: 45px;">
					<input type="file" name="image3" id="image3"> <span
						class="help_text">※ 추가 이미지 이며, 이미지 용량은 2MB 까지 입니다.</span></li>
				</ol>
			</li>
		</ul>
		<ul style="height: 400px;">
			<li>상품 상세설명</li>
			<li><textarea class="product_text1" name="info" id="info"></textarea>
				</li>
		</ul>
	</div>
	<div class="subpage_view4" style="text-align: center;">
		<input type="button" value="상품 리스트" title="상품 리스트"
			class="p_button p_button_color1" style="margin-right: 5px;"
			onclick="lists()"> <input type="button" value="상품 등록"
			title="상품 등록" class="p_button p_button_color2" onclick="pro_ok()">
		</span>
	</div>
</form>
<script>
            CKEDITOR.replace("info",{
            	height :290,
            	width: '100%'
            });
            </script>
<script>
	function calcs(z) {
		if(f.payment.value==""){
			alert("할인율 적용시 판매가격 1000원 이상 입력하세요");
		}else{
			var payment = Number(f.payment.value);
			var sale= Number(z);
			var total = "";
			
			total = payment -(payment* (sale/100));
			f.paysale.value = total;
		}
	}


	function codeck() {
		var code = f.code.value;
		if(code==""){
			alert("상품코드를 입력하셔야 합니다.")
		}else{	
			
		
		var http;
		if(window.XMLHttpRequest){
			http=new XMLHttpRequest ();
		}
		http.onreadystatechange = function(data){
			if(http.readyState==XMLHttpRequest.DONE){
			if(http.status==200){
				var result =http.response;
				if(result=="no"){
					alert("상품코드가 중복됩니다.");
					f.code.value=""; 
				}else{
					f.code.readOnly = true;
					f.codeok.value="ok";
					alert("사용가능한 상품코드입니다.");
				}
			}
			}
		}
		
		http.open("GET","./codeck.do?code="+code,true);
		http.send();
	}
	}
	
	
function pro_ok() {
	var BMcate = document.getElementById("BMcate").value;
	var SMcate = document.getElementById("SMcate").value;
	var code = document.getElementById("code").value;
	var proname = document.getElementById("proname").value;
	var plusinfo = document.getElementById("plusinfo").value;
	var payment = document.getElementById("payment").value;
	var sale= document.getElementById("sale").value;
	var paysale= document.getElementById("paysale").value;
	var save_pro = document.getElementById("save_pro").value;
	var sellok = document.getElementById("sellok").value;
	var soldout = document.getElementById("soldout").value;
	var image1 = document.getElementById("image1").value;
	var image2 = document.getElementById("image2").value;
	var image3 = document.getElementById("image3").value;
	var info = document.getElementById("info").value;
	
	
	if(BMcate==""){
		alert("대메뉴 카테고리를 입력하세요");	
	}else if(code==""){
		alert("상품코드를 입력하세요");	
	}else if(proname==""){
		alert("상품명을 입력하세요");	
	}else if(plusinfo==""){
		alert("상품 부가설명을 입력하세요");	
	}else if(payment==""){
		alert("판매가격을 입력하세요");	
	}else if(sale==""){
		alert("할인율을 입력하세요");	
	}else if(save_pro==""){
		alert("상품재고를 입력하세요");
	}
	else{
			if(isNaN(payment)==true){
				alert("판매가격은 숫자만 입력하세요");
			}else if(Number(payment)<1000){
				alert("판매가가격은 최소한 1000원 이상 이어야 합니다.");
			}else{
				if(document.getElementById("codeok").value==""){
					alert("상품코드 중복체크 하시길 바랍니다.");					
				}
				else{
				var w =1;
				var ct = 0;
				while(w<4){
					var filenm =document.getElementById("image"+w).value;
					
					if(filenm!=""){
					var propery = filenm.slice(filenm.indexOf(".")+1).toLowerCase();	//속성명을 소문자로 변환
					
					if(propery!="jpg" && propery!="bmp" && propery!="gif" && propery!="png" && propery!="webp" && propery!="jpeg"){
						alert("파일첨부에는 이미지 파일만 사용하시길 바랍니다.");
						document.getElementById("image"+w).value="";
					}else{
						ct++;
					}
					
					}
					w++;
				}
				var gopage = "yes";
				var z =1;
				while(z<=ct){
				
					var ck = document.getElementById("image"+ct).value;
					if(ck==""){
						alert("파일 첨부는 순서대로 첨부하시길 바랍니다.");
						gopage="no";
					}
					z++;
				}
				if(gopage=="yes"){
					if(sale==0 || sale==""){	
						f.paysale.value=0;
					}	
					f.submit();		
				}
					
				}
			}
		}
	
}
	
function lists() {
location.href="./admin_product.jsp?codename=&&word=";
}

</script>