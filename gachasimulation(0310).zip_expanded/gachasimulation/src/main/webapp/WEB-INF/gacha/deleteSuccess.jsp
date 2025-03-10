<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>완료</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; background-color: white; }
        .message-container { margin-top: 100px; padding: 20px; border: 1px solid #ddd; display: inline-block; }
        .message-container h2 { color: green; }
        .btn { margin-top: 15px; padding: 10px 20px; border: none; cursor: pointer; background-color: blue; color: white; }
    </style>
</head>
<body>

<div class="message-container">
    <h2>✅ 완료되었습니다.</h2>
    <p>작업이 성공적으로 처리되었습니다.</p>
    <button class="btn" onclick="location.href='${prevPage}'">확인</button> <!-- ✅ 이전 페이지로 이동 -->
</div>

</body>
</html>
