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
<title><spring:message code="itemMenu.title"/></title>
<link rel="stylesheet" type="text/css" href="../css/3-7.css">
</head>
<body>
<div align="center" class="body">
<h2><spring:message code="itemMenu.title"/></h2>
<form:form action="search.html" method="post">
상품명 검색 <input type="text" name="itemName"/>
<input type="submit" value="검색"/><a href="create.html">상품 등록</a>
</form:form>
<table border="1">
<tr class="header"><th align="center" width="80">상품번호</th>
	<th align="center" width="270">상품명</th>
	<th align="center" width="150">상품가격</th>
	<th align="center" width="80">편 집</th>
	<th align="center" width="80">삭 제</th></tr>
	<c:forEach items="${itemList }" var="item">
	<tr class="record"><td align="center">${item.seqno }</td>
		<td align="left">${item.title }</td>
		<td align="right"><fmt:formatNumber type="currency" currencySymbol="￦"
			value="${item.price }"/>원</td>
		<td align="center"><a href="edit.html?itemId=${item.seqno}">상품 편집</a></td>
		<td align="center"><a href="confirm.html?itemId=${item.seqno }">상품 삭제</a></td></tr>
	</c:forEach>
</table>
</div>
</body>
</html>













