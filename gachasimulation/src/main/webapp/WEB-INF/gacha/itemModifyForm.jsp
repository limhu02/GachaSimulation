<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>   
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
	<form:form modelAttribute="item" method="post" action="../item/update.html" enctype="multipart/form-data" >
	<input type="hidden" name="code" value="${item.code}" />
	<input type="hidden" name="image" value="${item.image }"/>
	<tr><th>아이템</th><td><form:input path="name"/></td></tr>
	<tr><th>소속 게임</th><td></td></tr>
	<tr><th>출현 상자</th><td>${item.box_code}</td></tr>
	<tr><th>등급</th><td><form:input path="rate"/></td></tr>
	<tr><th>확률</th><td><form:input path="probability"/></td></tr>
	<tr><th>이미지</th><td><input type="file" name="imagefile"/>
		<font color="red"><form:errors path="imagefile"/></font></td></tr>
	
	
	<tr><td colspan="2" align="center">
		<input type="submit" value="[수정]"/>
	</form:form>	
		<form action="../item/delete.html" method="post" onsubmit="return check()">
		<input type="submit" value="[삭제]"/>
		</form>
		<a href="../item/itemList.html">[목록]</a></td></tr>
		
</table>
</div>
<script type="text/javascript">
function check(){
	if( ! confirm("정말로 삭제하시겠습니까?")) {
		return false;
	}
	return true;
}
</script>
</body>
</html>









