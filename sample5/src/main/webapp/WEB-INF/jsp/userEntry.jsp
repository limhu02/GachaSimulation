<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입자 등록 화면</title>
</head>
<body>
<h2 align="center">가입자 등록</h2>
<div align="center" class="body">
<form:form action="/userentry" method="post" modelAttribute="user">
<spring:hasBindErrors name="user">
	<font color="red">
		<c:forEach var="error" items="${errors.globalErrors }">
			<spring:message code="${error.code }"/>
		</c:forEach>
	</font>
</spring:hasBindErrors>
<table>
	<tr height="40px"><td>가입자ID</td><td><form:input path="userId" maxlength="20"
			cssClass="userId"/><font color="red"><form:errors path="userId"/></font></td></tr>
	<tr height="40px"><td>암 호</td><td><form:password path="password" maxlength="20"
			cssClass="password"/><font color="red"><form:errors path="password"/></font></td></tr>
	<tr height="40px"><td>이 름</td><td><form:input path="userName" maxlength="20"
			cssClass="userName"/><font color="red"><form:errors path="userName"/></font></td></tr>
	<tr height="40px"><td>주 소</td><td><form:input path="address" maxlength="20"
			cssClass="address"/><font color="red"><form:errors path="address"/></font></td></tr>
	<tr height="40px"><td>이메일</td><td><form:input path="email" maxlength="20"
			cssClass="email"/><font color="red"><form:errors path="email"/></font></td></tr>
	<tr height="40px"><td>직 업</td><td><form:select path="job" cssClass="job">
		<form:option value="회사원" label="회사원"/><form:option value="학생" label="학생"/>
		<form:option value="주부" label="주부"/><form:option value="기타" label="기타"/>
		</form:select></td></tr>
	<tr height="40px"><td>생년월일</td><td><form:input path="birthday" maxlength="10"
			cssClass="birthday"/><font color="red"><form:errors path="birthday"/></font></td></tr>
</table>
<table>
	<tr><td height="40px" align="center"><input type="submit" value="등록" name="btnSubmit"/></td>
		<td height="40px" align="center"><input type="reset" value="취소" name="btnCancel"/></td>
	</tr>
</table>
</form:form>
</div>
</body>
</html>













