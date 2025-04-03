<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3 align="center">게시글 목록</h3>
<div align="center">
<table border="1">
	<tr><th>글번호</th><th>작성자</th><th>제 목</th><th>작성일</th></tr>
	<c:forEach var="dto" items="${boardList}">
	<tr><td>${dto.seq}</td>
		<td>${dto.id }</td>
		<td><a href="/detail/${dto.seq }">${dto.title }</a></td>
		<td>${dto.write_date }</td></tr>
	</c:forEach>
</table>

</body>
</html>
