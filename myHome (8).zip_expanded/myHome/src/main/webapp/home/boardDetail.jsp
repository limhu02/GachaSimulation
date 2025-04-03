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
<h3 align="center">게시글 상세 정보</h3>
<div align="center">
<form action="/board/modify.html" method="post">
<input type="hidden" name="SEQ" value="${BOARD.seq }">
	<table border="1">
		<tr><th>글제목</th>
			<td>
				<c:choose>
					<c:when test="${sessionScope.loginUser.id != null && 
							sessionScope.loginUser.id == BOARD.id }">
						<input type="text" name="TITLE" value="${BOARD.title }" ></c:when>
					<c:otherwise>${BOARD.title }</c:otherwise>
				</c:choose>
			</td></tr>
		<tr><th>작성자</th><td>${BOARD.id }</td></tr>
		<tr><th>작성일</th><td>${BOARD.write_date }</td></tr>
		<tr><th>글내용</th>
			<td>
				<c:choose>
					<c:when test="${sessionScope.loginUser.id != null && 
							sessionScope.loginUser.id == BOARD.id }">
						<textarea rows="4" cols="40" name="CONTENT">${BOARD.content }</textarea>
					</c:when>
					<c:otherwise>
						<textarea rows="4" cols="40" name="CONTENT" readonly="readonly">${BOARD.content }</textarea>
					</c:otherwise>
				</c:choose>
			</td></tr>
			<c:if test="${sessionScope.loginUser.id != null && 
							sessionScope.loginUser.id == BOARD.id }">
				<tr><td colspan="2" align="center">
					<input type="submit" value="수정" name="BTN"/>
					<input type="submit" value="삭제" name="BTN"/></td></tr>
			</c:if>
	</table>
</form>	
</div>
</body>
</html>











