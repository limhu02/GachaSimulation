<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이템 정보(관리자)</title>
</head>
<body>
<div align="center">
<h3>아이템 정보(관리자)</h3>
<table border="1">
	<tr><th>아이템</th><td>${item.name }</td></tr>
	<tr><th>소속 게임</th><td>${box.game }
	<tr><th>출현 상자</th><td>${box.name }</td></tr>
	<tr><th>등급</th><td>${item.rate }</td></tr>
	<tr><th>확률</th><td>${item.probability} %</td></tr>
	<tr><td colspan="2" align="center">
		<img alt="" src="${pageContext.request.contextPath}/itemImage/${item.image }"
			width="250" height="200"/></td></tr>
	<tr><td colspan="2" align="center">
		<a href="javascript:goModify()">[수정]</a>
		<a href="javascript:goDelete()">[삭제]</a>
		<a href="../item/itemList.html">[목록]</a></td></tr>
</table>
</div>
<form name="frm" method="post">
	<input type="hidden" name="code" value="${item.code}">
</form>
<script type="text/javascript">

function goModify(){
	document.frm.action = "/item/modify.html";
	document.frm.submit();//서블릿 호출
}
function goDelete(){
	document.frm.action = "/item/delete.html";
	document.frm.submit();//서블릿 호출
}
</script>
</body>
</html>









