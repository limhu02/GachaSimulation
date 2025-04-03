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
<h2>회원 조회 목록</h2>
<table border="1">
<tr><th>계정</th><th>이름</th><th>이메일</th>
	</tr>
<c:forEach var="member" items="${userList}">
<tr><td><a href="../userlist/userDetail.html?id=${member.userId }">${member.userId }</a></td>
	<td>${member.userName }</td>
	<td>${member.email }</td>
</tr>
</c:forEach>	
</table><br/>
</div>
</body>
</html>












