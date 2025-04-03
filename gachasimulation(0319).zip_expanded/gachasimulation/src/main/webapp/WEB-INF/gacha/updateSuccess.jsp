<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>수정 완료</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; background-color: white; }
        .message-container { margin-top: 100px; padding: 20px; border: 1px solid #ddd; display: inline-block; }
        .message-container h2 { color: green; }
        .btn { margin-top: 15px; padding: 10px 20px; border: none; cursor: pointer; background-color: blue; color: white; }
    </style>
</head>
<body>

<div class="message-container">
    <h2>✅ 수정이 완료되었습니다.</h2>
    <p>게시글이 성공적으로 수정되었습니다.</p>
    <button class="btn" onclick="location.href='/board/priceList.html'">확인</button>
</div>

</body>
</html>
