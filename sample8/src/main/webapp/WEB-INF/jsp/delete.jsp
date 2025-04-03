<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code="itemDelete.title"/></title>
<link rel="stylesheet" type="text/css" href="../css/3-7.css">
</head>
<body>
<div align="center" class="body">
<h2><spring:message code="itemDelete.title"/></h2>
<form:form modelAttribute="item" action="delete.html" onsubmit="return deleteConfirm()" method="post">
<form:hidden path="seqno"/>
<table>
	<tr height="40px"><th>상품이름</th><td><form:input path="title" cssClass="title"
		disabled="true"/></td></tr>
	<tr height="40px"><th>상품가격</th><td><form:input path="price" cssClass="price"
		disabled="true"/>&nbsp;원</td></tr>
	<tr height="40px"><th>파일</th><td><img alt="" width="210" height="240"
		src="${pageContext.request.contextPath }/upload/${imageName}"/></td></tr>
	<tr height="40px"><th>상품설명</th><td><form:textarea path="info" cssClass="info"
		disabled="true"/></td></tr>
</table><br/>
<input type="submit" value="삭 제"/><br/>
</form:form><a href="index.html">돌아가기</a>
</div>
<script type="text/javascript">
function deleteConfirm(){
	if( ! confirm("정말로 삭제하시겠습니까?")) return false;
}
</script>
</body>
</html>














