<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
alert("주문정보가 변경되었습니다.");
location.href="/admin/order.html?ID=${user_id}";
</script>
</body>
</html>