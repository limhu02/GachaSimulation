<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>수정 완료</title>
</head>
<body>

<script type="text/javascript">
    window.onload = function() {
        alert("계정 정보 수정이 완료되었습니다.");
        location.href = "/admin/userdetail.html?user_id=${user_id}";
    }
</script>

</body>
</html>
