<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h2>LEFT OUTER JOIN 결과</h2>
<table border="1">
	<tr><th>사용자 번호</th><th>사용자 이름</th><th>예약번호</th><th>예약일</th></tr>
	<c:forEach var="data" items="${list }">
	<tr><td>${data[0].userId }</td><td>${data[0].name }</td>
		<td>${data[1].reservationId }</td><td>${data[1].timestamp }</td></tr>
	</c:forEach>
</table>
</div>
</body>
</html>













