<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body><div align="center" class="body">
<h2>��ǰ �Է� �Ϸ�</h2>
<b><font color="red">��ǰ �Է��� �Ϸ�Ǿ����ϴ�</font></b>
<table border="1" style="text-align: center;">
	<tr height="40px"><td>��ǰ�ڵ�</td><td>${item.item_code }</td></tr>
	<tr height="40px"><td>��ǰ��</td><td>${item.item_title }</td></tr>
	<tr height="40px"><td>��ǰ ����</td><td>${item.price }</td></tr>
	<tr height="40px"><td>��ǰ ����</td><td>${item.item_spec}</td></tr>
	<tr height="40px"><td>������</td><td>${item.madeIn }</td></tr>
	<tr height="40px"><td>�����</td><td>${item.reg_date }</td></tr>
</table>
</div>
</body>
</html>

