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
				alert("댓글 수정 완료.");
				window.top.location.replace("/board/detail.html?postId=" + ${postId});
			},100);
		</script>

</body>
</html>