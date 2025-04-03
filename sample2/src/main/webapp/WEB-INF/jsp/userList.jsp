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
<tr><th>계정</th><th>이름</th><th>주소</th><th>전화번호</th><th>이메일</th><th>성별</th>
	<th>등급</th><th>생일</th><th>직업</th></tr>
<c:forEach var="member" items="${userList}">
<tr><td><a href="/userdetail/${member.user_id }">${member.user_id }</a></td>
	<td>${member.name }</td><td>${member.addr }</td>
	<td>${member.phone }</td><td>${member.email }</td><td>
		<c:if test="${member.gender == 'M' }">남자</c:if>
		<c:if test="${member.gender == 'F'  }">여자</c:if></td>
	<td>${member.grade }</td><td>${member.birth }</td><td>${member.job }</td></tr>
</c:forEach>	
</table>
</div>
</body>
</html>