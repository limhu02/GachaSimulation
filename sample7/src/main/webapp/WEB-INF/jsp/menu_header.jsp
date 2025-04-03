<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div align="center">
<table class="header">
	<tr><td width="140"><a href="../index/index.html">■ 과일목록</a></td>
	<td width="140"><a href="../userlist/userList.html">■ 회원목록</a></td>
		<td width="140"><a href="../checkout/checkout.html">■ 계산하러 가기</a></td>
		<td width="140"><a href="../cart/cartConfirm.html">■ 카트 확인하기</a></td>
		<td width="140"><a href="../cart/cartClear.html">■ 카트비우기</a></td>
		<td width="140">
			<c:choose>
				<c:when test="${not empty loginUser }">
					<font color="red">
					환영합니다~<br/>${loginUser.userId }님~<br/>
					<a href="../logout/logout.html">■ 로그아웃 하기</a>
					</font>				
				</c:when>
				<c:when test="${empty loginUser }">
					<font color="red">
						<a href="../loginform/login.html">■ 로그인 하기</a>
					</font>
				</c:when>
			</c:choose></td></tr>
</table>
</div>








