<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ include file="dbconnect.jsp" %>
<%
    request.setCharacterEncoding("utf-8");

   	String codename =request.getParameter("codename");
   	String word =request.getParameter("word");
   	String sql = null;
	 if(codename.equals("pdnm") && !word.equals("")){
	 sql = "SELECT * FROM pro WHERE proname LIKE '%"+word+"%'";		 
	 }else if(codename.equals("pdcode")&&!word.equals("")){
	sql = "select * from pro where code like '%"+word+"%'";
	 }else{
    sql = "select * from pro ";
 }
	
    PreparedStatement ps = con.prepareStatement(sql);		 
    ResultSet rs = ps.executeQuery();
    String sql2 = "select count(*) as ctn from pro order by idx desc";  
    PreparedStatement ps2 = con.prepareStatement(sql2);		 
    ResultSet rs2 = ps2.executeQuery();
    int ea = 0;
    while(rs2.next()){
    	ea = Integer.parseInt(rs2.getString("ctn"));
    }
	
    int total=0;
    %>   
<meta charset="UTF-8">
<p>상품관리 페이지</p>
<div class="subpage_view">
    <span>등록된 상품 <%=ea %>건</span>
    <span>
        <form name="frm" id="frm" method="get" action="./admin_product.jsp" onsubmit="search()" >
        <select class="p_select1" name="codename">
            <option value="pdnm">상품명</option>
            <option value="pdcode">상품코드</option>
        </select>
        <input type="text" class="p_input1" name="word" placeholder="검색어를 입력해 주세요" value="<%=word%>" >
        <input type="submit" value="검색" title="상품검색" class="p_submit">
        </form>
    </span>
</div>
<form name="ff" method="post" action="./delete_pro.do" >
<input type="hidden" name="cont" id="cont" value="0">
<div class="subpage_view2">
    <ul>
        <li><input type="checkbox"id="cbx_chkAll"></li>
        <li>코드</li>
        <li>이미지</li>
        <li>상품명</li>
        <li>카테고리 분류</li>
        <li>판매가격</li>
        <li>할인가격</li>
        <li>할인율</li>
        <li>재고현황</li>
        <li>판매유/무</li>
        <li>품절</li>
        <li>관리</li>
    </ul>
    <% 
    if(ea!=0){
    while(rs.next()){%>
    <ul>
    
        <li><input type="checkbox" name="chk" class="chk" value="<%=rs.getString("idx")%>"></li>
        <li><input type="hidden" name="code" value="<%=rs.getString("code") %>"><%=rs.getString("code") %></li>
        <li><img src=<%=rs.getString("image1")%> style="width:100%; height:30px; object-fit:cover;"></li>
        <li style="font-size: 10px;"><%=rs.getString("proname") %></li>
        <li><%=rs.getString("BMcate") %></li>
        <li><%=rs.getString("payment")%></li>
        <li><%=rs.getString("paysale") %></li>
        <li><%=rs.getString("sale") %>%</li>
        <li><%=rs.getString("save_pro") %></li>
        <li><%=rs.getString("sellok")%></li>
        <li><%=rs.getString("soldout") %></li>
        <li><a href="" style="color: black;">관리</a></li>
    </ul>
     <%
    }
    }else{ %>
    <ul>
        <li style="width: 100%;">등록된 상품이 없습니다.</li>
    </ul>
    <%} %>
    <input type="hidden" name="total" id="total" value="<%=total%>">
</div>
<div class="subpage_view3">
    <ul class="pageing">
        <li><img src="./ico/double_left.svg"></li>
        <li><img src="./ico/left.svg"></li>
        <li>1</li>
        <li><img src="./ico/right.svg"></li>
        <li><img src="./ico/double_right.svg"></li>
    </ul>
</div>

<div class="subpage_view4">
    <input type="button" value="선택상품 삭제" title="선택상품 삭제" class="p_button" onclick="delete2()">
    <span style="float: right;">
    <input type="button" value="신규상품 등록" title="신규상품 등록" class="p_button p_button_color1" onclick="new_pro()">
    <input type="button" value="카테고리 등록" title="카테고리 등록" class="p_button p_button_color2" onclick="new_cate()">
    </span>
</div>
</form>
<script>

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

function delete2() {
	if(document.getElementById("cont").value=="0"){
		alert("삭제하실 상품을 선택하세요");
	}else{
		
	ff.submit();
	}
}
function new_pro() {
	location.href="./admin_product_write.jsp";
	
}
function new_cate() {
	location.href="./admin_category_write.jsp";	
}


</script>