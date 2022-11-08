<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="dbconnect.jsp"%>
    <%
request.setCharacterEncoding("utf-8");
String sql = "select * from coupon order by cidx desc";
PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();

String sql2 = "select count(*) as ctn from coupon order by cidx desc";
PreparedStatement ps2 = con.prepareStatement(sql2);
ResultSet rs2 = ps2.executeQuery();
int ea = 0;
while (rs2.next()) {
	ea = Integer.parseInt(rs2.getString("ctn"));
}
String cenum = "Y";
String sql3 = "select count(*) as ctn2 from coupon where cenum='"+cenum+"'";
PreparedStatement ps3 = con.prepareStatement(sql3);
ResultSet rs3 = ps3.executeQuery();
int en = 0;
while (rs3.next()) {
	en = Integer.parseInt(rs3.getString("ctn2"));
}
int w=ea;
%>
<p>쇼핑몰 관리 페이지</p>
<form name="f_cp" id="f_cp" method="post" action="./admin_coupon_config.jsp" >


    <div class="subpage_view">
        <span>※ 쿠폰발행 현황 리스트 | <em>[ 사용중인 쿠폰 <%=en %> ]</em></span>
        <span>
         <ol class="coupon_title">
            <li>번호</li>
            <li>쿠폰명</li>
            <li>쿠폰종류</li>
            <li>사용시작일</li>
            <li>사용종료일</li>
            <li>쿠폰타입</li>
            <li>할인금액</li>
            <li>최소주문금액</li>
         </ol>
         <%if(ea!=0){
	while(rs.next()){
		
	
	%>
         <ol class="coupon_lists">
            <li><%=w %></li>
            <li><%=rs.getString("cname") %></li>
            <li><%=rs.getString("csort") %></li>
            <li><%=rs.getString("cstart").substring(0,10) %></li>
            <li><%=rs.getString("cend").substring(0,10) %></li>
            <li><%=rs.getString("ctype") %></li>
            <%if(rs.getString("ctype").equals("정률할인")){
            	%><li><%=rs.getString("csale") %>%</li>
            <% }else{%>
            <li><%=rs.getString("csale") %></li>
            <%} %>
            <li><%=rs.getString("cminpay") %></li>
         </ol>
        
         <% 
         w--;} 
         }else{%>
         <ol class="coupon_none_lists">
            <li>등록된 쿠폰이 없습니다.</li>
        </ol>
        <%} %>
        </span>
        <span><input type="button" value="쿠폰 등록하기" class="shopping_btn" onclick="insert_cp()"></span>
    </div>
    </form>
    <div class="subpage_view">
        <span>※ 팝업창 현황 리스트 </span>
        <span>
         <ol class="popup_title">
            <li>번호</li>
            <li>팝업명</li>
            <li>팝업 창크기</li>
            <li>링크</li>
            <li>사용시작일</li>
            <li>사용종료일</li>
         </ol>
         <ol class="popup_lists">
            <li>1</li>
            <li>가을신상품 소개</li>
            <li>300 * 200</li>
            <li>http://</li>
            <li>2022-09-01</li>
            <li>2022-09-30</li>
         </ol>
         <ol class="coupon_none_lists">
            <li>등록된 팝업창이 없습니다.</li>
        </ol>
        </span>
        <span><input type="button" value="팝업창 등록하기" class="shopping_btn" onclick="insert_pu()"></span>
    </div>
    
<script>
function insert_cp() {
	f_cp.submit();
}
function insert_pu() {
	location.href="./service";
}
</script>