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
<h2>회 원 정 보</h2>

<table border="1">
<tr><th>계 정</th><td>${user.user_id }</td></tr>
<tr><th>이 름</th><td>${user.name }</td></tr>
<tr><th>암 호</th><td><input type="password" name="PWD" value="${user.user_pwd }"/>
				</td></tr>
<tr><th>주 소</th><td><input type="text" name="ADDR" value="${user.addr }"/></td></tr>
<tr><th>전화번호</th><td><input type="text" name="PHONE" value="${user.phone }"/></td></tr>
<tr><th>성 별</th><td><c:if test="${user.gender == 'M' }">남</c:if>
					<c:if test="${user.gender == 'F'}">여</c:if></td></tr>
<tr><th>등 급</th><td><input type="text" name="GRADE" value="${user.grade }"/></td></tr>
<tr><th>이메일</th><td>${user.email }</td></tr>
<tr><th>생 일</th><td>${user.birth }</td></tr>
<tr><th>직 업</th><td>${user.job }</td></tr>

</table><br/><a href="/userlist">목록으로</a>
</div>
</body>
</html>