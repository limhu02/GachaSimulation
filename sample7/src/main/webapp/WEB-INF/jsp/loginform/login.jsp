<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<link rel="stylesheet" type="text/css" href="../css/3-6.css">
</head>
<body>
<div align="center" class="body">
<%@ include file="/WEB-INF/jsp/menu_header.jsp" %>
<form:form action="/loginform/login.html" method="post" modelAttribute="user">
<spring:hasBindErrors name="user">
	<font color="red">
		<c:forEach var="error" items="${errors.globalErrors }">
			<spring:message code="${error.code }"/>
		</c:forEach>
	</font>
</spring:hasBindErrors>
<table>
	<tr height="40px"><th>사용자ID</th><td><form:input path="userId" cssClass="userId"/>
		<font color="red"><form:errors path="userId"/></font></td></tr>
	<tr height="40px"><th>암 호</th><td><form:password path="password" cssClass="password"/>
		<font color="red"><form:errors path="password"/></font>
</table>
<table>
	<tr><td align="center"><input type="submit" value="로그인"/></td>
		<td align="center"><input type="reset" value="취 소"/></td></tr>
</table>
</form:form>
<a href="../userentryform/userEntry.html">■ 신규 가입자 등록</a>
</div>
</body>
</html>














