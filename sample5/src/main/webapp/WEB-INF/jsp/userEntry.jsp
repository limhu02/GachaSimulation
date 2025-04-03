<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>������ ��� ȭ��</title>
</head>
<body>
<h2 align="center">������ ���</h2>
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
	<tr height="40px"><td>������ID</td><td><form:input path="userId" maxlength="20"
			cssClass="userId"/><font color="red"><form:errors path="userId"/></font></td></tr>
	<tr height="40px"><td>�� ȣ</td><td><form:password path="password" maxlength="20"
			cssClass="password"/><font color="red"><form:errors path="password"/></font></td></tr>
	<tr height="40px"><td>�� ��</td><td><form:input path="userName" maxlength="20"
			cssClass="userName"/><font color="red"><form:errors path="userName"/></font></td></tr>
	<tr height="40px"><td>�� ��</td><td><form:input path="address" maxlength="20"
			cssClass="address"/><font color="red"><form:errors path="address"/></font></td></tr>
	<tr height="40px"><td>�̸���</td><td><form:input path="email" maxlength="20"
			cssClass="email"/><font color="red"><form:errors path="email"/></font></td></tr>
	<tr height="40px"><td>�� ��</td><td><form:select path="job" cssClass="job">
		<form:option value="ȸ���" label="ȸ���"/><form:option value="�л�" label="�л�"/>
		<form:option value="�ֺ�" label="�ֺ�"/><form:option value="��Ÿ" label="��Ÿ"/>
		</form:select></td></tr>
	<tr height="40px"><td>�������</td><td><form:input path="birthday" maxlength="10"
			cssClass="birthday"/><font color="red"><form:errors path="birthday"/></font></td></tr>
</table>
<table>
	<tr><td height="40px" align="center"><input type="submit" value="���" name="btnSubmit"/></td>
		<td height="40px" align="center"><input type="reset" value="���" name="btnCancel"/></td>
	</tr>
</table>
</form:form>
</div>
</body>
</html>













