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
<h2>INNER JOIN의 결과</h2>
<table border="1">
	<tr><th>고객 번호</th><th>고객 이름</th><th>예약 번호</th><th>예약 시간</th></tr>
	<c:forEach var="data" items="${list}">
	<tr><td>${data[0].userId }</td><td>${data[0].name }</td>
		<td>${data[1].reservationId }</td><td>${data[1].timestamp }</td></tr>
	</c:forEach>
</table>
</div>
</body>
</html>







