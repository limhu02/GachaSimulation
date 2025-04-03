<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입자 가입 완료 화면</title>
</head>
<body>
<%@ include file="/WEB-INF/jsp/menu_header.jsp" %>
<div align="center" class="body">
<h2>가입자 가입 완료</h2>
<b><font color="red">가입이 완료되었습니다~</font></b>
<table>
	<tr height="40px"><td>가입자ID</td><td>${user.userId }</td></tr>
	<tr height="40px"><td>암 호</td><td>${user.password }</td></tr>
	<tr height="40px"><td>이 름</td><td>${user.userName }</td></tr>
	<tr height="40px"><td>주 소</td><td>${user.address }</td></tr>
	<tr height="40px"><td>이메일</td><td>${user.email }</td></tr>
	<tr height="40px"><td>직 업</td><td>${user.job }</td></tr>
	<tr height="40px"><td>생년월일</td><td>${user.birthday }</td></tr>
</table>
</div>
</body>
</html>











