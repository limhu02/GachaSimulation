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
<h2>LEFT OUTER JOIN FETCH 결과</h2>
<table border="1">
<tr><th>사용자번호</th><th>사용자이름</th><th>예약 정보</th></tr>
<c:forEach var="data" items="${list }">
<tr><td>${data.userId }</td><td>${data.name }</td>
	<td>
		<table border="1">
			<tr><th>예약 번호</th><th>예약시간</th></tr>
			<c:forEach var="reserv" items="${data.reservations }">
			<tr><td>${reserv.reservationId }</td><td>${reserv.timestamp }</td></tr>
			</c:forEach>			
		</table>
	</td></tr>
</c:forEach>
</table>
</div>
</body>
</html>












