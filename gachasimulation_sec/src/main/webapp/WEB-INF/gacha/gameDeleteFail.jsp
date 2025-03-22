<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게임 삭제 실패</title>
</head>
<body>

<script type="text/javascript">
    window.onload = function() {
        alert("해당 게임에 연결된 아이템박스가 존재하여 삭제할 수 없습니다.\n아이템박스를 먼저 삭제해주세요.");
        window.location.href = "${pageContext.request.contextPath}/board/simulation.html"; // 목록 페이지로 이동
    };
</script>

</body>
</html>
