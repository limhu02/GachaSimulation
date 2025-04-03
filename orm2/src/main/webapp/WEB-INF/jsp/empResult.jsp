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
<h2>사원 정보</h2>
<c:if test="${empList==null }">
	<h3>검색된 결과가 존재하지 않습니다.</h3>
</c:if>
<c:if test="${empList !=null }">
	<table border="1">
		<tr><th>사원번호</th><th>사원이름</th><th>입사일</th><th>월급</th><th>부서번호</th><th>부서명</th><th>부서위치</th></tr>
		<c:forEach var="data" items="${empList }">
			<tr><td>${data[0].employee_id }</td><td>${data[0].last_name }</td><td>${data[0].hire_date }</td>
			<td>${data[0].salary }</td><td>${data[1].department_id }</td><td>${data[1].department_name }</td>
			<td>${data[1].location_id }</td></tr>
		</c:forEach>
	</table>
</c:if>
	
</div>

</body>
</html>