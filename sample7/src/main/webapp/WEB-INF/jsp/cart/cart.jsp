<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/jsp/menu_header.jsp" %>
<div align="center" class="body">
<h2>카트 확인하기 화면</h2>
<div class="cart">
<table style="font-size: 10px;">
	<tr><td colspan="2"><font color="green">카트에 다음 상품이 들어있습니다.</font></td></tr>
	<c:forEach items="${cart.itemList }" var="itemSet">
	<tr><td>${itemSet.item.title }</td><td>${itemSet.quantity }</td></tr>
	</c:forEach>
</table>
</div><br/>${message }<br/><br/>
</div><a href="../index/index.html">■ 목록으로 돌아가기</a>
<a href="../checkout/checkout.html">■ 계산하러 가기</a>
</body>
</html>








