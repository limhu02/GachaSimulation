<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code="itemAdd.title"/></title>
<link rel="stylesheet" type="text/css" href="../css/3-7.css">
</head>
<body>
<div align="center" class="body">
<h2><spring:message code="itemAdd.title"/></h2>
<form:form method="post" action="register.html" modelAttribute="item" 
		enctype="multipart/form-data" >
<table>
	<tr height="40px"><th>상품번호</th><td><form:input path="seqno" cssClass="itemId"
	maxlength="20"/></td><td><font color="red"><form:errors path="seqno"/></font></td></tr>
	<tr height="40px"><th>상품이름</th><td><form:input path="title" cssClass="itemName"
	maxlength="30"/></td><td><font color="red"><form:errors path="title"/></font></td></tr>
	<tr height="40px"><th>상품가격</th><td><form:input path="price" cssClass="price"
	maxlength="10"/></td><td><font color="red"><form:errors path="price"/></font></td></tr>
	<tr height="40px"><th>이미지 파일</th><td><input type="file" name="picture"></td>
		<td><font color="red"><form:errors path="picture"/></font></td></tr>
	<tr height="40px"><th>상품설명</th><td><form:textarea path="info" cssClass="info"/></td>
		<td><font color="red"><form:errors path="info"/></font></td></tr>
</table><br/>
<input type="submit" value="등 록"/> <input type="reset" value="취 소"/><br/><br/>
</form:form><a href="index.html">돌아가기</a>
</div>
</body>
</html>













