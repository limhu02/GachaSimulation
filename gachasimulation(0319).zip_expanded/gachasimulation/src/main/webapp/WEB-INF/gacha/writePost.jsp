<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        text-align: center;
        background-color: white;
    }

    .post-container {
        width: 50%;
        margin: 40px auto;
        text-align: left;
        border: 1px solid #ddd;
        padding: 20px;
        border-radius: 8px;
        background-color: #f9f9f9;
    }

    .post-title {
        font-size: 24px;
        font-weight: bold;
        text-align: center;
        margin-bottom: 20px;
    }

    .form-group {
        margin-bottom: 15px;
    }

    .form-group label {
        font-weight: bold;
        display: block;
        margin-bottom: 5px;
    }

    .form-group input,
    .form-group select,
    .form-group textarea {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .form-group textarea {
        height: 150px;
        resize: none;
    }

    .button-group {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }

    .btn {
        padding: 10px 20px;
        font-size: 16px;
        border-radius: 4px;
        cursor: pointer;
        border: none;
        text-decoration: none;
        display: inline-block;
    }

    .btn-submit {
        background-color: #007bff;
        color: white;
        margin-right: 10px;
    }

    .btn-cancel {
        background-color: #f8f9fa;
        color: black;
        border: 1px solid #ccc;
    }

    .btn:hover {
        opacity: 0.8;
    }
</style>
</head>
<body>

<div class="post-container">
    <div class="post-title">게시글 작성</div>
    
    <form action="/board/postEntry.html" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="board">게시판을 선택하세요.</label>
            <select id="board" name="boardCode" required>
                <option value="1">자랑 게시판</option>
                <option value="2">폭망 게시판</option>
                <option value="3">요청/질문 게시판</option>
            </select>
        </div>

        <div class="form-group">
            <label for="title">제목을 입력하세요</label>
            <input type="text" id="title" name="title" required>
        </div>

        <div class="form-group">
            <label for="image">이미지 첨부하기</label>
            <input type="file" id="image" name="image">
        </div>

        <div class="form-group">
            <label for="content">내용을 입력하세요</label>
            <textarea id="content" name="content" required></textarea>
        </div>

        <div class="button-group">
            <button type="submit" class="btn btn-submit">등록</button>
            <a href="/board/priceList.html" class="btn btn-cancel">취소</a>
        </div>
    </form>
</div>

</body>
</html>
