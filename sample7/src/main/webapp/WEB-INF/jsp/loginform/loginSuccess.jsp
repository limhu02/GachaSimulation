<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 결과</title>
</head>
<body>
<div align="center" class="body">
<%@ include file="/WEB-INF/jsp/menu_header.jsp" %>
	<h2>로그인 결과</h2>
	환영합니다~ ${loginUser.userName }님~
</div>
</body>
</html>