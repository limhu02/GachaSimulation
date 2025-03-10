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
			setTimeout(function(){
				alert("댓글 삭제 완료.");
				location.href="/board/detail.html?postId=${postId}";
			},100);
		</script>

</body>
</html>