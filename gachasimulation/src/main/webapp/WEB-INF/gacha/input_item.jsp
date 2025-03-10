<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(관리자) 아이템 등록</title>
</head>
<body>
<h3 align="center"> 아이템 등록</h3>
<div align="center">
<script type="text/javascript">

</script>
<form:form action="../item/inputResult.html" method="post" enctype="multipart/form-data" modelAttribute="item" name="itemFrm">

	<table border="1">
	<tr><th>코드</th><td><form:input path="code"/>
			<font color="red" size="2"><form:errors path="code"/></font></td></tr>
	<tr><th>템명</th><td><form:input path="name"/>
			<font color="red"><form:errors path="name"/></font></td></tr>
	<tr><th>이미지</th><td><input type="file" name="imagefile"/>
		<font color="red"><form:errors path="imagefile"/></font></td></tr>
	<tr><th>출현 상자</th><td><form:select path="box_code">
		<c:forEach var="box" items="${boxlist }">
			<form:option value="${box.code }">${box.name }</form:option>
		</c:forEach></form:select></td></tr>
		<tr><th>확률</th><td><form:input path="probability"/>%
			<font color="red"><form:errors path="probability"/></font></td></tr>
		<tr><th>등급</th><td><form:input path="rate"/>
			<font color="red"><form:errors path="rate"/></font></td></tr>
	<tr><td colspan="2" align="center"><input type="submit" value="상품 등록"/>
		<input type="reset" value="취 소"/></td></tr>
	</table>
</form:form>
</div>
</body>
</html>













