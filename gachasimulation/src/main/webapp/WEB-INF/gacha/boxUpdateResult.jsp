<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 결과</title>
</head>
<body>
	<script type="text/javascript">
			setTimeout(function(){
				alert("상자 내용 수정 완료");
				location.href="/item/itemBoxManage.html?game=${game}";
			},100);
		</script>

</body>
</html>