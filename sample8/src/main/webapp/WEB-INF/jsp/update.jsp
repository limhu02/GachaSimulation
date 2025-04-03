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
<title><spring:message code="itemEdit.title"/></title>
</head>
<body>
<div align="center" class="body">
<h2><spring:message code="itemEdit.title"/></h2>
<form:form modelAttribute="item" action="update.html" method="post" 
					enctype="multipart/form-data">
<form:hidden path="seqno"/>
<form:hidden path="image_name"/>
<table>
	<tr height="40px"><th>상품이름</th><td><form:input path="title" cssClass="title"
			maxlength="30"/></td></tr>
	<tr height="40px"><th>상품가격</th><td><form:input path="price" cssClass="price"
			maxlength="8"/>&nbsp;원</td></tr>
	<tr height="40px"><th>파 일</th><td><input type="file" name="picture"/></td></tr>
	<tr height="40px"><th>상품설명</th>
			<td><form:textarea path="info" cssClass="info"/></td></tr>
</table><br/>
	<input type="submit" value="변 경"/> <input type="reset" value="취 소"/>
</form:form><a href="index.html">돌아가기</a>
</div>
</body>
</html>














