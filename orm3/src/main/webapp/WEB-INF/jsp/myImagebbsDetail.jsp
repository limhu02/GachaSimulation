<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h2>내가 작성한 글 정보</h2>
<table border="1">
	<tr><th>글번호</th><th>글제목</th><th>작성일</th></tr>
	<tr><td>${bbs.w_id }</td><td>${bbs.title }</td><td>${bbs.w_date }</td></tr>
	<tr><td colspan="3">글 내용</td></tr>
	<tr><td colspan="3"><textarea rows="5" cols="40" 
		readonly="readonly">${bbs.content }</textarea></td></tr>
</table>
</div>
</body>
</html>














