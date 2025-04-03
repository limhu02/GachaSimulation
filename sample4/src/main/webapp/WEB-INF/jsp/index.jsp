<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>과일 목록 화면</title>
<link rel="stylesheet" type="text/css" href="css/3-3.css">
</head>
<body>
<div align="center" class="body">
<h2>과일 목록 화면</h2>
<table border="1">
	<tr class="header">
		<th align="center" width="80">상품번호</th>
		<th align="center" width="320">상품이름</th>
		<th align="center" width="100">상품가격</th></tr>
	<c:forEach var="item" items="${guailList }">
	<tr class="record">
		<td align="center">${item.seqno }</td>
		<td align="center">
			<a href="/detail/${item.seqno}">${item.title }</a>
		</td>
		<td align="center">${item.price }</td>
	</tr>
	</c:forEach>
</table>
</div>
</body>
</html>






