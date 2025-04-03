<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/logout/logout.html">
<font color="red">환영합니다~${sessionScope.loginUser.id }님~</font>
<input type="submit" value="로그아웃">
</form>
</body>
</html>







