<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
	<head>
		<meta charset="utf-8">
		<title>Welcome</title>
	</head> 
	<body>
		<c:url value="/innerjoin/index.html" var="messageUrl1" />
		<a href="${messageUrl1}">INNER JOIN 결과 보기</a><br/>
		<c:url value="/innerjoinfetch/index.html" var="messageUrl2" />
		<a href="${messageUrl2}">INNER JOIN FETCH 결과 보기</a><br/>
		
		<c:url value="/leftouterjoin/index.html" var="messageUrl3" />
		<a href="${messageUrl3}">LEFT OUTER JOIN 결과 보기</a><br/>
		<c:url value="/leftouterjoinfetch/index.html" var="messageUrl4" />
		<a href="${messageUrl4}">LEFT OUTER JOIN FETCH 결과 보기</a><br/>
	</body>
</html>



















