<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3 align="center">상품 등록</h3>
<div align="center">
<script type="text/javascript">

</script>
<form:form action="/inputitem" method="post" modelAttribute="item" name="itemFrm">

	<table border="1">
	<tr><th>상품코드</th><td><form:input path="item_code"/>
			<font color="red" size="2"><form:errors path="item_code"/></font></td></tr>
	<tr><th>상품이름</th><td><form:input path="item_title"/>
			<font color="red"><form:errors path="item_title"/></font></td></tr>
	<tr><th>상품가격</th><td><form:input path="price"/>
			<font color="red"><form:errors path="price"/></font></td></tr>
	<tr><th>원산지</th><td><form:select path="madeIn">
		<c:forEach var="nation" items="${NATIONS }">
			<form:option value="${nation.code }">${nation.name }</form:option>
		</c:forEach></form:select></td></tr>
	<tr><th>상품설명</th><td><form:textarea path="item_spec" rows="5" cols="40"/>
			<font color="red"><form:errors path="item_spec"/></font></td></tr>
	<tr><td colspan="2" align="center"><input type="submit" value="상품 등록"/>
		<input type="reset" value="취 소"/></td></tr>
	</table>
</form:form>
</div>
</body>
</html>













