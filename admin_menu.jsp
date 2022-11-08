<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<meta charset="UTF-8">
<div class="nav_div">
<script type="text/javascript">
function abc() {
	location.href="./admin_config.jsp";
}
function efg() {
	location.href="./admin_notice.jsp";
}
function list() {
	location.href="./admin_product.jsp?codename=&word=";
}
function shop() {
	location.href="./admin_shopping.jsp";
}
function management() {
	location.href="./admin_main.jsp";
}
function service() {
	location.href="./service";
}
</script>
    <ol>
        <li title="쇼핑몰 기본설정" onclick="abc()"	 >쇼핑몰 기본설정</li>
        <li title="회원관리" onclick="management()">회원관리</li>
        <li title="공지사항" onclick="efg()">공지사항</li>
        <li title="쇼핑몰관리" onclick="shop()">쇼핑몰관리</li>
        <li title="상품리스트" onclick="list()">상품리스트</li>
        <li title="주문내역" onclick="service()">주문내역</li>
        <li title="매출내역" onclick="service()">매출내역</li>
    </ol>
</div>