<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과일 상세 정보</title>
<link rel="stylesheet" type="text/css" href="../css/3-5.css">
</head>
<body>
<div align="center" class="body">
<%@ include file="/WEB-INF/jsp/menu_header.jsp" %>
<h2>과일 상세 화면</h2>
<table>
	<tr><td><img alt="" src="../img/${item.image_name }"></td>
		<td align="center">
		<table>
			<tr height="50"><td width="80">상품명</td>
					<td width="160">${item.title }</td></tr>
			<tr height="50"><td width="80">가 격</td>
					<td width="160">${item.price }</td></tr>
			<tr height="50"><td width="80">설 명</td>
					<td width="160">${item.info }</td></tr>
			<tr><td colspan="2" align="center" width="230">
				<form action="../cart/cartAdd.html">
					<input type="hidden" name="itemId" value="${item.seqno }"/>
					<table>
						<tr><td><select name="quantity"><option>1</option>
							<option>2</option><option>3</option><option>4</option>
							<option>5</option><option>6</option><option>7</option>
							</select>&nbsp;개</td>
							<td><input type="submit" value="카트에 담기"/></td>
						</tr>
					</table>
				</form>
				</td></tr>	
			<tr><td colspan="2" align="center" width="240">
				<a href="../index/index.html">■ 목록으로 돌아가기</a></td></tr>
		</table></td></tr>
</table>
</div>
</body>
</html>






