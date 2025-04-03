<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-16">
<title>상세 정보 보기</title>
<link rel="stylesheet" type="text/css" href="css/3-3.css">
</head>
<body>
<div align="center" class="body">
<h2> 과일 상세 화면</h2>
<table border="1" style="text-align: center">
	<tr><td><img alt="" src="/img/${item.image_name}"></td>
		<td align="center">
		<table border="1" style="text-align: center" >
			<tr height="50"><td width="80">상품명</td>
				<td width="160">${item.title }</td></tr>
			<tr height="50"><td width="80">가격</td>
				<td width="160">${item.price }</td></tr>
			<tr height="50"><td width="80">설 명</td>
				<td width="160">${item.info }</td></tr>
			<tr ><td colspan="2" align="center" width="240"><a href="/guaillist"> ■ 목록으로 돌아가기</a></td></tr>
			
		</table>
		
</table>
</div>
</body>
</html>