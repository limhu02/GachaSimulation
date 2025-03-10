<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록 완료</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        text-align: center;
        background-color: white;
        margin-top: 50px;
    }
    .message-box {
        width: 50%;
        margin: auto;
        padding: 20px;
        border: 1px solid #ccc;
        background-color: #f9f9f9;
        box-shadow: 2px 2px 10px rgba(0,0,0,0.1);
    }
    .message-box h2 {
        color: #337ab7;
    }
    .btn-container {
        margin-top: 20px;
    }
    .btn {
        display: inline-block;
        padding: 10px 20px;
        text-decoration: none;
        color: white;
        background-color: #337ab7;
        border-radius: 5px;
        margin: 5px;
    }
    .btn:hover {
        background-color: #286090;
    }
</style>
</head>
<body>
    <div class="message-box">
        <h2>게시글이 성공적으로 등록되었습니다!</h2>
        <p>게시글이 정상적으로 저장되었습니다.</p>
        <div class="btn-container">
            <a href="/board/priceList.html" class="btn">게시판으로 이동</a>
            <a href="/board/writePost.html" class="btn">새 글 작성</a>
        </div>
    </div>
</body>
</html>
