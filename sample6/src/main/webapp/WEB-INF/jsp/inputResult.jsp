<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body><div align="center" class="body">
<h2>상품 입력 완료</h2>
<b><font color="red">상품 입력이 완료되었습니다</font></b>
<table border="1" style="text-align: center;">
	<tr height="40px"><td>상품코드</td><td>${item.item_code }</td></tr>
	<tr height="40px"><td>상품명</td><td>${item.item_title }</td></tr>
	<tr height="40px"><td>상품 가격</td><td>${item.price }</td></tr>
	<tr height="40px"><td>상품 설명</td><td>${item.item_spec}</td></tr>
	<tr height="40px"><td>원산지</td><td>${item.madeIn }</td></tr>
	<tr height="40px"><td>등록일</td><td>${item.reg_date }</td></tr>
</table>
</div>
</body>
</html>

