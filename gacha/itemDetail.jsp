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
<div align="center">
<h3>이미지 게시글 상세보기</h3>
<table border="1">
	<tr><th>아이템</th><td>${item.name }</td></tr>
	<tr><th>소속 게임</th><td>${box.game }
	<tr><th>출현 상자</th><td>${box.name }</td></tr>
	<tr><th>등급</th><td>${item.rate }</td></tr>
	<tr><th>확률</th><td>${item.probability}</td></tr>
	<tr><td colspan="2" align="center">
		<img alt="" src="${pageContext.request.contextPath}/upload/${item.image }"
			width="250" height="200"/></td></tr>
	
	<tr><td colspan="2" align="center"><a href="../item/itemList.html">[목록]</a></td></tr></table>
</div>
</body>
</html>






