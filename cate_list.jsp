<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="dbconnect.jsp" %>
<%
    request.setCharacterEncoding("utf-8");
   	String codename =request.getParameter("codename");
   	String word =request.getParameter("word");
   	String sql = null;
   	if(codename.equals("ctnm") && !word.equals("")){
   	 sql = "SELECT * FROM cate WHERE BMname LIKE '%"+word+"%' or SMname LIKE '%"+word+"%'";		 
   	 }else if(codename.equals("ctcode")&&!word.equals("")){
   	sql = "select * from cate where code like '%"+word+"%'";
   	 }else{
    sql = "select*from cate ";
   	 }
    PreparedStatement ps = con.prepareStatement(sql);		 
    ResultSet rs = ps.executeQuery();
    
    String sql2 = "select count(*) as ctn from cate order by idx desc";
    PreparedStatement ps2 = con.prepareStatement(sql2);
    ResultSet rs2 = ps2.executeQuery();
    int ea = 0;
   
    while (rs2.next()) {
    	ea = Integer.parseInt(rs2.getString("ctn"));
    }
    int total=0;
    %>   
    
<meta charset="UTF-8">
<p>카테고리관리 페이지</p>
<div class="subpage_view">
    <span>등록된 카테고리 <%=ea %>	건</span>
    <span>
        <form name="ff" id="ff" method="get" action="./admin_category.jsp">
        <select class="p_select1" name="codename">
            <option value="ctnm">카테고리명</option>
            <option value="ctcode">카테고리코드</option>
        </select>
        <input type="text" class="p_input1" placeholder="검색어를 입력해 주세요" name="word" value="<%=word%>">
        <input type="submit" value="검색" title="카테고리 검색" class="p_submit"  >
        </form>
    </span>
</div>
<form name="f" id="f" method="post" action="./delete_cate.do">
<input type="hidden" name="cont" id="cont" value="0">
<div class="subpage_view2">
    <ul>
        <li><input type="checkbox"id="cbx_chkAll"></li>
        <li>분류코드</li>
        <li>대메뉴 코드</li>
        <li>대메뉴명</li>
        <li>소메뉴 코드</li>
        <li>소메뉴명</li>
        <li>사용 유/무</li>
        <li>관리</li>
    </ul>
    <%
    if(ea!=0){
    while(rs.next()){ 
    %>

    <ul>
        <li><input type="checkbox"  name="chk" class="chk" value="<%=rs.getString("idx")%>"></li>
        <li style="text-align: left; text-indent: 5px;"><%=rs.getString("code") %></li>
        <li><%=rs.getString("BMcode") %></li>
        <li style="text-align: left; text-indent: 5px;"><%=rs.getString("BMname")%></li>
        <li><%=rs.getString("SMcode") %></li>
        <li style="text-align: left; text-indent: 5px;"><%=rs.getString("SMname") %></li>
        <li><%=rs.getString("cateok") %></li>
        <li> <a href="admin_category_write.jsp?code=<%=rs.getString("code")%>" style="color: black;">관리</a> </li>
    </ul>
    <%
    
    }
    }else{%>
    <ul>
        <li style="width: 100%;">등록된 카테고리가 없습니다.</li>
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
	<input type="hidden" name="codename" value="<%=codename%>">
    <input type="button" value="카테고리 삭제" title="카테고리 삭제" class="p_button" onclick="del_cate()">
    <span style="float: right;">
    <input type="button" value="상품 리스트" title="상품 리스트" class="p_button p_button_color1" onclick="prolist()">
    <input type="button" value="카테고리 등록" title="카테고리 등록" class="p_button p_button_color2" onclick="ins_cate()">
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
function del_cate() {
	if(document.getElementById("cont").value=="0"){
		alert("삭제하실 카테고리를 선택하세요");
	}else{
		
	f.submit();
	}
}
function prolist() {
	location.href="./admin_product.jsp";
}
function ins_cate() {
	location.href="./admin_category_write.jsp"
}
</script>