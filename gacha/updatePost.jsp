<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        text-align: center;
        background-color: white;
    }
    .post-container {
        width: 60%;
        margin: 40px auto;
        text-align: left;
        border: 1px solid #ddd;
        padding: 20px;
        background-color: #f9f9f9;
    }
    .form-group {
        margin-bottom: 15px;
    }
    .form-group label {
        font-weight: bold;
    }
    .form-group input, .form-group textarea {
        width: 100%;
        padding: 8px;
        border: 1px solid #ccc;
    }
    .buttons {
        margin-top: 15px;
    }
    .buttons button {
        padding: 8px 12px;
        border: none;
        cursor: pointer;
        margin-right: 5px;
    }
    .submit-btn {
        background-color: green;
        color: white;
    }
    .cancel-btn {
        background-color: gray;
        color: white;
    }
</style>
</head>
<body>
<div class="post-container">
    <h2>게시글 수정</h2>
    
    <form action="/board/updatePostProcess.html" method="post">
        <!-- 기존 postId를 유지 -->
        <input type="hidden" name="postId" value="${post.postId}">

        <div class="form-group">
            <label for="title">제목</label>
            <input type="text" id="title" name="title" value="${post.title}" required>
        </div>

        <div class="form-group">
            <label for="content">내용</label>
            <textarea id="content" name="content" rows="5" required>${post.content}</textarea>
        </div>

        <div class="buttons">
            <button type="submit" class="submit-btn">수정하기</button>
            <button type="button" class="cancel-btn" onclick="history.back();">취소</button>
        </div>
    </form>
</div>
</body>
</html>
