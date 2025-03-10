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
<h3>정산 결과</h3>
<table border="1">
	<tr><th>뽑기 실행 횟수</th><td>${result.count}</td></tr>
	<tr><th>총 소모 비용</th><td>${result.totalpurchase}</td></tr>
	<tr><th>고등급 아이템 출현 비율</th><td>판당 ${result.highitemrate}</td></tr>
	<tr><th colspan="2"><a href="/gacha/gotoGameList.html">게임 목록으로 돌아가기</a></th></tr>
</table>
</div>
</body>
</html>








