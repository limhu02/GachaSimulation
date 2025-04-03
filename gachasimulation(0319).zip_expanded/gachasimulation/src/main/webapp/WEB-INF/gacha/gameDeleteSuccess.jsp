<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게임 삭제 완료</title>
</head>
<body>

<script type="text/javascript">
    window.onload = function() {
        alert("게임이 성공적으로 삭제되었습니다.");
        window.location.href = "${pageContext.request.contextPath}/board/simulation.html"; // 목록 페이지로 이동
    };
</script>

</body>
</html>
